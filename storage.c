#include <string.h>
#include "storage.h"
#include "fileio.h"
#include "fileio_media.h"
#include "usb.h"
#include "usb_host.h"
#include "usb_host_msd.h"
#include "usb_host_msd_scsi.h"
#include "usb_app.h"
#include "cipher.h"

extern void GetTimestamp(FILEIO_TIMESTAMP *);

#define MAX_CACHED_FILES 50
#define CHUNK_SIZE 512

static uint8_t msdAddress = 0;
static uint8_t driveMounted = 0;
static uint8_t cachedFileCount = 0;
static char cachedFileNames[MAX_CACHED_FILES][13];

static const FILEIO_DRIVE_CONFIG driveConfig = {
    NULL,
    (FILEIO_DRIVER_MediaDetect)USBHostMSDSCSIMediaDetect,
    (FILEIO_DRIVER_MediaInitialize)USBHostMSDSCSIMediaInitialize,
    (FILEIO_DRIVER_MediaDeinitialize)USBHostMSDSCSIMediaDeinitialize,
    (FILEIO_DRIVER_SectorRead)USBHostMSDSCSISectorRead,
    (FILEIO_DRIVER_SectorWrite)USBHostMSDSCSISectorWrite,
    (FILEIO_DRIVER_WriteProtectStateGet)USBHostMSDSCSIWriteProtectState
};

static uint8_t Storage_FindMSD(void) {
    for (uint8_t addr = 1; addr <= USB_MAX_MASS_STORAGE_DEVICES; addr++) {
        if (USBHostMSDDeviceStatus(addr) == USB_MSD_NORMAL_RUNNING) {
            msdAddress = addr;
            return 1;
        }
    }
    return 0;
}

void Storage_Init(void) {
    FILEIO_Initialize();
    FILEIO_RegisterTimestampGet(GetTimestamp);
    driveMounted = 0;
    cachedFileCount = 0;
}

void Storage_UpdateTask(void) {
    USB_SystemInit();
    USB_SystemTasks();

    if (!driveMounted) {
        if (Storage_FindMSD()) {
            FILEIO_ERROR_TYPE err = FILEIO_DriveMount('A', &driveConfig, &msdAddress);
            if (err == FILEIO_ERROR_NONE) {
                driveMounted = 1;
                cachedFileCount = 0;
                FILEIO_SEARCH_RECORD search;
                if (FILEIO_Find("*.*", FILEIO_ATTRIBUTE_ARCHIVE, &search, true) == FILEIO_RESULT_SUCCESS) {
                    do {
                        if (cachedFileCount < MAX_CACHED_FILES) {
                            memcpy(cachedFileNames[cachedFileCount], search.shortFileName, 13);
                            cachedFileCount++;
                        }
                    } while (FILEIO_Find("*.*", FILEIO_ATTRIBUTE_ARCHIVE, &search, false) == FILEIO_RESULT_SUCCESS);
                }
            }
        }
    } else {
        if (!Storage_FindMSD()) {
            FILEIO_DriveUnmount('A');
            driveMounted = 0;
            cachedFileCount = 0;
        }
    }
}

uint8_t Storage_Present(void) {
    return driveMounted;
}

uint8_t Storage_FileCount(void) {
    return cachedFileCount;
}

const char *Storage_FileName(uint8_t index) {
    if (index >= cachedFileCount) return "";
    return cachedFileNames[index];
}

int8_t Storage_ProcessFile(uint8_t index, const char *password, uint8_t pwLen, uint8_t encrypt) {
    if (!driveMounted || index >= cachedFileCount)
        return -1;

    FILEIO_OBJECT src, dst;
    char srcName[13];

    memcpy(srcName, cachedFileNames[index], 13);

    char dstName[13];
    if (encrypt) {
        uint8_t dot = 255, i;
        for (i = 0; srcName[i]; i++)
            if (srcName[i] == '.') dot = i;
        for (i = 0; i < 12 && srcName[i] && srcName[i] != '.'; i++)
            dstName[i] = srcName[i];
        if (dot < 12) {
            if (i + 4 < 12) {
                dstName[i] = '.';
                dstName[i+1] = 'E';
                dstName[i+2] = 'N';
                dstName[i+3] = 'C';
                dstName[i+4] = '\0';
            } else return -1;
        } else {
            if (i + 4 < 12) {
                dstName[i] = '.';
                dstName[i+1] = 'E';
                dstName[i+2] = 'N';
                dstName[i+3] = 'C';
                dstName[i+4] = '\0';
            } else return -1;
        }
    } else {
        uint8_t slen = strlen(srcName);
        if (slen > 4 && srcName[slen-4] == '.' &&
            (srcName[slen-3] == 'E' || srcName[slen-3] == 'e') &&
            (srcName[slen-2] == 'N' || srcName[slen-2] == 'n') &&
            (srcName[slen-1] == 'C' || srcName[slen-1] == 'c')) {
            memcpy(dstName, srcName, slen - 4);
            dstName[slen - 4] = '\0';
        } else {
            return -1;
        }
    }

    if (FILEIO_Open(&src, srcName, FILEIO_OPEN_READ) != 0)
        return -1;

    if (FILEIO_Open(&dst, dstName,
            FILEIO_OPEN_WRITE | FILEIO_OPEN_CREATE | FILEIO_OPEN_TRUNCATE) != 0) {
        FILEIO_Close(&src);
        return -1;
    }

    Cipher_Init(password, pwLen);

    uint8_t chunk[CHUNK_SIZE];
    int16_t result = 0;

    while (!FILEIO_Eof(&src)) {
        uint16_t bytesRead = FILEIO_Read(chunk, 1, CHUNK_SIZE, &src);
        if (bytesRead == 0) break;

        Cipher_Process(chunk, bytesRead);

        uint16_t bytesWritten = FILEIO_Write(chunk, 1, bytesRead, &dst);
        if (bytesWritten != bytesRead) {
            result = -1;
            break;
        }
    }

    FILEIO_Flush(&dst);
    FILEIO_Close(&src);
    FILEIO_Close(&dst);

    return result;
}

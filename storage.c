#include <string.h>
#include "storage.h"
#include "fileio.h"
#include "fileio_media.h"
#include "usb.h"
#include "usb_host.h"
#include "usb_host_msd.h"
#include "usb_host_msd_scsi.h"
#include "usb_app.h"

extern void GetTimestamp(FILEIO_TIMESTAMP *);

#define MAX_CACHED_FILES 50

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

int8_t Storage_LoadFile(uint8_t index) {
    return -1;
}

int8_t Storage_SaveFile(const char *name) {
    return -1;
}

#include "usb.h"
#include "usb_host.h"
#include "usb_host_hid.h"
#include "usb_host_hid_parser.h"
#include "usb_host_msd.h"
#include "fileio.h"
#include "system.h"
#include "usb_app.h"
#include "keyboard.h"
#include <string.h>

/* =========================================================================
 *  Static pool for USB host stack allocations (no heap configured).
 * ======================================================================== */

#define USB_HOST_POOL_SIZE 3072
static uint8_t  usbHostPool[USB_HOST_POOL_SIZE];
static uint16_t usbHostPoolIdx;
static uint8_t  usbInitialized;
static char     usbStatus[40] = "";

void *USBHost_Malloc(size_t size) {
    uint16_t idx = usbHostPoolIdx;
    if (idx & 1) idx++;                         /* 2-byte alignment           */
    if (idx + size > USB_HOST_POOL_SIZE) return NULL;
    usbHostPoolIdx = idx + size;
    return &usbHostPool[idx];
}

/* =========================================================================
 *  Pool management
 * ======================================================================== */

void USB_ResetPool(void) {
    usbHostPoolIdx = 0;
}

/* =========================================================================
 *  System init / tasks
 * ======================================================================== */

void USB_SystemInit(void) {
    if (!usbInitialized) {
        usbHostPoolIdx = 0;
        usbInitialized  = 1;

        /* Direct USB module setup (MLA has no VBUS_ON for PIC24) */
        U1CON    = 0x08;            /* host mode, SOF off         */
        U1OTGCON = 0x3B;            /* VBUS_ON|CHG|D+PD|D-PD      */
        U1CNFG1  = USB_PING_PONG_MODE;
        U1CNFG2  = 0x00;            /* boost, comparator, XCVR on */
        U1PWRC   = 0x01;            /* USB enable, normal op       */

        USBInitialize(0);           /* software state              */
    }
}

void USB_SystemTasks(void) {
    U1OTGCON |= 0x0A;              /* ensure VBUS_ON + VBUS_CHG   */
    USBTasks();
    U1OTGCON |= 0x0A;              /* repeat if HW init clears    */
}

/* =========================================================================
 *  Status string
 * ======================================================================== */

const char* USB_GetStatus(void)   { return usbStatus; }
void        USB_ClearStatus(void)  { usbStatus[0] = '\0'; }

/* =========================================================================
 *  USB application event handler
 * ======================================================================== */

bool USB_ApplicationEventHandler(uint8_t address, USB_EVENT event,
                                 void *data, uint32_t size) {
    switch ((int)event) {
        case EVENT_VBUS_REQUEST_POWER:
        case EVENT_VBUS_RELEASE_POWER:
        case EVENT_HUB_ATTACH:
        case EVENT_UNSUPPORTED_DEVICE:
        case EVENT_UNSPECIFIED_ERROR:
            return true;

        case EVENT_CANNOT_ENUMERATE:
            strcpy(usbStatus, "USB: enum failed");
            return true;

        case EVENT_CLIENT_INIT_ERROR:
            strcpy(usbStatus, "USB: client init err");
            return true;

        case EVENT_OUT_OF_MEMORY:
            strcpy(usbStatus, "USB: out of memory");
            return true;

        case EVENT_HID_RPT_DESC_PARSED:
            return Keyboard_ReportParser();

        case EVENT_HID_ATTACH:
            strcpy(usbStatus, "Kbd connected");
            return true;

        case EVENT_HID_DETACH:
            strcpy(usbStatus, "Kbd disconnected");
            return true;

        case EVENT_HID_BAD_REPORT_DESCRIPTOR:
            strcpy(usbStatus, "Kbd: bad report");
            return true;

        default:
            break;
    }
    return false;
}

bool USB_HID_DataCollectionHandler(void) {
    return true;
}

/* =========================================================================
 *  FAT timestamp stub – always returns 1980-01-01 00:00:00.
 * ======================================================================== */

void GetTimestamp(FILEIO_TIMESTAMP *timestamp) {
    timestamp->date.bitfield.day   = 1;
    timestamp->date.bitfield.month = 1;
    timestamp->date.bitfield.year  = 0;
    timestamp->time.bitfield.hours = 0;
    timestamp->time.bitfield.minutes = 0;
    timestamp->time.bitfield.secondsDiv2 = 0;
    timestamp->timeMs = 0;
}

void __attribute__((interrupt, auto_psv)) _USB1Interrupt(void) {
    USB_HostInterruptHandler();
}

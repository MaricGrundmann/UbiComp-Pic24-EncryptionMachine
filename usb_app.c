#include "usb.h"
#include "usb_host.h"
#include "usb_host_hid.h"
#include "usb_host_hid_parser.h"
#include "usb_host_msd.h"
#include "fileio.h"
#include "system.h"

bool USB_ApplicationEventHandler(uint8_t address, USB_EVENT event, void *data, uint32_t size)
{
    switch ((int)event)
    {
        case EVENT_VBUS_REQUEST_POWER:
            return true;

        case EVENT_VBUS_RELEASE_POWER:
            return true;

        case EVENT_HUB_ATTACH:
        case EVENT_UNSUPPORTED_DEVICE:
        case EVENT_CANNOT_ENUMERATE:
        case EVENT_CLIENT_INIT_ERROR:
        case EVENT_OUT_OF_MEMORY:
        case EVENT_UNSPECIFIED_ERROR:
            return true;

        default:
            break;
    }
    return false;
}

bool USB_HID_DataCollectionHandler(void)
{
    return true;
}

void GetTimestamp(FILEIO_TIMESTAMP *timestamp)
{
    timestamp->date.bitfield.day = 1;
    timestamp->date.bitfield.month = 1;
    timestamp->date.bitfield.year = 0;
    timestamp->time.bitfield.hours = 0;
    timestamp->time.bitfield.minutes = 0;
    timestamp->time.bitfield.secondsDiv2 = 0;
    timestamp->timeMs = 0;
}

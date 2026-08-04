#include "usb.h"
#include "usb_host_hid.h"
#include "usb_host_msd.h"
#include "usb_host_msd_scsi.h"

/* =========================================================================
 *  Media Interface Function Pointer Table for the MSD client driver.
 * ======================================================================== */

CLIENT_DRIVER_TABLE usbMediaInterfaceTable =
{                                           
    USBHostMSDSCSIInitialize,
    USBHostMSDSCSIEventHandler,
    0
};

/* =========================================================================
 *  Client Driver Function Pointer Table for the USB Embedded Host.
 * ======================================================================== */

CLIENT_DRIVER_TABLE usbClientDrvTable[] =
{
    { USBHostMSDInitialize,  USBHostMSDEventHandler,  0 },
    { USBHostHIDInitialize,  USBHostHIDEventHandler,   0 }
};

/* =========================================================================
 *  USB Embedded Host Targeted Peripheral List (TPL).
 * ======================================================================== */

USB_TPL usbTPL[] =
{
    { INIT_CL_SC_P( 8ul, 6ul, 0x50ul ), 0, 0, {TPL_CLASS_DRV} },
    { INIT_CL_SC_P( 8ul, 5ul, 0x50ul ), 0, 0, {TPL_CLASS_DRV} },
    { INIT_CL_SC_P( 3ul, 1ul, 1ul     ), 0, 1, {TPL_CLASS_DRV} },
    { INIT_CL_SC_P( 3ul, 0ul, 0ul     ), 0, 1, {TPL_CLASS_DRV} }
};

#ifndef _USB_CONFIG_H_
#define _USB_CONFIG_H_

#include <xc.h>
#include <stdbool.h>
#include <stdint.h>

#ifndef BOOL
typedef bool BOOL;
#endif

#ifndef TRUE
#define TRUE true
#endif

#ifndef FALSE
#define FALSE false
#endif

/* USB Host Support */
#define USB_SUPPORT_HOST

/* Ping-Pong Buffer Mode */
#define USB_PING_PONG_MODE  USB_PING_PONG__FULL_PING_PONG

/* Host configuration */
#define NUM_TPL_ENTRIES 2
#define USB_NUM_CONTROL_NAKS 200
#define USB_SUPPORT_INTERRUPT_TRANSFERS
#define USB_NUM_INTERRUPT_NAKS 20
#define USB_SUPPORT_BULK_TRANSFERS
#define USB_NUM_BULK_NAKS 20000
#define USB_INITIAL_VBUS_CURRENT (100/2)
#define USB_INSERT_TIME (250+1)
#define USB_HOST_APP_EVENT_HANDLER USB_ApplicationEventHandler
#define USB_ENABLE_TRANSFER_EVENT

/* HID Configuration */
#define USB_MAX_HID_DEVICES 1
#define HID_MAX_DATA_FIELD_SIZE 8
#define APPL_COLLECT_PARSED_DATA USB_HID_DataCollectionHandler

/* MSD Configuration */
#define USB_MAX_MASS_STORAGE_DEVICES 1

/* Combined USB Tasks */
#define USBTasks()                  \
    {                               \
        USBHostTasks();             \
        USBHostHIDTasks();          \
        USBHostMSDTasks();          \
    }

#define USBInitialize(x)            \
    {                               \
        USBHostInit(x);             \
    }

#endif /* _USB_CONFIG_H_ */

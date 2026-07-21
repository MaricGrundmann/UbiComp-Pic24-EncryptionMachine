#ifndef USB_APP_H
#define USB_APP_H

#include <stdbool.h>
#include <stdint.h>

void USB_SystemInit(void);
void USB_SystemTasks(void);
const char* USB_GetStatus(void);
void USB_ClearStatus(void);
void USB_ResetPool(void);

#endif

#ifndef KEYBOARD_H
#define KEYBOARD_H

#include <stdbool.h>
#include <stdint.h>

void Keyboard_Init(void);
void Keyboard_Tasks(void);
bool Keyboard_IsConnected(void);
bool Keyboard_IsReady(void);
bool Keyboard_CharAvailable(void);
char Keyboard_ReadChar(void);

bool Keyboard_ReportParser(void);
bool Keyboard_IsReady(void);

#endif

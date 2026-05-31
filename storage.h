/* storage.h -- USB mass storage abstraction */
#ifndef STORAGE__H
#define STORAGE__H

#include <xc.h>
#include <stdint.h>

#define FILE_CACHE_SIZE  8192

void        Storage_Init(void);
void        Storage_UpdateTask(void);
uint8_t     Storage_Present(void);
uint8_t     Storage_FileCount(void);
const char *Storage_FileName(uint8_t index);
int8_t      Storage_LoadFile(uint8_t index);
int8_t      Storage_SaveFile(const char *name);

#endif

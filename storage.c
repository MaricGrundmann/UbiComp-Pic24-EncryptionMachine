/* storage.c -- USB mass storage stubs (replace with MCC-generated code) */
#include <xc.h>
#include <stdint.h>
#include <string.h>
#include "storage.h"

static uint8_t  storage_present;
static uint8_t  storage_file_count;
static char     storage_fake_files[][13] = {
    "README.TXT", "DATA.BIN", "IMAGE.JPG"
};

void Storage_Init(void) {
    storage_present = 0;
    storage_file_count = 0;
}

void Storage_UpdateTask(void) {
    /* Will be replaced by MCC USB host polling */
}

uint8_t Storage_Present(void) {
    return storage_present;
}

uint8_t Storage_FileCount(void) {
    return storage_file_count;
}

const char *Storage_FileName(uint8_t index) {
    if (index >= 3) return "";
    return storage_fake_files[index];
}

int8_t Storage_LoadFile(uint8_t index) {
    return -1; /* not implemented without MCC */
}

int8_t Storage_SaveFile(const char *name) {
    return -1;
}

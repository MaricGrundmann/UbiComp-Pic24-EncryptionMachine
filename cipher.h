#ifndef CIPHER_H
#define CIPHER_H

#include <stdint.h>

void Cipher_Init(const char *password, uint8_t len);
void Cipher_Process(uint8_t *buffer, uint16_t len);

#endif

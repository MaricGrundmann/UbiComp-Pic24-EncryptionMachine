/*==============================================================================
 * cipher.h
 *
 * Public API for cipher.c AES-256 CBC encryption (PIC24/XC16)
 *
 * Typical encrypt flow (keyboard -> encrypted file):
 *
 *   #include "cipher.h"
 *
 *   uint8_t buf[64 + CIPHER_BLOCK_SIZE];        // data + room for padding
 *   memcpy(buf, keystroke_data, data_len);
 *
 *   uint16_t padded = CIPHER_PKCS7_Pad(buf, data_len);
 *   CIPHER_Encrypt(my_key, my_iv, buf, enc_buf, padded);
 *   // write enc_buf to file via FILEIO_Write(...)
 *
 * Typical decrypt flow (read file -> decrypt -> display/send):
 *
 *   CIPHER_Decrypt(my_key, my_iv, enc_buf, plain_buf, enc_len);
 *   uint16_t data_len = CIPHER_PKCS7_Unpad(plain_buf, enc_len);
 *   // data_len == 0 means padding was corrupt
 *
 *==================================================================================*/

#ifndef CIPHER_H
#define CIPHER_H

#include <stdint.h>

/* Constants */

#define CIPHER_BLOCK_SIZE   16U     /* AES block size in bytes              */
#define CIPHER_KEY_SIZE     32U     /* AES-256 key size in bytes            */

/* API */

/**
 * CIPHER_Encrypt
 *
 * Encrypts 'length' bytes from 'plaintext' into 'ciphertext' using
 * AES-256 in CBC mode.
 *
 * @param key         32-byte (256-bit) secret key
 * @param iv          16-byte initialisation vector
 * @param plaintext   Input data must be a multiple of CIPHER_BLOCK_SIZE
 * @param ciphertext  Output buffer same size as plaintext
 * @param length      Byte count (multiple of CIPHER_BLOCK_SIZE)
 *
 */
void CIPHER_Encrypt(const uint8_t *key,
                    const uint8_t *iv,
                    const uint8_t *plaintext,
                          uint8_t *ciphertext,
                          uint16_t length);

/**
 * CIPHER_PKCS7_Pad
 *
 * Appends PKCS#7 padding to 'buf' so its length becomes a multiple of
 * CIPHER_BLOCK_SIZE (up to 15 bytes may be appended).
 *
 * 'buf' must have at least (data_len + CIPHER_BLOCK_SIZE - 1) bytes allocated.
 *
 * @param buf       Buffer containing data to pad (modified in place)
 * @param data_len  Current data length in bytes
 * @return          New padded length (always a multiple of CIPHER_BLOCK_SIZE)
 */
uint16_t CIPHER_PKCS7_Pad(uint8_t *buf, uint16_t data_len);

/**
 * CIPHER_Decrypt
 *
 * Decrypts 'length' bytes from 'ciphertext' into 'plaintext' using
 * AES-256 in CBC mode.
 *
 * @param key         32-byte (256-bit) secret key (must match encryption key)
 * @param iv          16-byte initialisation vector (must match encryption IV)
 * @param ciphertext  Encrypted input — must be a multiple of CIPHER_BLOCK_SIZE
 * @param plaintext   Output buffer — same size as ciphertext
 * @param length      Byte count (multiple of CIPHER_BLOCK_SIZE)
 *
 * Call CIPHER_PKCS7_Unpad() after to recover the original data length.
 */
void CIPHER_Decrypt(const uint8_t *key,
                    const uint8_t *iv,
                    const uint8_t *ciphertext,
                          uint8_t *plaintext,
                          uint16_t length);

/**
 * CIPHER_PKCS7_Pad
 *
 * Appends PKCS#7 padding to 'buf' so its length becomes a multiple of
 * CIPHER_BLOCK_SIZE (up to 15 bytes may be appended).
 *
 * 'buf' must have at least (data_len + CIPHER_BLOCK_SIZE - 1) bytes allocated.
 *
 * @param buf       Buffer containing data to pad (modified in place)
 * @param data_len  Current data length in bytes
 * @return          New padded length (always a multiple of CIPHER_BLOCK_SIZE)
 */

 /**
 * CIPHER_PKCS7_Unpad
 *
 * Validates and strips PKCS#7 padding from a decrypted buffer.
 *
 * @param buf      Decrypted buffer (read-only)
 * @param buf_len  Total buffer length (must be a multiple of CIPHER_BLOCK_SIZE)
 * @return         Original data length, or 0 if padding is invalid/corrupt
 */
uint16_t CIPHER_PKCS7_Unpad(const uint8_t *buf, uint16_t buf_len);
#endif /* CIPHER_H */

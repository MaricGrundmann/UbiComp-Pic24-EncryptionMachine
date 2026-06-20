#include "usb.h"
#include "usb_host_hid.h"
#include "system.h"
#include "keyboard.h"
#include <string.h>

/* ======================================================================== *
 *  Ring buffer for received characters
 * ======================================================================== */
#define CHAR_BUF_SIZE 32
static volatile char charBuf[CHAR_BUF_SIZE];
static volatile uint8_t charBufHead;
static volatile uint8_t charBufTail;

static void bufPut(char c) {
    uint8_t next = (charBufHead + 1) % CHAR_BUF_SIZE;
    if (next != charBufTail) {
        charBuf[charBufHead] = c;
        charBufHead = next;
    }
}

/* ======================================================================== *
 *  Key translation table (from MLA HID keyboard example)
 * ======================================================================== */
typedef struct {
    uint8_t key;
    char unmodified;
    char modified;
} HID_KEY_MAP;

static const HID_KEY_MAP keyMap[] = {
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_A,                                         'a', 'A' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_B,                                         'b', 'B' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_C,                                         'c', 'C' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_D,                                         'd', 'D' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_E,                                         'e', 'E' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_F,                                         'f', 'F' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_G,                                         'g', 'G' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_H,                                         'h', 'H' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_I,                                         'i', 'I' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_J,                                         'j', 'J' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_K,                                         'k', 'K' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_L,                                         'l', 'L' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_M,                                         'm', 'M' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_N,                                         'n', 'N' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_O,                                         'o', 'O' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_P,                                         'p', 'P' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Q,                                         'q', 'Q' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_R,                                         'r', 'R' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_S,                                         's', 'S' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_T,                                         't', 'T' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_U,                                         'u', 'U' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_V,                                         'v', 'V' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_W,                                         'w', 'W' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_X,                                         'x', 'X' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Y,                                         'y', 'Y' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Z,                                         'z', 'Z' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_1_AND_EXCLAMATION_POINT,                   '1', '!' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_2_AND_AT,                                  '2', '@' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_3_AND_HASH,                                '3', '#' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_4_AND_DOLLAR,                              '4', '$' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_5_AND_PERCENT,                             '5', '%' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_6_AND_CARROT,                              '6', '^' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_7_AND_AMPERSAND,                           '7', '&' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_8_AND_ASTERISK,                            '8', '*' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_9_AND_OPEN_PARENTHESIS,                    '9', '(' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_0_AND_CLOSE_PARENTHESIS,                   '0', ')' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_MINUS_AND_UNDERSCORE,                      '-', '_' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_EQUAL_AND_PLUS,                            '=', '+' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_OPEN_BRACKET_AND_OPEN_CURLY_BRACE,         '[', '{' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CLOSE_BRACKET_AND_CLOSE_CURLY_BRACE,       ']', '}' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_BACK_SLASH_AND_PIPE,                       '\\', '|' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_SEMICOLON_AND_COLON,                       ';', ':' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_APOSTROPHE_AND_QUOTE,                      '\'', '\"' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_GRAVE_ACCENT_AND_TILDE,                    '`', '~' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_COMMA_AND_LESS_THAN,                       ',', '<' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_PERIOD_AND_GREATER_THAN,                   '.', '>' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_FORWARD_SLASH_AND_QUESTION_MARK,           '/', '?' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_SPACEBAR,                                  ' ', ' ' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_NON_US_HASH_AND_TILDE,                     '#', '~' },
};

/* ======================================================================== *
 *  Keyboard state machine
 * ======================================================================== */
typedef struct {
    uint8_t address;
    bool inUse;
    bool reading;
    bool protocolSet;
    uint8_t interfaceNum;

    struct {
        uint16_t id;
        uint16_t size;
        uint8_t buffer[8];
    } keys;
    uint8_t prevKeys[6];

    struct {
        bool updated;
        union {
            uint8_t value;
            struct {
                uint8_t numLock    : 1;
                uint8_t capsLock   : 1;
                uint8_t scrollLock : 1;
                uint8_t           : 5;
            } bits;
        } report;
    } leds;
} KEYBOARD;

static KEYBOARD kbd;

bool Keyboard_IsReady(void) { return kbd.inUse; }

/* ======================================================================== *
 *  Process a completed input report: translate keys and push to buffer
 * ======================================================================== */
static void ProcessInputReport(void) {
    uint8_t i, j;
    bool shift = false;

    if (kbd.keys.buffer[0] & 0x22) shift = true;

    uint8_t newKeys[6];
    for (i = 0; i < 6; i++) newKeys[i] = kbd.keys.buffer[2 + i];

    for (i = 0; i < 6; i++) {
        bool held = false;

        if (newKeys[i] == 0)
            break;

        for (j = 0; j < 6; j++) {
            if (newKeys[i] == kbd.prevKeys[j]) {
                held = true;
                break;
            }
        }

        if (held)
            continue;

        uint8_t key = newKeys[i];

        if (key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CAPS_LOCK) {
            kbd.leds.report.bits.capsLock ^= 1;
            kbd.leds.updated = true;

        } else if (key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RETURN_ENTER) {
            bufPut('\n');

        } else if ((key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_DELETE) ||
                   (key == USB_HID_KEYBOARD_KEYPAD_KEYPAD_BACKSPACE)) {
            bufPut('\b');

        } else if (key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_ESCAPE) {
            bufPut(0x1B);

        } else if ((key >= USB_HID_KEYBOARD_KEYPAD_KEYBOARD_A) &&
                   (key <= USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Z)) {
            for (j = 0; j < sizeof(keyMap) / sizeof(keyMap[0]); j++) {
                if (keyMap[j].key == key) {
                    if ((kbd.leds.report.bits.capsLock) || shift)
                        bufPut(keyMap[j].modified);
                    else
                        bufPut(keyMap[j].unmodified);
                    break;
                }
            }
        } else {
            for (j = 0; j < sizeof(keyMap) / sizeof(keyMap[0]); j++) {
                if (keyMap[j].key == key) {
                    if (shift)
                        bufPut(keyMap[j].modified);
                    else
                        bufPut(keyMap[j].unmodified);
                    break;
                }
            }
        }
    }

    for (i = 0; i < 6; i++) kbd.prevKeys[i] = newKeys[i];
}

/* ======================================================================== *
 *  Public API
 * ======================================================================== */
void Keyboard_Init(void) {
    kbd.inUse = false;
    kbd.address = 0;
    kbd.reading = false;
    kbd.protocolSet = false;
    charBufHead = 0;
    charBufTail = 0;
}

void Keyboard_Tasks(void) {
    uint8_t error;
    uint8_t count;

    if (kbd.address == 0) {
        kbd.address = USBHostHIDDeviceDetect();
    } else if (USBHostHIDDeviceStatus(kbd.address) == USB_HID_DEVICE_NOT_FOUND) {
        kbd.address = 0;
        kbd.inUse = false;
    }

    if (kbd.address == 0 || !kbd.inUse)
        return;

    if (!kbd.protocolSet) {
        USBHostIssueDeviceRequest(kbd.address,
            0x21, 0x0B, 0, kbd.interfaceNum,
            0, NULL, USB_DEVICE_REQUEST_SET, 1);
        USBHostIssueDeviceRequest(kbd.address,
            0x21, 0x0A, 0, kbd.interfaceNum,
            0, NULL, USB_DEVICE_REQUEST_SET, 1);
        kbd.protocolSet = true;
    }

    if (kbd.leds.updated) {
        uint8_t res = USBHostHIDWrite(kbd.address,
                                      0, kbd.interfaceNum,
                                      1, (uint8_t*)&kbd.leds.report);
        if (res == USB_SUCCESS) {
            kbd.leds.updated = false;
        }
    }

    if (!kbd.reading) {
        uint8_t res = USBHostHIDRead(kbd.address, kbd.keys.id,
                                     kbd.interfaceNum,
                                     kbd.keys.size, kbd.keys.buffer);
        if (res == USB_SUCCESS) {
            kbd.reading = true;
        }
    } else {
        if (USBHostHIDReadIsComplete(kbd.address, &error, &count)) {
            kbd.reading = false;
            if (!error && count > 0) {
                ProcessInputReport();
            }
        }
    }
}

bool Keyboard_IsConnected(void) {
    return (kbd.address != 0) &&
           (USBHostHIDDeviceStatus(kbd.address) == USB_HID_NORMAL_RUNNING);
}

bool Keyboard_CharAvailable(void) {
    return charBufHead != charBufTail;
}

char Keyboard_ReadChar(void) {
    if (charBufHead == charBufTail) return 0;
    char c = charBuf[charBufTail];
    charBufTail = (charBufTail + 1) % CHAR_BUF_SIZE;
    return c;
}

/* ======================================================================== *
 *  Report parser – called from USB_ApplicationEventHandler on
 *  EVENT_HID_RPT_DESC_PARSED.  Adapted from MLA example.
 * ======================================================================== */
bool Keyboard_ReportParser(void) {
    if (kbd.inUse)
        return false;

    kbd.interfaceNum = USBHostHID_ApiGetCurrentInterfaceNum();
    kbd.keys.id = 0;
    kbd.keys.size = 8;
    kbd.inUse = true;

    return true;
}

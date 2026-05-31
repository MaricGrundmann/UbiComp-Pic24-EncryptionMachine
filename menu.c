/* menu.c -- Menu and application flow */
#include <xc.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include "SH1101A.h"
#include "RGBLeds.h"
#include "TouchSense.h"
#include "menu.h"

extern void DelayMs(uint16_t ms);
#define INIT_CLOCK()  do { OSCCON = 0x3302; CLKDIV = 0x0000; } while(0)

static void Screen_Encrypt(void);
static void Screen_Decrypt(void);
static void Screen_SelectFile(void);
static void Screen_USBDebug(void);

/* ======================================================================== *
 *  5x7 ASCII font (0x20 - 0x7E), column-major: each byte = one column,
 *  7 rows per column (bits 0-6), bit 7 unused.
 * ======================================================================== */
static const uint8_t FONT[95][5] = {
    {0x00,0x00,0x00,0x00,0x00}, /* space */
    {0x00,0x00,0x5F,0x00,0x00}, /* ! */
    {0x00,0x07,0x00,0x07,0x00}, /* " */
    {0x14,0x7F,0x14,0x7F,0x14}, /* # */
    {0x24,0x2A,0x7F,0x2A,0x12}, /* $ */
    {0x23,0x13,0x08,0x64,0x62}, /* % */
    {0x36,0x49,0x55,0x22,0x50}, /* & */
    {0x00,0x05,0x03,0x00,0x00}, /* ' */
    {0x00,0x1C,0x22,0x41,0x00}, /* ( */
    {0x00,0x41,0x22,0x1C,0x00}, /* ) */
    {0x08,0x2A,0x1C,0x2A,0x08}, /* * */
    {0x08,0x08,0x3E,0x08,0x08}, /* + */
    {0x00,0x50,0x30,0x00,0x00}, /* , */
    {0x08,0x08,0x08,0x08,0x08}, /* - */
    {0x00,0x60,0x60,0x00,0x00}, /* . */
    {0x20,0x10,0x08,0x04,0x02}, /* / */
    {0x3E,0x51,0x49,0x45,0x3E}, /* 0 */
    {0x00,0x42,0x7F,0x40,0x00}, /* 1 */
    {0x42,0x61,0x51,0x49,0x46}, /* 2 */
    {0x21,0x41,0x45,0x4B,0x31}, /* 3 */
    {0x18,0x14,0x12,0x7F,0x10}, /* 4 */
    {0x27,0x45,0x45,0x45,0x39}, /* 5 */
    {0x3C,0x4A,0x49,0x49,0x30}, /* 6 */
    {0x01,0x71,0x09,0x05,0x03}, /* 7 */
    {0x36,0x49,0x49,0x49,0x36}, /* 8 */
    {0x06,0x49,0x49,0x29,0x1E}, /* 9 */
    {0x00,0x36,0x36,0x00,0x00}, /* : */
    {0x00,0x56,0x36,0x00,0x00}, /* ; */
    {0x00,0x08,0x14,0x22,0x41}, /* < */
    {0x14,0x14,0x14,0x14,0x14}, /* = */
    {0x41,0x22,0x14,0x08,0x00}, /* > */
    {0x02,0x01,0x51,0x09,0x06}, /* ? */
    {0x32,0x49,0x79,0x41,0x3E}, /* @ */
    {0x7E,0x11,0x11,0x11,0x7E}, /* A */
    {0x7F,0x49,0x49,0x49,0x36}, /* B */
    {0x3E,0x41,0x41,0x41,0x22}, /* C */
    {0x7F,0x41,0x41,0x22,0x1C}, /* D */
    {0x7F,0x49,0x49,0x49,0x41}, /* E */
    {0x7F,0x09,0x09,0x01,0x01}, /* F */
    {0x3E,0x41,0x41,0x51,0x32}, /* G */
    {0x7F,0x08,0x08,0x08,0x7F}, /* H */
    {0x00,0x41,0x7F,0x41,0x00}, /* I */
    {0x20,0x40,0x41,0x3F,0x01}, /* J */
    {0x7F,0x08,0x14,0x22,0x41}, /* K */
    {0x7F,0x40,0x40,0x40,0x40}, /* L */
    {0x7F,0x02,0x04,0x02,0x7F}, /* M */
    {0x7F,0x04,0x08,0x10,0x7F}, /* N */
    {0x3E,0x41,0x41,0x41,0x3E}, /* O */
    {0x7F,0x09,0x09,0x09,0x06}, /* P */
    {0x3E,0x41,0x51,0x21,0x5E}, /* Q */
    {0x7F,0x09,0x19,0x29,0x46}, /* R */
    {0x46,0x49,0x49,0x49,0x31}, /* S */
    {0x01,0x01,0x7F,0x01,0x01}, /* T */
    {0x3F,0x40,0x40,0x40,0x3F}, /* U */
    {0x1F,0x20,0x40,0x20,0x1F}, /* V */
    {0x7F,0x20,0x18,0x20,0x7F}, /* W */
    {0x63,0x14,0x08,0x14,0x63}, /* X */
    {0x03,0x04,0x78,0x04,0x03}, /* Y */
    {0x61,0x51,0x49,0x45,0x43}, /* Z */
    {0x00,0x00,0x7F,0x41,0x41}, /* [ */
    {0x02,0x04,0x08,0x10,0x20}, /* \ */
    {0x41,0x41,0x7F,0x00,0x00}, /* ] */
    {0x04,0x02,0x01,0x02,0x04}, /* ^ */
    {0x40,0x40,0x40,0x40,0x40}, /* _ */
    {0x00,0x01,0x02,0x04,0x00}, /* ` */
    {0x20,0x54,0x54,0x54,0x78}, /* a */
    {0x7F,0x48,0x44,0x44,0x38}, /* b */
    {0x38,0x44,0x44,0x44,0x20}, /* c */
    {0x38,0x44,0x44,0x48,0x7F}, /* d */
    {0x38,0x54,0x54,0x54,0x18}, /* e */
    {0x08,0x7E,0x09,0x01,0x02}, /* f */
    {0x08,0x14,0x54,0x54,0x3C}, /* g */
    {0x7F,0x08,0x04,0x04,0x78}, /* h */
    {0x00,0x44,0x7D,0x40,0x00}, /* i */
    {0x20,0x40,0x44,0x3D,0x00}, /* j */
    {0x00,0x7F,0x10,0x28,0x44}, /* k */
    {0x00,0x41,0x7F,0x40,0x00}, /* l */
    {0x7C,0x04,0x18,0x04,0x78}, /* m */
    {0x7C,0x08,0x04,0x04,0x78}, /* n */
    {0x38,0x44,0x44,0x44,0x38}, /* o */
    {0x7C,0x14,0x14,0x14,0x08}, /* p */
    {0x08,0x14,0x14,0x18,0x7C}, /* q */
    {0x7C,0x08,0x04,0x04,0x08}, /* r */
    {0x48,0x54,0x54,0x54,0x20}, /* s */
    {0x04,0x3F,0x44,0x40,0x20}, /* t */
    {0x3C,0x40,0x40,0x20,0x7C}, /* u */
    {0x1C,0x20,0x40,0x20,0x1C}, /* v */
    {0x3C,0x40,0x30,0x40,0x3C}, /* w */
    {0x44,0x28,0x10,0x28,0x44}, /* x */
    {0x0C,0x50,0x50,0x50,0x3C}, /* y */
    {0x44,0x64,0x54,0x4C,0x44}, /* z */
    {0x00,0x08,0x36,0x41,0x00}, /* { */
    {0x00,0x00,0x7F,0x00,0x00}, /* | */
    {0x00,0x41,0x36,0x08,0x00}, /* } */
    {0x08,0x08,0x2A,0x1C,0x08}, /* ~ */
};

/* ======================================================================== *
 *  Text output
 * ======================================================================== */
void TextDrawChar(int16_t x, int16_t y, char c) {
    if (c < 0x20 || c > 0x7E) return;
    const uint8_t *g = FONT[c - 0x20];
    for (int col = 0; col < 5; col++) {
        uint8_t bits = g[col];
        for (int row = 0; row < 7; row++) {
            if (bits & (1 << row))
                PutPixel(x + col, y + row);
        }
    }
}

void TextDrawString(int16_t x, int16_t y, const char *s) {
    for (; *s; s++) {
        TextDrawChar(x, y, *s);
        x += MENU_CHAR_W;
        if (x + 5 >= 128) break;
    }
}

void TextDrawLine(uint8_t row, const char *s) {
    if (row >= MENU_ROWS) return;
    TextDrawString(0, row * MENU_LINE_H, s);
}

void TextClear(void) {
    SetColor(BLACK);
    ClearDevice();
}

/* ======================================================================== *
 *  Touch input with debouncing
 * ======================================================================== */
extern uint8_t buttons[NUM_TOUCHPADS];

#define DEBOUNCE_PRESS   3
#define DEBOUNCE_RELEASE 3

static struct {
    uint8_t state;
    uint8_t count;
} btn[5] = {{0}};

int InputPoll(void) {
    for (int i = 0; i < NUM_TOUCHPADS; i++)
        ReadCTMU();

    int result = BTN_NONE;
    for (int i = 0; i < NUM_TOUCHPADS; i++) {
        if (buttons[i]) {
            if (btn[i].count < DEBOUNCE_PRESS + DEBOUNCE_RELEASE)
                btn[i].count++;
            if (btn[i].state == 0 && btn[i].count >= DEBOUNCE_PRESS) {
                btn[i].state = 1;
                result = i;
            }
        } else {
            if (btn[i].count > 0)
                btn[i].count--;
            if (btn[i].state == 1 && btn[i].count == 0)
                btn[i].state = 0;
        }
    }
    return result;
}

/* ======================================================================== *
 *  Application init / main loop
 * ======================================================================== */
void App_Init(void) {
    INIT_CLOCK();
    ResetDevice();
    CTMUInit();
    RGBMapColorPins();
    RGBTurnOnLED();
    SetRGBs(0, 0, 0);
    
    TextClear();
    SetColor(WHITE);
    TextDrawLine(1, "PIC24 Encryption");
    TextDrawLine(2, "Machine");
    TextDrawLine(4, "Ready");
    DelayMs(2000);
}

void App_Run(void) {
    static const char *items[] = {
        "Encrypt", "Decrypt", "Select file", "USB Debug"
    };
    int sel = 0;
    int prev_sel = -1;
    uint8_t redraw = 1;

    for (;;) {
        int ev = InputPoll();
        
        if (ev == BTN_UP   && sel > 0) { sel--; redraw = 1; }
        if (ev == BTN_DOWN && sel < 3) { sel++; redraw = 1; }
        if (ev == BTN_CENTER) {
            redraw = 1;
            switch (sel) {
                case 0: Screen_Encrypt();    break;
                case 1: Screen_Decrypt();    break;
                case 2: Screen_SelectFile(); break;
                case 3: Screen_USBDebug();   break;
            }
        }
        
        if (redraw || sel != prev_sel) {
            prev_sel = sel;
            TextClear();
            SetColor(WHITE);
            TextDrawLine(0, "=== Main Menu ===");
            for (int i = 0; i < 4; i++) {
                char buf[MENU_COLS + 1];
                snprintf(buf, sizeof buf, "%c %s",
                         (i == sel) ? '>' : ' ', items[i]);
                TextDrawLine(2 + i, buf);
            }
            redraw = 0;
        }
        DelayMs(15);
    }
}

/* ======================================================================== *
 *  Sub-screens (placeholders)
 * ======================================================================== */
static void Screen_Encrypt(void) {
    uint8_t redraw = 1;
    for (;;) {
        if (InputPoll() == BTN_LEFT) break;
        if (redraw) {
            TextClear();
            SetColor(WHITE);
            TextDrawLine(0, "Encrypt");
            TextDrawLine(2, "Not implemented");
            TextDrawLine(7, "LEFT = back");
            redraw = 0;
        }
        DelayMs(15);
    }
}

static void Screen_Decrypt(void) {
    uint8_t redraw = 1;
    for (;;) {
        if (InputPoll() == BTN_LEFT) break;
        if (redraw) {
            TextClear();
            SetColor(WHITE);
            TextDrawLine(0, "Decrypt");
            TextDrawLine(2, "Not implemented");
            TextDrawLine(7, "LEFT = back");
            redraw = 0;
        }
        DelayMs(15);
    }
}

static void Screen_SelectFile(void) {
    uint8_t redraw = 1;
    for (;;) {
        if (InputPoll() == BTN_LEFT) break;
        if (redraw) {
            TextClear();
            SetColor(WHITE);
            TextDrawLine(0, "Select file");
            TextDrawLine(2, "No files found");
            TextDrawLine(7, "LEFT = back");
            redraw = 0;
        }
        DelayMs(15);
    }
}

static void Screen_USBDebug(void) {
    uint8_t redraw = 1;
    for (;;) {
        if (InputPoll() == BTN_LEFT) break;
        if (redraw) {
            TextClear();
            SetColor(WHITE);
            TextDrawLine(0, "USB Debug");
            TextDrawLine(2, "Configure via MCC");
            TextDrawLine(3, "in MPLAB X IDE");
            TextDrawLine(7, "LEFT = back");
            redraw = 0;
        }
        DelayMs(15);
    }
}

/* menu.h -- Menu and application flow */
#ifndef MENU__H
#define MENU__H

#include <xc.h>
#include <stdint.h>

#define MENU_CHAR_W   6     /* 5px glyph + 1px spacing */
#define MENU_LINE_H   8     /* one text line = one display page */
#define MENU_COLS     21    /* 128 / 6 chars per line */
#define MENU_ROWS     8     /* 64 / 8 text lines */

void TextClear(void);
void TextDrawChar(int16_t x, int16_t y, char c);
void TextDrawString(int16_t x, int16_t y, const char *s);
void TextDrawLine(uint8_t row, const char *s);

enum {
    BTN_NONE   = -1,
    BTN_UP     = 0,
    BTN_RIGHT  = 1,
    BTN_DOWN   = 2,
    BTN_LEFT   = 3,
    BTN_CENTER = 4
};

int  InputPoll(void);
void App_Init(void);
void App_Run(void);

#endif

#include "xc.h"
#include "PIC24FStarter.h"
#include "menu.h"
#include "RGBLeds.h"
#include <string.h>
#include <stdio.h>

/* Trap-Handler für Debug: LED-Farbe zeigt Trap-Typ an */
void __attribute__((interrupt, no_auto_psv)) _OscillatorFail(void) {
    SetRGBs(128, 128, 0); while(1); }  /* Gelb  */
void __attribute__((interrupt, no_auto_psv)) _AddressError(void) {
    SetRGBs(128, 0,   0); while(1); }  /* Rot   */
void __attribute__((interrupt, no_auto_psv)) _StackError(void) {
    SetRGBs(0,   0, 128); while(1); }  /* Blau  */
void __attribute__((interrupt, no_auto_psv)) _MathError(void) {
    SetRGBs(0, 128,   0); while(1); }  /* Grün  */
void __attribute__((interrupt, no_auto_psv)) _DMACError(void) {
    SetRGBs(128, 0, 128); while(1); }  /* Lila  */
void __attribute__((interrupt, no_auto_psv)) _HardTrapError(void) {
    SetRGBs(128, 128, 128); while(1); }/* Weiß  */

int main(void) {
    App_Init();
    App_Run();
    return 0;
}

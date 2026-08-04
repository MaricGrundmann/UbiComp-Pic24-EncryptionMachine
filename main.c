#include "xc.h"
#include "PIC24FStarter.h"
#include "menu.h"
#include "RGBLeds.h"
#include <string.h>
#include <stdio.h>

/* Debug trap handlers – LED colour indicates the trap type. */
void __attribute__((interrupt, no_auto_psv)) _OscillatorFail(void) {
    SetRGBs(128, 128, 0); while(1); }  /* yellow */
void __attribute__((interrupt, no_auto_psv)) _AddressError(void) {
    SetRGBs(128, 0,   0); while(1); }  /* red    */
void __attribute__((interrupt, no_auto_psv)) _StackError(void) {
    SetRGBs(0,   0, 128); while(1); }  /* blue   */
void __attribute__((interrupt, no_auto_psv)) _MathError(void) {
    SetRGBs(0, 128,   0); while(1); }  /* green  */
void __attribute__((interrupt, no_auto_psv)) _DMACError(void) {
    SetRGBs(128, 0, 128); while(1); }  /* purple */
void __attribute__((interrupt, no_auto_psv)) _HardTrapError(void) {
    SetRGBs(128, 128, 128); while(1); }/* white  */

int main(void) {
    App_Init();
    App_Run();
    return 0;
}

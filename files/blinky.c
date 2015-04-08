
#include <stm32f4xx.h>                  // STM32F4 Definitions

int main (void) {                       // MAIN function

  RCC->AHB1ENR |= 0x8;  // GPIOD (LED port) clock enable (otherwise peripherals play dead)

  GPIOD->MODER	= 0x55000000;   // Configure PD12, PD13, PD14 and PD15 (LEDs) in output mode 

  while (1) { // Loop forever
    int dlay = 0xabcdef;                // preset delay time (clock cycles)
    GPIOD->BSRRL  = 0xF000;             // LEDs on
    while(dlay--);                      // simple delay (keep mcu busy with amount of loops determined in "dlay")
    GPIOD->BSRRH  = 0xF000;             // LEDs off
    for(dlay=0xabcdef;dlay!=0;dlay--);  // simple delay variation
  } // end while
} // end main

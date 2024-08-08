#line 1 "D:/Embedded Systems/PIC/project/CODE/app.c"
#line 1 "d:/embedded systems/pic/project/code/app.h"
#line 17 "d:/embedded systems/pic/project/code/app.h"
void App_Init ();
void SSD_MX(char SSD_Num, char Num);
void LED_MODE (char mode);
void RESET (void);
#line 3 "D:/Embedded Systems/PIC/project/CODE/app.c"
void App_Init(void) {
 trisc = 0x00;
 portc = 0x00;
 trisd = 0x00;
 portd = 0x00;
 INTE_BIT = 1;
 INTEDG_BIT = 0;
 RBIE_BIT = 1;
 GIE_BIT = 1;
}

void SSD_MX(char SSD_Num, char Num) {
 switch (SSD_Num) {
 case 1:
  portc.B4  = 1;
  portc.B5  = 1;
  portc.B6  = 1;
  portc.B7  = 1;
 portc &= 0xf0;
 portc |= Num;
  portc.B4  = 0;
 delay_ms(5);
 break;
 case 2:
  portc.B4  = 1;
  portc.B5  = 1;
  portc.B6  = 1;
  portc.B7  = 1;
 portc &= 0xf0;
 portc |= Num;
  portc.B5  = 0;
 delay_ms(5);
 break;
 case 3:
  portc.B4  = 1;
  portc.B5  = 1;
  portc.B6  = 1;
  portc.B7  = 1;
 portc &= 0xf0;
 portc |= Num;
  portc.B6  = 0;
 delay_ms(5);
 break;
 case 4:
  portc.B4  = 1;
  portc.B5  = 1;
  portc.B6  = 1;
  portc.B7  = 1;
 portc &= 0xf0;
 portc |= Num;
  portc.B7  = 0;
 delay_ms(5);
 break;
 }
}

void LED_MODE(char mode) {
 switch (mode) {
 case 0:
  portd.B0  = 0;
  portd.B1  = 0;
  portd.B2  = 0;
  portd.B3  = 0;
  portd.B4  = 0;
  portd.B5  = 0;
 break;
 case 1:
  portd.B0  = 1;
  portd.B1  = 0;
  portd.B2  = 0;
  portd.B3  = 0;
  portd.B4  = 1;
  portd.B5  = 0;
 break;
 case 2:
  portd.B0  = 1;
  portd.B1  = 0;
  portd.B2  = 0;
  portd.B3  = 0;
  portd.B4  = 0;
  portd.B5  = 1;
 break;
 case 3:
  portd.B0  = 0;
  portd.B1  = 1;
  portd.B2  = 0;
  portd.B3  = 1;
  portd.B4  = 0;
  portd.B5  = 0;
 break;
 case 4:
  portd.B0  = 0;
  portd.B1  = 0;
  portd.B2  = 1;
  portd.B3  = 1;
  portd.B4  = 0;
  portd.B5  = 0;
 break;
 }
}

void RESET(void) {
  portd.B0  = 0;
  portd.B1  = 0;
  portd.B2  = 0;
  portd.B3  = 0;
  portd.B4  = 0;
  portd.B5  = 0;
  portc.B4  = 1;
  portc.B5  = 1;
  portc.B6  = 1;
  portc.B7  = 1;
}

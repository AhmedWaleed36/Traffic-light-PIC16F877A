#include "App.h"

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
            SSD1 = 1;
            SSD2 = 1;
            SSD3 = 1;
            SSD4 = 1;
            portc &= 0xf0;
            portc |= Num;
            SSD1 = 0;
            delay_ms(5);
            break;
        case 2:
            SSD1 = 1;
            SSD2 = 1;
            SSD3 = 1;
            SSD4 = 1;
            portc &= 0xf0;
            portc |= Num;
            SSD2 = 0;
            delay_ms(5);
            break;
        case 3:
            SSD1 = 1;
            SSD2 = 1;
            SSD3 = 1;
            SSD4 = 1;
            portc &= 0xf0;
            portc |= Num;
            SSD3 = 0;
            delay_ms(5);
            break;
        case 4:
            SSD1 = 1;
            SSD2 = 1;
            SSD3 = 1;
            SSD4 = 1;
            portc &= 0xf0;
            portc |= Num;
            SSD4 = 0;
            delay_ms(5);
            break;
    }
}

void LED_MODE(char mode) {
    switch (mode) {
        case 0:
            RSouth = 0;
            YSouth = 0;
            GSouth = 0;
            RWest = 0;
            YWest = 0;
            GWest = 0;
            break;
        case 1:
            RSouth = 1;
            YSouth = 0;
            GSouth = 0;
            RWest = 0;
            YWest = 1;
            GWest = 0;
            break;
        case 2:
            RSouth = 1;
            YSouth = 0;
            GSouth = 0;
            RWest = 0;
            YWest = 0;
            GWest = 1;
            break;
        case 3:
            RSouth = 0;
            YSouth = 1;
            GSouth = 0;
            RWest = 1;
            YWest = 0;
            GWest = 0;
            break;
        case 4:
            RSouth = 0;
            YSouth = 0;
            GSouth = 1;
            RWest = 1;
            YWest = 0;
            GWest = 0;
            break;
    }
}

void RESET(void) {
    RSouth = 0;
    YSouth = 0;
    GSouth = 0;
    RWest = 0;
    YWest = 0;
    GWest = 0;
    SSD1 = 1;
    SSD2 = 1;
    SSD3 = 1;
    SSD4 = 1;
}
#define SSD1 portc.B4
#define SSD2 portc.B5
#define SSD3 portc.B6
#define SSD4 portc.B7

#define RSouth portd.B0
#define YSouth portd.B1
#define GSouth portd.B2
#define RWest portd.B3
#define YWest portd.B4
#define GWest portd.B5

#define A_M   portb.B0
#define Manual portb.B4


void App_Init ();
void SSD_MX(char SSD_Num, char Num);
void LED_MODE (char mode);
void RESET (void);
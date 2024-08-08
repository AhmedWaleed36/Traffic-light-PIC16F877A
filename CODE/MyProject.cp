#line 1 "D:/Embedded Systems/PIC/project/CODE/MyProject.c"
#line 1 "d:/embedded systems/pic/project/code/app.h"
#line 17 "d:/embedded systems/pic/project/code/app.h"
void App_Init ();
void SSD_MX(char SSD_Num, char Num);
void LED_MODE (char mode);
void RESET (void);
#line 4 "D:/Embedded Systems/PIC/project/CODE/MyProject.c"
char i = 0;
char j = 0;
char x;
char flag = 0;
char manual = 1;
char stop = 0;
char LDigit1 = 0;
char RDigit1 = 0;
char LDigit2 = 0;
char RDigit2 = 0;


void Interrupt() {
 if (INTF_bit == 1) {
 INTF_bit = 0;
 flag++;
 stop=0;
 if (flag == 2)
 flag = 0;

 }
 if (RBIF_bit == 1) {
 x = portb;
 RBIF_bit = 0;
 stop = 0;
 manual++;
 if (manual > 2) {
 manual = 1;
 }
 }
}


void main() {
 App_Init();
 while (1)
 {

 if (flag == 0)
 {


 for (i = 23; i > 0 && flag == 0; i--)
 {
 LDigit1 = i / 10;
 RDigit1 = i % 10;
 if (i > 20)
 {
 LED_MODE(1);
 RDigit2 = (i - 20);
 LDigit2 = 0;
 for (j = 0; j < 50 & flag == 0; j++)
 {
 SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
 }
 }
 else
 {
 LED_MODE(2);
 for (j = 0; j < 50 & flag == 0; j++)
 {
 SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit1);SSD_MX(4, RDigit1);
 }
 }
 }


 for (i = 15; i > 0 && flag == 0; i--)
 {
 LDigit2 = i / 10;
 RDigit2 = i % 10;
 if (i > 12) {
 LED_MODE(3);
 RDigit1 = (i - 12);
 LDigit1 = 0;
 for (j = 0; j < 50 & flag == 0; j++)
 {
 SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
 }
 } else
 {
 LED_MODE(4);
 for (j = 0; j < 50 & flag == 0; j++)
 {
 SSD_MX(1, LDigit2);SSD_MX(2, RDigit2);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
 }
 }
 }
 }

 else if (flag == 1)
 {
 switch (manual)
 {
 case 1:
 if(stop==0)
 {
 LED_MODE(1);
 for (i = 3; i > 0 && manual == 1 && stop == 0; i--)
 {
 LDigit1 = 0;
 LDigit2 = 0;
 RDigit1 = i;
 RDigit2 = i;
 for (j = 0; j < 50 && manual == 1 && stop == 0; j++)
 {
 SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
 }
 }
 stop = 1;
 LED_MODE(2);
 }
 break;
 case 2:
 if(stop==0)
 {
 LED_MODE(3);
 for (i = 3; i > 0 && manual == 2 && stop == 0; i--)
 {
 LDigit1 = 0;
 LDigit2 = 0;
 RDigit1 = i;
 RDigit2 = i;
 for (j = 0; j < 50 && manual == 2 && stop == 0; j++)
 {
 SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
 }
 }
 stop = 1;
 LED_MODE(4);
 }
 break;

 }
 portc = 0;
 }
 }
}

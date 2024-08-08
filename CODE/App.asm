
_App_Init:

;app.c,3 :: 		void App_Init(void) {
;app.c,4 :: 		trisc = 0x00;
	CLRF       TRISC+0
;app.c,5 :: 		portc = 0x00;
	CLRF       PORTC+0
;app.c,6 :: 		trisd = 0x00;
	CLRF       TRISD+0
;app.c,7 :: 		portd = 0x00;
	CLRF       PORTD+0
;app.c,8 :: 		INTE_BIT = 1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;app.c,9 :: 		INTEDG_BIT = 0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;app.c,10 :: 		RBIE_BIT = 1;
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;app.c,11 :: 		GIE_BIT = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;app.c,12 :: 		}
L_end_App_Init:
	RETURN
; end of _App_Init

_SSD_MX:

;app.c,14 :: 		void SSD_MX(char SSD_Num, char Num) {
;app.c,15 :: 		switch (SSD_Num) {
	GOTO       L_SSD_MX0
;app.c,16 :: 		case 1:
L_SSD_MX2:
;app.c,17 :: 		SSD1 = 1;
	BSF        PORTC+0, 4
;app.c,18 :: 		SSD2 = 1;
	BSF        PORTC+0, 5
;app.c,19 :: 		SSD3 = 1;
	BSF        PORTC+0, 6
;app.c,20 :: 		SSD4 = 1;
	BSF        PORTC+0, 7
;app.c,21 :: 		portc &= 0xf0;
	MOVLW      240
	ANDWF      PORTC+0, 1
;app.c,22 :: 		portc |= Num;
	MOVF       FARG_SSD_MX_Num+0, 0
	IORWF      PORTC+0, 1
;app.c,23 :: 		SSD1 = 0;
	BCF        PORTC+0, 4
;app.c,24 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_SSD_MX3:
	DECFSZ     R13+0, 1
	GOTO       L_SSD_MX3
	DECFSZ     R12+0, 1
	GOTO       L_SSD_MX3
	NOP
	NOP
;app.c,25 :: 		break;
	GOTO       L_SSD_MX1
;app.c,26 :: 		case 2:
L_SSD_MX4:
;app.c,27 :: 		SSD1 = 1;
	BSF        PORTC+0, 4
;app.c,28 :: 		SSD2 = 1;
	BSF        PORTC+0, 5
;app.c,29 :: 		SSD3 = 1;
	BSF        PORTC+0, 6
;app.c,30 :: 		SSD4 = 1;
	BSF        PORTC+0, 7
;app.c,31 :: 		portc &= 0xf0;
	MOVLW      240
	ANDWF      PORTC+0, 1
;app.c,32 :: 		portc |= Num;
	MOVF       FARG_SSD_MX_Num+0, 0
	IORWF      PORTC+0, 1
;app.c,33 :: 		SSD2 = 0;
	BCF        PORTC+0, 5
;app.c,34 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_SSD_MX5:
	DECFSZ     R13+0, 1
	GOTO       L_SSD_MX5
	DECFSZ     R12+0, 1
	GOTO       L_SSD_MX5
	NOP
	NOP
;app.c,35 :: 		break;
	GOTO       L_SSD_MX1
;app.c,36 :: 		case 3:
L_SSD_MX6:
;app.c,37 :: 		SSD1 = 1;
	BSF        PORTC+0, 4
;app.c,38 :: 		SSD2 = 1;
	BSF        PORTC+0, 5
;app.c,39 :: 		SSD3 = 1;
	BSF        PORTC+0, 6
;app.c,40 :: 		SSD4 = 1;
	BSF        PORTC+0, 7
;app.c,41 :: 		portc &= 0xf0;
	MOVLW      240
	ANDWF      PORTC+0, 1
;app.c,42 :: 		portc |= Num;
	MOVF       FARG_SSD_MX_Num+0, 0
	IORWF      PORTC+0, 1
;app.c,43 :: 		SSD3 = 0;
	BCF        PORTC+0, 6
;app.c,44 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_SSD_MX7:
	DECFSZ     R13+0, 1
	GOTO       L_SSD_MX7
	DECFSZ     R12+0, 1
	GOTO       L_SSD_MX7
	NOP
	NOP
;app.c,45 :: 		break;
	GOTO       L_SSD_MX1
;app.c,46 :: 		case 4:
L_SSD_MX8:
;app.c,47 :: 		SSD1 = 1;
	BSF        PORTC+0, 4
;app.c,48 :: 		SSD2 = 1;
	BSF        PORTC+0, 5
;app.c,49 :: 		SSD3 = 1;
	BSF        PORTC+0, 6
;app.c,50 :: 		SSD4 = 1;
	BSF        PORTC+0, 7
;app.c,51 :: 		portc &= 0xf0;
	MOVLW      240
	ANDWF      PORTC+0, 1
;app.c,52 :: 		portc |= Num;
	MOVF       FARG_SSD_MX_Num+0, 0
	IORWF      PORTC+0, 1
;app.c,53 :: 		SSD4 = 0;
	BCF        PORTC+0, 7
;app.c,54 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_SSD_MX9:
	DECFSZ     R13+0, 1
	GOTO       L_SSD_MX9
	DECFSZ     R12+0, 1
	GOTO       L_SSD_MX9
	NOP
	NOP
;app.c,55 :: 		break;
	GOTO       L_SSD_MX1
;app.c,56 :: 		}
L_SSD_MX0:
	MOVF       FARG_SSD_MX_SSD_Num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_SSD_MX2
	MOVF       FARG_SSD_MX_SSD_Num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_SSD_MX4
	MOVF       FARG_SSD_MX_SSD_Num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_SSD_MX6
	MOVF       FARG_SSD_MX_SSD_Num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_SSD_MX8
L_SSD_MX1:
;app.c,57 :: 		}
L_end_SSD_MX:
	RETURN
; end of _SSD_MX

_LED_MODE:

;app.c,59 :: 		void LED_MODE(char mode) {
;app.c,60 :: 		switch (mode) {
	GOTO       L_LED_MODE10
;app.c,61 :: 		case 0:
L_LED_MODE12:
;app.c,62 :: 		RSouth = 0;
	BCF        PORTD+0, 0
;app.c,63 :: 		YSouth = 0;
	BCF        PORTD+0, 1
;app.c,64 :: 		GSouth = 0;
	BCF        PORTD+0, 2
;app.c,65 :: 		RWest = 0;
	BCF        PORTD+0, 3
;app.c,66 :: 		YWest = 0;
	BCF        PORTD+0, 4
;app.c,67 :: 		GWest = 0;
	BCF        PORTD+0, 5
;app.c,68 :: 		break;
	GOTO       L_LED_MODE11
;app.c,69 :: 		case 1:
L_LED_MODE13:
;app.c,70 :: 		RSouth = 1;
	BSF        PORTD+0, 0
;app.c,71 :: 		YSouth = 0;
	BCF        PORTD+0, 1
;app.c,72 :: 		GSouth = 0;
	BCF        PORTD+0, 2
;app.c,73 :: 		RWest = 0;
	BCF        PORTD+0, 3
;app.c,74 :: 		YWest = 1;
	BSF        PORTD+0, 4
;app.c,75 :: 		GWest = 0;
	BCF        PORTD+0, 5
;app.c,76 :: 		break;
	GOTO       L_LED_MODE11
;app.c,77 :: 		case 2:
L_LED_MODE14:
;app.c,78 :: 		RSouth = 1;
	BSF        PORTD+0, 0
;app.c,79 :: 		YSouth = 0;
	BCF        PORTD+0, 1
;app.c,80 :: 		GSouth = 0;
	BCF        PORTD+0, 2
;app.c,81 :: 		RWest = 0;
	BCF        PORTD+0, 3
;app.c,82 :: 		YWest = 0;
	BCF        PORTD+0, 4
;app.c,83 :: 		GWest = 1;
	BSF        PORTD+0, 5
;app.c,84 :: 		break;
	GOTO       L_LED_MODE11
;app.c,85 :: 		case 3:
L_LED_MODE15:
;app.c,86 :: 		RSouth = 0;
	BCF        PORTD+0, 0
;app.c,87 :: 		YSouth = 1;
	BSF        PORTD+0, 1
;app.c,88 :: 		GSouth = 0;
	BCF        PORTD+0, 2
;app.c,89 :: 		RWest = 1;
	BSF        PORTD+0, 3
;app.c,90 :: 		YWest = 0;
	BCF        PORTD+0, 4
;app.c,91 :: 		GWest = 0;
	BCF        PORTD+0, 5
;app.c,92 :: 		break;
	GOTO       L_LED_MODE11
;app.c,93 :: 		case 4:
L_LED_MODE16:
;app.c,94 :: 		RSouth = 0;
	BCF        PORTD+0, 0
;app.c,95 :: 		YSouth = 0;
	BCF        PORTD+0, 1
;app.c,96 :: 		GSouth = 1;
	BSF        PORTD+0, 2
;app.c,97 :: 		RWest = 1;
	BSF        PORTD+0, 3
;app.c,98 :: 		YWest = 0;
	BCF        PORTD+0, 4
;app.c,99 :: 		GWest = 0;
	BCF        PORTD+0, 5
;app.c,100 :: 		break;
	GOTO       L_LED_MODE11
;app.c,101 :: 		}
L_LED_MODE10:
	MOVF       FARG_LED_MODE_mode+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_LED_MODE12
	MOVF       FARG_LED_MODE_mode+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_LED_MODE13
	MOVF       FARG_LED_MODE_mode+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_LED_MODE14
	MOVF       FARG_LED_MODE_mode+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_LED_MODE15
	MOVF       FARG_LED_MODE_mode+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_LED_MODE16
L_LED_MODE11:
;app.c,102 :: 		}
L_end_LED_MODE:
	RETURN
; end of _LED_MODE

_RESET:

;app.c,104 :: 		void RESET(void) {
;app.c,105 :: 		RSouth = 0;
	BCF        PORTD+0, 0
;app.c,106 :: 		YSouth = 0;
	BCF        PORTD+0, 1
;app.c,107 :: 		GSouth = 0;
	BCF        PORTD+0, 2
;app.c,108 :: 		RWest = 0;
	BCF        PORTD+0, 3
;app.c,109 :: 		YWest = 0;
	BCF        PORTD+0, 4
;app.c,110 :: 		GWest = 0;
	BCF        PORTD+0, 5
;app.c,111 :: 		SSD1 = 1;
	BSF        PORTC+0, 4
;app.c,112 :: 		SSD2 = 1;
	BSF        PORTC+0, 5
;app.c,113 :: 		SSD3 = 1;
	BSF        PORTC+0, 6
;app.c,114 :: 		SSD4 = 1;
	BSF        PORTC+0, 7
;app.c,115 :: 		}
L_end_RESET:
	RETURN
; end of _RESET

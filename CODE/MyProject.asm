
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,16 :: 		void Interrupt() {
;MyProject.c,17 :: 		if (INTF_bit == 1) {
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_Interrupt0
;MyProject.c,18 :: 		INTF_bit = 0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;MyProject.c,19 :: 		flag++;
	INCF       _flag+0, 1
;MyProject.c,20 :: 		stop=0;
	CLRF       _stop+0
;MyProject.c,21 :: 		if (flag == 2)
	MOVF       _flag+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt1
;MyProject.c,22 :: 		flag = 0;
	CLRF       _flag+0
L_Interrupt1:
;MyProject.c,24 :: 		}
L_Interrupt0:
;MyProject.c,25 :: 		if (RBIF_bit == 1) {
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_Interrupt2
;MyProject.c,26 :: 		x = portb;
	MOVF       PORTB+0, 0
	MOVWF      _x+0
;MyProject.c,27 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;MyProject.c,28 :: 		stop = 0;
	CLRF       _stop+0
;MyProject.c,29 :: 		manual++;
	INCF       _manual+0, 1
;MyProject.c,30 :: 		if (manual > 2) {
	MOVF       _manual+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt3
;MyProject.c,31 :: 		manual = 1;
	MOVLW      1
	MOVWF      _manual+0
;MyProject.c,32 :: 		}
L_Interrupt3:
;MyProject.c,33 :: 		}
L_Interrupt2:
;MyProject.c,34 :: 		}
L_end_Interrupt:
L__Interrupt68:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;MyProject.c,37 :: 		void main() {
;MyProject.c,38 :: 		App_Init();
	CALL       _App_Init+0
;MyProject.c,39 :: 		while (1)
L_main4:
;MyProject.c,42 :: 		if (flag == 0)
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MyProject.c,46 :: 		for (i = 23; i > 0 && flag == 0; i--)
	MOVLW      23
	MOVWF      _i+0
L_main7:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
L__main66:
;MyProject.c,48 :: 		LDigit1 = i / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _LDigit1+0
;MyProject.c,49 :: 		RDigit1 = i % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _RDigit1+0
;MyProject.c,50 :: 		if (i > 20)
	MOVF       _i+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;MyProject.c,52 :: 		LED_MODE(1);
	MOVLW      1
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,53 :: 		RDigit2 = (i - 20);
	MOVLW      20
	SUBWF      _i+0, 0
	MOVWF      _RDigit2+0
;MyProject.c,54 :: 		LDigit2 = 0;
	CLRF       _LDigit2+0
;MyProject.c,55 :: 		for (j = 0; j < 50 & flag == 0; j++)
	CLRF       _j+0
L_main13:
	MOVLW      50
	SUBWF      _j+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _flag+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;MyProject.c,57 :: 		SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
	MOVLW      1
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      2
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      3
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      4
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
;MyProject.c,55 :: 		for (j = 0; j < 50 & flag == 0; j++)
	INCF       _j+0, 1
;MyProject.c,58 :: 		}
	GOTO       L_main13
L_main14:
;MyProject.c,59 :: 		}
	GOTO       L_main16
L_main12:
;MyProject.c,62 :: 		LED_MODE(2);
	MOVLW      2
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,63 :: 		for (j = 0; j < 50 & flag == 0; j++)
	CLRF       _j+0
L_main17:
	MOVLW      50
	SUBWF      _j+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _flag+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main18
;MyProject.c,65 :: 		SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit1);SSD_MX(4, RDigit1);
	MOVLW      1
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      2
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      3
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      4
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
;MyProject.c,63 :: 		for (j = 0; j < 50 & flag == 0; j++)
	INCF       _j+0, 1
;MyProject.c,66 :: 		}
	GOTO       L_main17
L_main18:
;MyProject.c,67 :: 		}
L_main16:
;MyProject.c,46 :: 		for (i = 23; i > 0 && flag == 0; i--)
	DECF       _i+0, 1
;MyProject.c,68 :: 		}
	GOTO       L_main7
L_main8:
;MyProject.c,71 :: 		for (i = 15; i > 0 && flag == 0; i--)
	MOVLW      15
	MOVWF      _i+0
L_main20:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main21
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main21
L__main65:
;MyProject.c,73 :: 		LDigit2 = i / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _LDigit2+0
;MyProject.c,74 :: 		RDigit2 = i % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _RDigit2+0
;MyProject.c,75 :: 		if (i > 12) {
	MOVF       _i+0, 0
	SUBLW      12
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;MyProject.c,76 :: 		LED_MODE(3);
	MOVLW      3
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,77 :: 		RDigit1 = (i - 12);
	MOVLW      12
	SUBWF      _i+0, 0
	MOVWF      _RDigit1+0
;MyProject.c,78 :: 		LDigit1 = 0;
	CLRF       _LDigit1+0
;MyProject.c,79 :: 		for (j = 0; j < 50 & flag == 0; j++)
	CLRF       _j+0
L_main26:
	MOVLW      50
	SUBWF      _j+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _flag+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main27
;MyProject.c,81 :: 		SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
	MOVLW      1
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      2
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      3
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      4
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
;MyProject.c,79 :: 		for (j = 0; j < 50 & flag == 0; j++)
	INCF       _j+0, 1
;MyProject.c,82 :: 		}
	GOTO       L_main26
L_main27:
;MyProject.c,83 :: 		} else
	GOTO       L_main29
L_main25:
;MyProject.c,85 :: 		LED_MODE(4);
	MOVLW      4
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,86 :: 		for (j = 0; j < 50 & flag == 0; j++)
	CLRF       _j+0
L_main30:
	MOVLW      50
	SUBWF      _j+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       _flag+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main31
;MyProject.c,88 :: 		SSD_MX(1, LDigit2);SSD_MX(2, RDigit2);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
	MOVLW      1
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      2
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      3
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      4
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
;MyProject.c,86 :: 		for (j = 0; j < 50 & flag == 0; j++)
	INCF       _j+0, 1
;MyProject.c,89 :: 		}
	GOTO       L_main30
L_main31:
;MyProject.c,90 :: 		}
L_main29:
;MyProject.c,71 :: 		for (i = 15; i > 0 && flag == 0; i--)
	DECF       _i+0, 1
;MyProject.c,91 :: 		}
	GOTO       L_main20
L_main21:
;MyProject.c,92 :: 		}
	GOTO       L_main33
L_main6:
;MyProject.c,94 :: 		else if (flag == 1)
	MOVF       _flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;MyProject.c,96 :: 		switch (manual)
	GOTO       L_main35
;MyProject.c,98 :: 		case 1:
L_main37:
;MyProject.c,99 :: 		if(stop==0)
	MOVF       _stop+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main38
;MyProject.c,101 :: 		LED_MODE(1);
	MOVLW      1
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,102 :: 		for (i = 3; i > 0 && manual == 1 && stop == 0; i--)
	MOVLW      3
	MOVWF      _i+0
L_main39:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main40
	MOVF       _manual+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVF       _stop+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main40
L__main64:
;MyProject.c,104 :: 		LDigit1 = 0;
	CLRF       _LDigit1+0
;MyProject.c,105 :: 		LDigit2 = 0;
	CLRF       _LDigit2+0
;MyProject.c,106 :: 		RDigit1 = i;
	MOVF       _i+0, 0
	MOVWF      _RDigit1+0
;MyProject.c,107 :: 		RDigit2 = i;
	MOVF       _i+0, 0
	MOVWF      _RDigit2+0
;MyProject.c,108 :: 		for (j = 0; j < 50 && manual == 1 && stop == 0; j++)
	CLRF       _j+0
L_main44:
	MOVLW      50
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main45
	MOVF       _manual+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main45
	MOVF       _stop+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main45
L__main63:
;MyProject.c,110 :: 		SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
	MOVLW      1
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      2
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      3
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      4
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
;MyProject.c,108 :: 		for (j = 0; j < 50 && manual == 1 && stop == 0; j++)
	INCF       _j+0, 1
;MyProject.c,111 :: 		}
	GOTO       L_main44
L_main45:
;MyProject.c,102 :: 		for (i = 3; i > 0 && manual == 1 && stop == 0; i--)
	DECF       _i+0, 1
;MyProject.c,112 :: 		}
	GOTO       L_main39
L_main40:
;MyProject.c,113 :: 		stop = 1;
	MOVLW      1
	MOVWF      _stop+0
;MyProject.c,114 :: 		LED_MODE(2);
	MOVLW      2
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,115 :: 		}
L_main38:
;MyProject.c,116 :: 		break;
	GOTO       L_main36
;MyProject.c,117 :: 		case 2:
L_main49:
;MyProject.c,118 :: 		if(stop==0)
	MOVF       _stop+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main50
;MyProject.c,120 :: 		LED_MODE(3);
	MOVLW      3
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,121 :: 		for (i = 3; i > 0 && manual == 2 && stop == 0; i--)
	MOVLW      3
	MOVWF      _i+0
L_main51:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main52
	MOVF       _manual+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main52
	MOVF       _stop+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main52
L__main62:
;MyProject.c,123 :: 		LDigit1 = 0;
	CLRF       _LDigit1+0
;MyProject.c,124 :: 		LDigit2 = 0;
	CLRF       _LDigit2+0
;MyProject.c,125 :: 		RDigit1 = i;
	MOVF       _i+0, 0
	MOVWF      _RDigit1+0
;MyProject.c,126 :: 		RDigit2 = i;
	MOVF       _i+0, 0
	MOVWF      _RDigit2+0
;MyProject.c,127 :: 		for (j = 0; j < 50 && manual == 2 && stop == 0; j++)
	CLRF       _j+0
L_main56:
	MOVLW      50
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main57
	MOVF       _manual+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main57
	MOVF       _stop+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main57
L__main61:
;MyProject.c,129 :: 		SSD_MX(1, LDigit1);SSD_MX(2, RDigit1);SSD_MX(3, LDigit2);SSD_MX(4, RDigit2);
	MOVLW      1
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      2
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit1+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      3
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _LDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
	MOVLW      4
	MOVWF      FARG_SSD_MX_SSD_Num+0
	MOVF       _RDigit2+0, 0
	MOVWF      FARG_SSD_MX_Num+0
	CALL       _SSD_MX+0
;MyProject.c,127 :: 		for (j = 0; j < 50 && manual == 2 && stop == 0; j++)
	INCF       _j+0, 1
;MyProject.c,130 :: 		}
	GOTO       L_main56
L_main57:
;MyProject.c,121 :: 		for (i = 3; i > 0 && manual == 2 && stop == 0; i--)
	DECF       _i+0, 1
;MyProject.c,131 :: 		}
	GOTO       L_main51
L_main52:
;MyProject.c,132 :: 		stop = 1;
	MOVLW      1
	MOVWF      _stop+0
;MyProject.c,133 :: 		LED_MODE(4);
	MOVLW      4
	MOVWF      FARG_LED_MODE_mode+0
	CALL       _LED_MODE+0
;MyProject.c,134 :: 		}
L_main50:
;MyProject.c,135 :: 		break;
	GOTO       L_main36
;MyProject.c,137 :: 		}
L_main35:
	MOVF       _manual+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _manual+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main49
L_main36:
;MyProject.c,138 :: 		portc = 0;
	CLRF       PORTC+0
;MyProject.c,139 :: 		}
L_main34:
L_main33:
;MyProject.c,140 :: 		}
	GOTO       L_main4
;MyProject.c,141 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

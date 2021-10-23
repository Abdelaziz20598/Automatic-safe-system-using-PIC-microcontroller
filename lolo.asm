
_get_password:

;lolo.c,24 :: 		char get_password()
;lolo.c,26 :: 		line1:
___get_password_line1:
;lolo.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);     // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lolo.c,28 :: 		Lcd_Out(1, 1, "Enter Password :"); // Displaying
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_lolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lolo.c,30 :: 		for(i=0;i<3;i++)
	CLRF       _i+0
	CLRF       _i+1
L_get_password0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_password26
	MOVLW      3
	SUBWF      _i+0, 0
L__get_password26:
	BTFSC      STATUS+0, 0
	GOTO       L_get_password1
;lolo.c,32 :: 		while (password[i] == 0)
L_get_password3:
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_get_password4
;lolo.c,34 :: 		password[i] = Keypad_Key_Click();
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FLOC__get_password+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__get_password+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;lolo.c,35 :: 		}
	GOTO       L_get_password3
L_get_password4:
;lolo.c,37 :: 		if(password[i]==1)     password[i]  = '7';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_get_password5
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      55
	MOVWF      INDF+0
L_get_password5:
;lolo.c,38 :: 		if(password[i]==2)     password[i]  = '8';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_get_password6
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      56
	MOVWF      INDF+0
L_get_password6:
;lolo.c,39 :: 		if(password[i]==3)     password[i]  = '9';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_get_password7
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      57
	MOVWF      INDF+0
L_get_password7:
;lolo.c,40 :: 		if(password[i]==5)     password[i]  = '4';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_get_password8
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      52
	MOVWF      INDF+0
L_get_password8:
;lolo.c,41 :: 		if(password[i]==6)     password[i]  = '5';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_get_password9
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      53
	MOVWF      INDF+0
L_get_password9:
;lolo.c,42 :: 		if(password[i]==7)     password[i]  = '6';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_get_password10
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      54
	MOVWF      INDF+0
L_get_password10:
;lolo.c,43 :: 		if(password[i]==9)     password[i]  = '1';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_get_password11
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      49
	MOVWF      INDF+0
L_get_password11:
;lolo.c,44 :: 		if(password[i]==10)    password[i]  = '2';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_get_password12
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      50
	MOVWF      INDF+0
L_get_password12:
;lolo.c,45 :: 		if(password[i]==12)    password[i]  = '3';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_get_password13
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      51
	MOVWF      INDF+0
L_get_password13:
;lolo.c,46 :: 		Lcd_Chr(2, i+1, password[i] );
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;lolo.c,30 :: 		for(i=0;i<3;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;lolo.c,47 :: 		}
	GOTO       L_get_password0
L_get_password1:
;lolo.c,48 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_get_password14:
	DECFSZ     R13+0, 1
	GOTO       L_get_password14
	DECFSZ     R12+0, 1
	GOTO       L_get_password14
	DECFSZ     R11+0, 1
	GOTO       L_get_password14
	NOP
	NOP
;lolo.c,49 :: 		if(strncmp(password,"122", strlen("122")) == 0) {
	MOVLW      ?lstr3_lolo+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      FARG_strncmp_len+0
	MOVLW      _password+0
	MOVWF      FARG_strncmp_s1+0
	MOVLW      ?lstr2_lolo+0
	MOVWF      FARG_strncmp_s2+0
	CALL       _strncmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_password27
	MOVLW      0
	XORWF      R0+0, 0
L__get_password27:
	BTFSS      STATUS+0, 2
	GOTO       L_get_password15
;lolo.c,50 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_get_password
;lolo.c,51 :: 		}
L_get_password15:
;lolo.c,54 :: 		password[0] = 0;
	CLRF       _password+0
;lolo.c,55 :: 		password[1] = 0;
	CLRF       _password+1
;lolo.c,56 :: 		password[2] = 0;
	CLRF       _password+2
;lolo.c,57 :: 		goto line1;
	GOTO       ___get_password_line1
;lolo.c,59 :: 		}
L_end_get_password:
	RETURN
; end of _get_password

_initialize_timer_Interrupt:

;lolo.c,61 :: 		void initialize_timer_Interrupt(void){
;lolo.c,62 :: 		TMR0IE_bit=1;       // Enable timer 0 interrupt
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;lolo.c,63 :: 		GIE_bit=1;          //Enable Global Interrupt
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;lolo.c,64 :: 		T0CS_bit=0;                  // Select f/4 clock for the TMR0
	BCF        T0CS_bit+0, BitPos(T0CS_bit+0)
;lolo.c,65 :: 		PSA_bit=0;                 // Prescaler is assigned to the Timer0 module
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;lolo.c,66 :: 		PS0_bit=1;                // Set pre-scaler to 32
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;lolo.c,67 :: 		PS1_bit=0;                // PS2,PS1,PS0 = 100
	BCF        PS1_bit+0, BitPos(PS1_bit+0)
;lolo.c,68 :: 		PS2_bit=0;
	BCF        PS2_bit+0, BitPos(PS2_bit+0)
;lolo.c,69 :: 		TMR0=6;                  //counter starting value
	MOVLW      6
	MOVWF      TMR0+0
;lolo.c,70 :: 		}
L_end_initialize_timer_Interrupt:
	RETURN
; end of _initialize_timer_Interrupt

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;lolo.c,71 :: 		void interrupt() {        // Interrupt handler
;lolo.c,72 :: 		if (INTCON.TMR0IF==1) {     // check for timer 0 interrupt flag
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt17
;lolo.c,73 :: 		counter++;                // increment 1 every interrupt
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;lolo.c,74 :: 		INTCON.TMR0IF=0;          // reset the TMR0IF flag
	BCF        INTCON+0, 2
;lolo.c,75 :: 		TMR0=6;                   // store 6 in the TMR0 register
	MOVLW      6
	MOVWF      TMR0+0
;lolo.c,76 :: 		}
L_interrupt17:
;lolo.c,77 :: 		}
L_end_interrupt:
L__interrupt30:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;lolo.c,79 :: 		void main()
;lolo.c,81 :: 		trisc=0;    portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;lolo.c,83 :: 		Lcd_Init();    keypad_Init();
	CALL       _Lcd_Init+0
	CALL       _Keypad_Init+0
;lolo.c,85 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lolo.c,87 :: 		get_password();
	CALL       _get_password+0
;lolo.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lolo.c,90 :: 		Lcd_Out(1,1 , "Welcome ENG ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_lolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lolo.c,91 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
;lolo.c,92 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lolo.c,93 :: 		Lcd_Out(1,1 , "Abdelaziz");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_lolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lolo.c,94 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
;lolo.c,95 :: 		Lcd_Out(1,1,"Elapesed Time:");  // Show elapsed time message
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_lolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lolo.c,96 :: 		initialize_timer_Interrupt();   // invoke timer interrupt initialization function
	CALL       _initialize_timer_Interrupt+0
;lolo.c,97 :: 		time=0;
	CLRF       _time+0
	CLRF       _time+1
;lolo.c,98 :: 		while(1){
L_main20:
;lolo.c,99 :: 		if(counter==500){  // check if the counter reaches 125
	MOVF       _counter+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      244
	XORWF      _counter+0, 0
L__main32:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;lolo.c,100 :: 		counter=0;      // start counter from the beginning
	CLRF       _counter+0
	CLRF       _counter+1
;lolo.c,102 :: 		IntToStrWithZeros(time, txt);  // convert the number of seconds to string
	MOVF       _time+0, 0
	MOVWF      FARG_IntToStrWithZeros_input+0
	MOVF       _time+1, 0
	MOVWF      FARG_IntToStrWithZeros_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStrWithZeros_output+0
	CALL       _IntToStrWithZeros+0
;lolo.c,103 :: 		Lcd_Out(2,1,txt);              // display the number of seconds
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lolo.c,104 :: 		time=++time;    // increase time one second
	INCF       _time+0, 1
	BTFSC      STATUS+0, 2
	INCF       _time+1, 1
;lolo.c,106 :: 		rc0_bit=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;lolo.c,107 :: 		rc1_bit=1;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;lolo.c,109 :: 		if(time>4){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _time+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVF       _time+0, 0
	SUBLW      4
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;lolo.c,110 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
;lolo.c,111 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lolo.c,112 :: 		Lcd_Out(2,1,"stop motor");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_lolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lolo.c,113 :: 		rc0_bit=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;lolo.c,114 :: 		rc1_bit=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;lolo.c,115 :: 		break;
	GOTO       L_main21
;lolo.c,116 :: 		}
L_main23:
;lolo.c,120 :: 		}
L_main22:
;lolo.c,121 :: 		}
	GOTO       L_main20
L_main21:
;lolo.c,128 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

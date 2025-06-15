
_PlayNote:

;cancionderrota.c,87 :: 		void PlayNote(unsigned int frequency, unsigned int time) {
;cancionderrota.c,88 :: 		Sound_Play(frequency, time);  // 250ms de duración
	MOVF       FARG_PlayNote_frequency+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVF       FARG_PlayNote_frequency+1, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVF       FARG_PlayNote_time+0, 0
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVF       FARG_PlayNote_time+1, 0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionderrota.c,89 :: 		delay_ms(5);             // Pequeña pausa entre notas
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_PlayNote0:
	DECFSZ     R13+0, 1
	GOTO       L_PlayNote0
	DECFSZ     R12+0, 1
	GOTO       L_PlayNote0
	NOP
	NOP
;cancionderrota.c,90 :: 		}
L_end_PlayNote:
	RETURN
; end of _PlayNote

_PlayMelody:

;cancionderrota.c,93 :: 		void PlayMelody() {
;cancionderrota.c,95 :: 		PlayNote(DO5, 200); delay_ms(250); PlayNote(SOL4, 200); delay_ms(250); PlayNote(MI4, 200); delay_ms(150);
	MOVLW      11
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      200
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_PlayMelody1:
	DECFSZ     R13+0, 1
	GOTO       L_PlayMelody1
	DECFSZ     R12+0, 1
	GOTO       L_PlayMelody1
	DECFSZ     R11+0, 1
	GOTO       L_PlayMelody1
	NOP
	NOP
	MOVLW      136
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      200
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_PlayMelody2:
	DECFSZ     R13+0, 1
	GOTO       L_PlayMelody2
	DECFSZ     R12+0, 1
	GOTO       L_PlayMelody2
	DECFSZ     R11+0, 1
	GOTO       L_PlayMelody2
	NOP
	NOP
	MOVLW      74
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      200
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_PlayMelody3:
	DECFSZ     R13+0, 1
	GOTO       L_PlayMelody3
	DECFSZ     R12+0, 1
	GOTO       L_PlayMelody3
	DECFSZ     R11+0, 1
	GOTO       L_PlayMelody3
;cancionderrota.c,96 :: 		PlayNote(LA4, 300); PlayNote(SI4, 300); PlayNote(LA4, 300);
	MOVLW      184
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      238
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      184
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionderrota.c,97 :: 		PlayNote(SOLs4, 300); PlayNote(LAs4, 300); PlayNote(SOLs4, 300);
	MOVLW      159
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      210
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      159
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionderrota.c,98 :: 		PlayNote(SOL4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 800);
	MOVLW      136
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      74
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      136
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      32
	MOVWF      FARG_PlayNote_time+0
	MOVLW      3
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionderrota.c,100 :: 		delay_ms(500);  // Pausa entre secciones
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_PlayMelody4:
	DECFSZ     R13+0, 1
	GOTO       L_PlayMelody4
	DECFSZ     R12+0, 1
	GOTO       L_PlayMelody4
	DECFSZ     R11+0, 1
	GOTO       L_PlayMelody4
	NOP
	NOP
;cancionderrota.c,101 :: 		}
L_end_PlayMelody:
	RETURN
; end of _PlayMelody

_main:

;cancionderrota.c,103 :: 		void main() {
;cancionderrota.c,105 :: 		ANSEL = ANSELH = 0;  // Todos los pines digitales
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;cancionderrota.c,106 :: 		C1ON_bit = C2ON_bit = 0;  // Deshabilitar comparadores
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BTFSC      C2ON_bit+0, BitPos(C2ON_bit+0)
	GOTO       L__main17
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	GOTO       L__main18
L__main17:
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
L__main18:
;cancionderrota.c,107 :: 		TRISB7_bit = 1;      // RB7 como entrada (botón)
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;cancionderrota.c,108 :: 		TRISC3_bit = 0;      // RC3 como salida (altavoz)
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;cancionderrota.c,111 :: 		Sound_Init(&PORTC, 3);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      3
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;cancionderrota.c,114 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionderrota.c,115 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;cancionderrota.c,116 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionderrota.c,117 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;cancionderrota.c,119 :: 		while(1) {
L_main7:
;cancionderrota.c,121 :: 		if(Button(&PORTB, 7, 1, 1)) {  // Si el botón se presiona
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      7
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;cancionderrota.c,122 :: 		delay_ms(20);  // Pequeño delay para antirrebote
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;cancionderrota.c,123 :: 		if(!buttonPressed) {
	MOVF       _buttonPressed+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;cancionderrota.c,124 :: 		buttonPressed = 1;
	MOVLW      1
	MOVWF      _buttonPressed+0
;cancionderrota.c,125 :: 		PlayMelody();  // Reproducir la melodía completa
	CALL       _PlayMelody+0
;cancionderrota.c,126 :: 		}
L_main11:
;cancionderrota.c,127 :: 		}
	GOTO       L_main12
L_main9:
;cancionderrota.c,129 :: 		buttonPressed = 0;  // Resetear bandera al soltar el botón
	CLRF       _buttonPressed+0
;cancionderrota.c,130 :: 		}
L_main12:
;cancionderrota.c,132 :: 		delay_ms(10);  // Pequeña pausa para evitar rebotes
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;cancionderrota.c,133 :: 		}
	GOTO       L_main7
;cancionderrota.c,134 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

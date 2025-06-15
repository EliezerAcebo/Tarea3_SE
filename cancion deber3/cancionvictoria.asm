
_PlayNote:

;cancionvictoria.c,87 :: 		void PlayNote(unsigned int frequency, unsigned int time) {
;cancionvictoria.c,88 :: 		Sound_Play(frequency, time);  // 250ms de duración
	MOVF       FARG_PlayNote_frequency+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVF       FARG_PlayNote_frequency+1, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVF       FARG_PlayNote_time+0, 0
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVF       FARG_PlayNote_time+1, 0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionvictoria.c,89 :: 		delay_ms(5);             // Pequeña pausa entre notas
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
;cancionvictoria.c,90 :: 		}
L_end_PlayNote:
	RETURN
; end of _PlayNote

_PlayMelody:

;cancionvictoria.c,93 :: 		void PlayMelody() {
;cancionvictoria.c,95 :: 		PlayNote(SOL3, 150); PlayNote(DO4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 150); PlayNote(DO5, 150);  PlayNote(MI5, 150);  PlayNote(SOL5, 450); PlayNote(MI5, 450);
	MOVLW      196
	MOVWF      FARG_PlayNote_frequency+0
	CLRF       FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      6
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
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      11
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      147
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      16
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      3
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      194
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      147
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      194
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionvictoria.c,96 :: 		PlayNote(SOLs3, 150); PlayNote(DO4, 150); PlayNote(REs4, 150); PlayNote(SOLs4, 150); PlayNote(DO5, 150); PlayNote(REs5, 150); PlayNote(SOLs5, 450); PlayNote(REs5, 450);
	MOVLW      208
	MOVWF      FARG_PlayNote_frequency+0
	CLRF       FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      6
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      55
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      159
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      11
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      110
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      63
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      3
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      194
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      110
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      194
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionvictoria.c,97 :: 		PlayNote(LAs3, 150); PlayNote(RE4, 150); PlayNote(FA4, 150); PlayNote(LAs4, 150); PlayNote(RE5, 150); PlayNote(FA5, 150); PlayNote(LAs5, 450); PlayNote(LAs5, 300); PlayNote(LAs5, 150); PlayNote(DO6, 1050);
	MOVLW      233
	MOVWF      FARG_PlayNote_frequency+0
	CLRF       FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      38
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      93
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      210
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      1
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      75
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      186
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      2
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      164
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      3
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      194
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      164
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      3
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      44
	MOVWF      FARG_PlayNote_time+0
	MOVLW      1
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      164
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      3
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      23
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      4
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      26
	MOVWF      FARG_PlayNote_time+0
	MOVLW      4
	MOVWF      FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionvictoria.c,99 :: 		delay_ms(500);  // Pausa entre secciones
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;cancionvictoria.c,100 :: 		}
L_end_PlayMelody:
	RETURN
; end of _PlayMelody

_main:

;cancionvictoria.c,102 :: 		void main() {
;cancionvictoria.c,104 :: 		ANSEL = ANSELH = 0;  // Todos los pines digitales
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;cancionvictoria.c,105 :: 		C1ON_bit = C2ON_bit = 0;  // Deshabilitar comparadores
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BTFSC      C2ON_bit+0, BitPos(C2ON_bit+0)
	GOTO       L__main14
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	GOTO       L__main15
L__main14:
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
L__main15:
;cancionvictoria.c,106 :: 		TRISB7_bit = 1;      // RB7 como entrada (botón)
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;cancionvictoria.c,107 :: 		TRISC3_bit = 0;      // RC3 como salida (altavoz)
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;cancionvictoria.c,110 :: 		Sound_Init(&PORTC, 3);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      3
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;cancionvictoria.c,113 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionvictoria.c,114 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;cancionvictoria.c,115 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionvictoria.c,116 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;cancionvictoria.c,118 :: 		while(1) {
L_main4:
;cancionvictoria.c,120 :: 		if(Button(&PORTB, 7, 1, 1)) {  // Si el botón se presiona
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
	GOTO       L_main6
;cancionvictoria.c,121 :: 		delay_ms(20);  // Pequeño delay para antirrebote
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;cancionvictoria.c,122 :: 		if(!buttonPressed) {
	MOVF       _buttonPressed+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;cancionvictoria.c,123 :: 		buttonPressed = 1;
	MOVLW      1
	MOVWF      _buttonPressed+0
;cancionvictoria.c,124 :: 		PlayMelody();  // Reproducir la melodía completa
	CALL       _PlayMelody+0
;cancionvictoria.c,125 :: 		}
L_main8:
;cancionvictoria.c,126 :: 		}
	GOTO       L_main9
L_main6:
;cancionvictoria.c,128 :: 		buttonPressed = 0;  // Resetear bandera al soltar el botón
	CLRF       _buttonPressed+0
;cancionvictoria.c,129 :: 		}
L_main9:
;cancionvictoria.c,131 :: 		delay_ms(10);  // Pequeña pausa para evitar rebotes
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;cancionvictoria.c,132 :: 		}
	GOTO       L_main4
;cancionvictoria.c,133 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

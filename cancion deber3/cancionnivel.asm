
_PlayNote:

;cancionnivel.c,87 :: 		void PlayNote(unsigned int frequency, unsigned int time) {
;cancionnivel.c,88 :: 		Sound_Play(frequency, time);  // 250ms de duración
	MOVF       FARG_PlayNote_frequency+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVF       FARG_PlayNote_frequency+1, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVF       FARG_PlayNote_time+0, 0
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVF       FARG_PlayNote_time+1, 0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionnivel.c,89 :: 		delay_ms(5);             // Pequeña pausa entre notas
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
;cancionnivel.c,90 :: 		}
L_end_PlayNote:
	RETURN
; end of _PlayNote

_PlayMelody:

;cancionnivel.c,93 :: 		void PlayMelody() {
;cancionnivel.c,95 :: 		PlayNote(MI5, 150); PlayNote(SOL5, 150); PlayNote(MI6, 150); PlayNote(DO6, 150); PlayNote(RE6, 150); PlayNote(SOL6, 150);
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
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      39
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      5
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      23
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      4
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      151
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      4
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
	MOVLW      32
	MOVWF      FARG_PlayNote_frequency+0
	MOVLW      6
	MOVWF      FARG_PlayNote_frequency+1
	MOVLW      150
	MOVWF      FARG_PlayNote_time+0
	CLRF       FARG_PlayNote_time+1
	CALL       _PlayNote+0
;cancionnivel.c,97 :: 		delay_ms(500);  // Pausa entre secciones
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
;cancionnivel.c,98 :: 		}
L_end_PlayMelody:
	RETURN
; end of _PlayMelody

_main:

;cancionnivel.c,100 :: 		void main() {
;cancionnivel.c,102 :: 		ANSEL = ANSELH = 0;  // Todos los pines digitales
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;cancionnivel.c,103 :: 		C1ON_bit = C2ON_bit = 0;  // Deshabilitar comparadores
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BTFSC      C2ON_bit+0, BitPos(C2ON_bit+0)
	GOTO       L__main14
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	GOTO       L__main15
L__main14:
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
L__main15:
;cancionnivel.c,104 :: 		TRISB7_bit = 1;      // RB7 como entrada (botón)
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;cancionnivel.c,105 :: 		TRISC3_bit = 0;      // RC3 como salida (altavoz)
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;cancionnivel.c,108 :: 		Sound_Init(&PORTC, 3);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      3
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;cancionnivel.c,111 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionnivel.c,112 :: 		delay_ms(300);
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
;cancionnivel.c,113 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionnivel.c,114 :: 		delay_ms(1000);
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
;cancionnivel.c,116 :: 		while(1) {
L_main4:
;cancionnivel.c,118 :: 		if(Button(&PORTB, 7, 1, 1)) {  // Si el botón se presiona
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
;cancionnivel.c,119 :: 		delay_ms(20);  // Pequeño delay para antirrebote
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
;cancionnivel.c,120 :: 		if(!buttonPressed) {
	MOVF       _buttonPressed+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;cancionnivel.c,121 :: 		buttonPressed = 1;
	MOVLW      1
	MOVWF      _buttonPressed+0
;cancionnivel.c,122 :: 		PlayMelody();  // Reproducir la melodía completa
	CALL       _PlayMelody+0
;cancionnivel.c,123 :: 		}
L_main8:
;cancionnivel.c,124 :: 		}
	GOTO       L_main9
L_main6:
;cancionnivel.c,126 :: 		buttonPressed = 0;  // Resetear bandera al soltar el botón
	CLRF       _buttonPressed+0
;cancionnivel.c,127 :: 		}
L_main9:
;cancionnivel.c,129 :: 		delay_ms(10);  // Pequeña pausa para evitar rebotes
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
;cancionnivel.c,130 :: 		}
	GOTO       L_main4
;cancionnivel.c,131 :: 		}
L_end_main:
	GOTO       $+0
; end of _main


_PlayNote:

;cancionnivel.c,82 :: 		void PlayNote(unsigned int frequency, unsigned int time) {
;cancionnivel.c,83 :: 		Sound_Play(frequency, time);
	MOVF       FARG_PlayNote_frequency+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVF       FARG_PlayNote_frequency+1, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVF       FARG_PlayNote_time+0, 0
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVF       FARG_PlayNote_time+1, 0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionnivel.c,84 :: 		delay_ms(5);
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
;cancionnivel.c,85 :: 		}
L_end_PlayNote:
	RETURN
; end of _PlayNote

_PlayCancion1:

;cancionnivel.c,88 :: 		void PlayCancion1() {
;cancionnivel.c,89 :: 		PlayNote(MI5, 150); PlayNote(SOL5, 150); PlayNote(MI6, 150);
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
;cancionnivel.c,90 :: 		PlayNote(DO6, 150); PlayNote(RE6, 150); PlayNote(SOL6, 150);
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
;cancionnivel.c,91 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_PlayCancion11:
	DECFSZ     R13+0, 1
	GOTO       L_PlayCancion11
	DECFSZ     R12+0, 1
	GOTO       L_PlayCancion11
	DECFSZ     R11+0, 1
	GOTO       L_PlayCancion11
	NOP
	NOP
;cancionnivel.c,92 :: 		}
L_end_PlayCancion1:
	RETURN
; end of _PlayCancion1

_PlayCancion2:

;cancionnivel.c,95 :: 		void PlayCancion2() {
;cancionnivel.c,96 :: 		PlayNote(DO5, 200); delay_ms(250); PlayNote(SOL4, 200); delay_ms(250); PlayNote(MI4, 200); delay_ms(150);
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
L_PlayCancion22:
	DECFSZ     R13+0, 1
	GOTO       L_PlayCancion22
	DECFSZ     R12+0, 1
	GOTO       L_PlayCancion22
	DECFSZ     R11+0, 1
	GOTO       L_PlayCancion22
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
L_PlayCancion23:
	DECFSZ     R13+0, 1
	GOTO       L_PlayCancion23
	DECFSZ     R12+0, 1
	GOTO       L_PlayCancion23
	DECFSZ     R11+0, 1
	GOTO       L_PlayCancion23
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
L_PlayCancion24:
	DECFSZ     R13+0, 1
	GOTO       L_PlayCancion24
	DECFSZ     R12+0, 1
	GOTO       L_PlayCancion24
	DECFSZ     R11+0, 1
	GOTO       L_PlayCancion24
;cancionnivel.c,97 :: 		PlayNote(LA4, 300); PlayNote(SI4, 300); PlayNote(LA4, 300);
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
;cancionnivel.c,98 :: 		PlayNote(SOLs4, 300); PlayNote(LAs4, 300); PlayNote(SOLs4, 300);
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
;cancionnivel.c,99 :: 		PlayNote(SOL4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 800);
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
;cancionnivel.c,100 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_PlayCancion25:
	DECFSZ     R13+0, 1
	GOTO       L_PlayCancion25
	DECFSZ     R12+0, 1
	GOTO       L_PlayCancion25
	DECFSZ     R11+0, 1
	GOTO       L_PlayCancion25
	NOP
	NOP
;cancionnivel.c,101 :: 		}
L_end_PlayCancion2:
	RETURN
; end of _PlayCancion2

_PlayCancion3:

;cancionnivel.c,104 :: 		void PlayCancion3() {
;cancionnivel.c,105 :: 		PlayNote(SOL3, 150); PlayNote(DO4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 150); PlayNote(DO5, 150);  PlayNote(MI5, 150);  PlayNote(SOL5, 450); PlayNote(MI5, 450);
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
;cancionnivel.c,106 :: 		PlayNote(SOLs3, 150); PlayNote(DO4, 150); PlayNote(REs4, 150); PlayNote(SOLs4, 150); PlayNote(DO5, 150); PlayNote(REs5, 150); PlayNote(SOLs5, 450); PlayNote(REs5, 450);
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
;cancionnivel.c,107 :: 		PlayNote(LAs3, 150); PlayNote(RE4, 150); PlayNote(FA4, 150); PlayNote(LAs4, 150); PlayNote(RE5, 150); PlayNote(FA5, 150); PlayNote(LAs5, 450); PlayNote(LAs5, 300); PlayNote(LAs5, 150); PlayNote(DO6, 1050);
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
;cancionnivel.c,108 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_PlayCancion36:
	DECFSZ     R13+0, 1
	GOTO       L_PlayCancion36
	DECFSZ     R12+0, 1
	GOTO       L_PlayCancion36
	DECFSZ     R11+0, 1
	GOTO       L_PlayCancion36
	NOP
	NOP
;cancionnivel.c,109 :: 		}
L_end_PlayCancion3:
	RETURN
; end of _PlayCancion3

_main:

;cancionnivel.c,111 :: 		void main() {
;cancionnivel.c,112 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;cancionnivel.c,113 :: 		C1ON_bit = C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BTFSC      C2ON_bit+0, BitPos(C2ON_bit+0)
	GOTO       L__main31
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	GOTO       L__main32
L__main31:
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
L__main32:
;cancionnivel.c,115 :: 		TRISB7_bit = 1; // Entrada desde ATmega PC5
	BSF        TRISB7_bit+0, BitPos(TRISB7_bit+0)
;cancionnivel.c,116 :: 		TRISB6_bit = 1; // Entrada desde ATmega PC4
	BSF        TRISB6_bit+0, BitPos(TRISB6_bit+0)
;cancionnivel.c,117 :: 		TRISC3_bit = 0;       // Salida para buzzer
	BCF        TRISC3_bit+0, BitPos(TRISC3_bit+0)
;cancionnivel.c,119 :: 		Sound_Init(&PORTC, 3);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      3
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;cancionnivel.c,121 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionnivel.c,122 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;cancionnivel.c,123 :: 		Sound_Play(880, 300);
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;cancionnivel.c,124 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;cancionnivel.c,126 :: 		while (1) {
L_main9:
;cancionnivel.c,127 :: 		unsigned char bit1 = RB7_bit; // PC5
	MOVLW      0
	BTFSC      RB7_bit+0, BitPos(RB7_bit+0)
	MOVLW      1
	MOVWF      main_bit1_L1+0
;cancionnivel.c,128 :: 		unsigned char bit0 =  RB6_bit; // PC4
	MOVLW      0
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	MOVLW      1
	MOVWF      main_bit0_L1+0
;cancionnivel.c,130 :: 		if (bit0 && !bit1) {
	MOVF       main_bit0_L1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       main_bit1_L1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
L__main25:
;cancionnivel.c,131 :: 		PlayCancion1();
	CALL       _PlayCancion1+0
;cancionnivel.c,132 :: 		} else if (!bit0 && bit1) {
	GOTO       L_main14
L_main13:
	MOVF       main_bit0_L1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main17
	MOVF       main_bit1_L1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
L__main24:
;cancionnivel.c,133 :: 		PlayCancion2();
	CALL       _PlayCancion2+0
;cancionnivel.c,134 :: 		} else if (bit0 && bit1) {
	GOTO       L_main18
L_main17:
	MOVF       main_bit0_L1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       main_bit1_L1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
L__main23:
;cancionnivel.c,135 :: 		PlayCancion3();
	CALL       _PlayCancion3+0
;cancionnivel.c,136 :: 		}
L_main21:
L_main18:
L_main14:
;cancionnivel.c,138 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;cancionnivel.c,139 :: 		}
	GOTO       L_main9
;cancionnivel.c,140 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

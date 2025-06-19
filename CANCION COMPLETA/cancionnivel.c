#define _XTAL_FREQ 8000000


/********************************
 * Definición de notas musicales *
 ********************************/

// Octava 3
#define DO3  131
#define DOs3 139
#define RE3  147
#define REs3 156
#define MI3  165
#define FA3  175
#define FAs3 185
#define SOL3 196
#define SOLs3 208
#define LA3  220
#define LAs3 233
#define SI3  247

// Octava 4
#define DO4  262
#define DOs4 277
#define RE4  294
#define REs4 311
#define MI4  330
#define FA4  349
#define FAs4 370
#define SOL4 392
#define SOLs4 415
#define LA4  440
#define LAs4 466
#define SI4  494

// Octava 5
#define DO5  523
#define DOs5 554
#define RE5  587
#define REs5 622
#define MI5  659
#define FA5  698
#define FAs5 740
#define SOL5 784
#define SOLs5 831
#define LA5  880
#define LAs5 932
#define SI5  988

// Octava 6
#define DO6  1047
#define DOs6 1109
#define RE6  1175
#define REs6 1245
#define MI6  1319
#define FA6  1397
#define FAs6 1480
#define SOL6 1568
#define SOLs6 1661
#define LA6  1760
#define LAs6 1865
#define SI6  1976

// Octava 7
#define DO7  2093
#define DOs7 2217
#define RE7  2349
#define REs7 2489
#define MI7  2637
#define FA7  2794
#define FAs7 2960
#define SOL7 3136
#define SOLs7 3322
#define LA7  3520
#define LAs7 3729
#define SI7  3951

// Octava 8
#define DO8  4186

// Funcion para reproducir una nota
void PlayNote(unsigned int frequency, unsigned int time) {
    Sound_Play(frequency, time);
    delay_ms(5);
}

// Cancion 1: Nivel
void PlayCancion1() {
    PlayNote(MI5, 150); PlayNote(SOL5, 150); PlayNote(MI6, 150);
    PlayNote(DO6, 150); PlayNote(RE6, 150); PlayNote(SOL6, 150);
    delay_ms(500);
}

// Cancion 2: Derrota
void PlayCancion2() {
    PlayNote(DO5, 200); delay_ms(250); PlayNote(SOL4, 200); delay_ms(250); PlayNote(MI4, 200); delay_ms(150);
    PlayNote(LA4, 300); PlayNote(SI4, 300); PlayNote(LA4, 300);
    PlayNote(SOLs4, 300); PlayNote(LAs4, 300); PlayNote(SOLs4, 300);
    PlayNote(SOL4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 800);
    delay_ms(500);
}

// Cancion 3: Victoria
void PlayCancion3() {
    PlayNote(SOL3, 150); PlayNote(DO4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 150); PlayNote(DO5, 150);  PlayNote(MI5, 150);  PlayNote(SOL5, 450); PlayNote(MI5, 450);
    PlayNote(SOLs3, 150); PlayNote(DO4, 150); PlayNote(REs4, 150); PlayNote(SOLs4, 150); PlayNote(DO5, 150); PlayNote(REs5, 150); PlayNote(SOLs5, 450); PlayNote(REs5, 450);
    PlayNote(LAs3, 150); PlayNote(RE4, 150); PlayNote(FA4, 150); PlayNote(LAs4, 150); PlayNote(RE5, 150); PlayNote(FA5, 150); PlayNote(LAs5, 450); PlayNote(LAs5, 300); PlayNote(LAs5, 150); PlayNote(DO6, 1050);
    delay_ms(500);
}

void main() {
    ANSEL = ANSELH = 0;
    C1ON_bit = C2ON_bit = 0;
    
    TRISB7_bit = 1; // Entrada desde ATmega PC5
    TRISB6_bit = 1; // Entrada desde ATmega PC4
    TRISC3_bit = 0;       // Salida para buzzer

    Sound_Init(&PORTC, 3);

    Sound_Play(880, 300);
    delay_ms(300);
    Sound_Play(880, 300);
    delay_ms(1000);

    while (1) {
        unsigned char bit1 = RB7_bit; // PC5
        unsigned char bit0 =  RB6_bit; // PC4

        if (bit0 && !bit1) {
            PlayCancion1();
        } else if (!bit0 && bit1) {
            PlayCancion2();
        } else if (bit0 && bit1) {
            PlayCancion3();
        }

        delay_ms(300);
    }
}

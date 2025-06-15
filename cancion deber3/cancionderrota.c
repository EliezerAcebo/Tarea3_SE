// Configuración para PIC16F887
#define _XTAL_FREQ 8000000  // Frecuencia del cristal (8MHz)

/*******************************
* Definición de notas musicales *
* Basadas en el temperamento   *
* igual (A4 = 440Hz)          *
*******************************/

// Octava 3 (Baja)
#define DO3  131    // C3
#define DOs3 139    // C#3/Db3
#define RE3  147    // D3
#define REs3 156    // D#3/Eb3
#define MI3  165    // E3
#define FA3  175    // F3
#define FAs3 185    // F#3/Gb3
#define SOL3 196    // G3
#define SOLs3 208   // G#3/Ab3
#define LA3  220    // A3
#define LAs3 233    // A#3/Bb3
#define SI3  247    // B3

// Octava 4 (Central)
#define DO4  262    // C4
#define DOs4 277    // C#4/Db4
#define RE4  294    // D4
#define REs4 311    // D#4/Eb4
#define MI4  330    // E4
#define FA4  349    // F4
#define FAs4 370    // F#4/Gb4
#define SOL4 392    // G4
#define SOLs4 415   // G#4/Ab4
#define LA4  440    // A4
#define LAs4 466    // A#4/Bb4
#define SI4  494    // B4

// Octava 5 (Alta)
#define DO5  523    // C5
#define DOs5 554    // C#5/Db5
#define RE5  587    // D5
#define REs5 622    // D#5/Eb5
#define MI5  659    // E5
#define FA5  698    // F5
#define FAs5 740    // F#5/Gb5
#define SOL5 784    // G5
#define SOLs5 831   // G#5/Ab5
#define LA5  880    // A5
#define LAs5 932    // A#5/Bb5
#define SI5  988    // B5

// Octava 6 (Muy alta)
#define DO6  1047   // C6
#define DOs6 1109   // C#6/Db6
#define RE6  1175   // D6
#define REs6 1245   // D#6/Eb6
#define MI6  1319   // E6
#define FA6  1397   // F6
#define FAs6 1480   // F#6/Gb6
#define SOL6 1568   // G6
#define SOLs6 1661  // G#6/Ab6
#define LA6  1760   // A6
#define LAs6 1865   // A#6/Bb6
#define SI6  1976   // B6

// Octava 7 (Agudos extremos)
#define DO7  2093   // C7
#define DOs7 2217   // C#7/Db7
#define RE7  2349   // D7
#define REs7 2489   // D#7/Eb7
#define MI7  2637   // E7
#define FA7  2794   // F7
#define FAs7 2960   // F#7/Gb7
#define SOL7 3136   // G7
#define SOLs7 3322  // G#7/Ab7
#define LA7  3520   // A7
#define LAs7 3729   // A#7/Bb7
#define SI7  3951   // B7

// Octava 8 (Límite superior para muchos buzzer)
#define DO8  4186   // C8

// Variables globales
unsigned char buttonPressed = 0;

// Función para reproducir nota con duración fija
void PlayNote(unsigned int frequency, unsigned int time) {
    Sound_Play(frequency, time);  // 250ms de duración
    delay_ms(5);             // Pequeña pausa entre notas
}

// Melodía "Mi Corazón Encantado" (simplificada)
void PlayMelody() {
    // Primera parte
    PlayNote(DO5, 200); delay_ms(250); PlayNote(SOL4, 200); delay_ms(250); PlayNote(MI4, 200); delay_ms(150);
    PlayNote(LA4, 300); PlayNote(SI4, 300); PlayNote(LA4, 300);
    PlayNote(SOLs4, 300); PlayNote(LAs4, 300); PlayNote(SOLs4, 300);
    PlayNote(SOL4, 150); PlayNote(MI4, 150); PlayNote(SOL4, 800);

    delay_ms(500);  // Pausa entre secciones
}

void main() {
    // Configuración inicial
    ANSEL = ANSELH = 0;  // Todos los pines digitales
    C1ON_bit = C2ON_bit = 0;  // Deshabilitar comparadores
    TRISB7_bit = 1;      // RB7 como entrada (botón)
    TRISC3_bit = 0;      // RC3 como salida (altavoz)

    // Inicializar módulo de sonido
    Sound_Init(&PORTC, 3);

    // Tono de inicio
    Sound_Play(880, 300);
    delay_ms(300);
    Sound_Play(880, 300);
    delay_ms(1000);

    while(1) {
        // Detección de presión del botón con antirrebote
        if(Button(&PORTB, 7, 1, 1)) {  // Si el botón se presiona
            delay_ms(20);  // Pequeño delay para antirrebote
            if(!buttonPressed) {
                buttonPressed = 1;
                PlayMelody();  // Reproducir la melodía completa
            }
        }
        else {
            buttonPressed = 0;  // Resetear bandera al soltar el botón
        }

        delay_ms(10);  // Pequeña pausa para evitar rebotes
    }
}


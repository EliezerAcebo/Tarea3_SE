#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 8000000UL  // 8 MHz

// Botones en PC0–PC3
#define BUTTON0 (1 << PC0)  // Arriba
#define BUTTON1 (1 << PC1)  // Abajo
#define BUTTON2 (1 << PC2)  // Izquierda
#define BUTTON3 (1 << PC3)  // Derecha

// Máscaras para filas (PORTB) y columnas (PORTD)
static const uint8_t mascaraFilas[8]    = {1,2,4,8,16,32,64,128};
static const uint8_t mascaraColumnas[8] = {1,2,4,8,16,32,64,128};
static uint8_t nivel = 1;

// Buffer que contiene el punto: un solo bit alto en cada fila
static uint8_t frame[8];

// Patrón de “PERDER” (dos diagonales)
static const uint8_t patrX[8] = {
    0x00, 0x62, 0x14, 0x08, 0x08, 0x14, 0x62, 0x00 //X PERDI
};

// Patrón de “NIVEL 1”
static const uint8_t patrL1[8] = {
    0x00, 0x3E, 0x20, 0x00, 0x24, 0x3E, 0x20, 0x00 //NIVEL 1
};

// Patrón de “NIVEL 2”
static const uint8_t patrL2[8] = {
    0x00, 0x3E, 0x20, 0x00, 0x3A, 0x2A, 0x2E, 0x00 //NIVEL 1
};

// Patrón de “NIVEL 3”
static const uint8_t patrL3[8] = {
    0x00, 0x3E, 0x20, 0x00, 0x2A, 0x2A, 0x3E, 0x00 //NIVEL 1
};

// Patrón de “GANAR”
static const uint8_t patrG[8] = {
    0x00, 0x20, 0x46, 0x50, 0x50, 0x46, 0x20, 0x00 //NIVEL 1
};

// Lectura simple (sin debounce) de botones
int8_t leerBotones() {
    if (!(PINC & BUTTON0)) return 0;
    if (!(PINC & BUTTON1)) return 1;
    if (!(PINC & BUTTON2)) return 2;
    if (!(PINC & BUTTON3)) return 3;
    return -1;
}

// Funciones de movimiento sobre el buffer `frame[]`
void mover_derecha(uint8_t buf[8]) {
    for (int i = 7; i > 0; i--) buf[i] = buf[i-1];
    buf[0] = 0;
}
void mover_izquierda(uint8_t buf[8]) {
    for (int i = 0; i < 7; i++) buf[i] = buf[i+1];
    buf[7] = 0;
}
void mover_arriba(uint8_t buf[8]) {
    for (int i = 0; i < 8; i++) buf[i] = buf[i] >> 1;
}
void mover_abajo(uint8_t buf[8]) {
    for (int i = 0; i < 8; i++) buf[i] = buf[i] << 1;
}

// Refresca el display mostrando `frame[]` permanentemente
void refrescar(uint8_t buf[8]) {
    for (int col = 0; col < 8; col++) {
        PORTD = mascaraColumnas[col];
        PORTB = ~buf[col];
        _delay_us(100);
    }
}

// Muestra la X gigante durante 1 segundo
void mostrarX() {
    uint16_t elapsed = 0;
    while (elapsed < 100) {          // 1000 ms = 1 segundo
        refrescar((uint8_t*)patrX);
        _delay_ms(10);
        elapsed += 10;
    }
}

void mostrarL1() {
    uint16_t elapsed = 0;
    while (elapsed < 100) {          // 1000 ms = 1 segundo
        refrescar((uint8_t*)patrL1);
        _delay_ms(10);
        elapsed += 10;
    }
}

void mostrarL2() {
    uint16_t elapsed = 0;
    while (elapsed < 100) {          // 1000 ms = 1 segundo
        refrescar((uint8_t*)patrL2);
        _delay_ms(10);
        elapsed += 10;
    }
}

void mostrarL3() {
    uint16_t elapsed = 0;
    while (elapsed < 100) {          // 1000 ms = 1 segundo
        refrescar((uint8_t*)patrL3);
        _delay_ms(10);
        elapsed += 10;
    }
}

void mostrarG() {
    uint16_t elapsed = 0;
    while (elapsed < 100) {          // 1000 ms = 1 segundo
        refrescar((uint8_t*)patrG);
        _delay_ms(10);
        elapsed += 10;
    }
}

int main(void) {
    DDRB = 0xFF;  // filas por PORTB
    DDRD = 0xFF;  // columnas por PORTD
    DDRC &= ~(BUTTON0|BUTTON1|BUTTON2|BUTTON3);
    PORTC |=  (BUTTON0|BUTTON1|BUTTON2|BUTTON3);

    mostrarL1();

    // Posición inicial: fila 7 (bajo), bit 3 (centro horizontal)
    for (int i = 0; i < 8; i++) frame[i] = 0;
    frame[3] = (1 << 7);

    while (1) {
        int8_t dir = leerBotones();
        if (dir != -1) {
            // detectar posición actual
            int colPos=-1, rowPos=-1;
            for(int c=0;c<8;c++){
                if(frame[c]){
                    colPos=c;
                    for(int b=0;b<8;b++){
                        if(frame[c] & (1<<b)){
                            rowPos=b;
                            break;
                        }
                    }
                    break;
                }
            }

            // mover solo un paso si no en borde
            switch (dir) {
                case 0: if(rowPos>0) mover_arriba(frame);   break;
                case 1: if(rowPos<7) mover_abajo(frame);    break;
                case 2: if(colPos>0) mover_izquierda(frame);break;
                case 3: if(colPos<7) mover_derecha(frame);  break;
            }

            // comprobar minas en esquinas
            colPos=-1; rowPos=-1;
            for(int c=0;c<8;c++){
                if(frame[c]){
                    colPos=c;
                    for(int b=0;b<8;b++){
                        if(frame[c] & (1<<b)){
                            rowPos=b;
                            break;
                        }
                    }
                    break;
                }
            }
            
            if (rowPos == 0 && colPos == 3) {
                nivel = nivel +1;
                
                if(nivel==2){
                    mostrarL2();         // muestra “NIVEL 1” como ejemplo de victoria
                    _delay_ms(50);       // déjalo visible medio segundo
                    // reiniciar posición al inicio
                    for (int i = 0; i < 8; i++) frame[i] = 0;
                    frame[3] = (1 << 7);
                }
                if(nivel==3){
                    mostrarL3();         // muestra “NIVEL 1” como ejemplo de victoria
                    _delay_ms(50);       // déjalo visible medio segundo
                    // reiniciar posición al inicio
                    for (int i = 0; i < 8; i++) frame[i] = 0;
                    frame[3] = (1 << 7);
                }
                if(nivel==4){
                    mostrarG();         // muestra “NIVEL 1” como ejemplo de victoria
                    _delay_ms(50);       // déjalo visible medio segundo
                    // reiniciar posición al inicio
                    mostrarL1();
                    for (int i = 0; i < 8; i++) frame[i] = 0;
                    frame[3] = (1 << 7);
                    nivel = 1;
                }

            }

            if (nivel==2){
                if ((rowPos==0 && colPos==0) ||
                    (rowPos==0 && colPos==7) ||
                    (rowPos==7 && colPos==0) ||
                    (rowPos==7 && colPos==7) ||
                    (rowPos==0 && colPos==1) ||
                    (rowPos==1 && colPos==6) ||
                    (rowPos==5 && colPos==1) ||
                    (rowPos==0 && colPos==4) ||
                    (rowPos==0 && colPos==7) ||
                    (rowPos==7 && colPos==0) ||
                    (rowPos==7 && colPos==7))
                    {
                        nivel = 1;
                        mostrarX();
                        _delay_ms(50);
                        mostrarL1();
                        for (int i = 0; i < 8; i++) frame[i] = 0;
                        frame[3] = (1 << 7);
                    }
                    
            }

            if (nivel==1){
                if ((rowPos==0 && colPos==0) ||
                    (rowPos==0 && colPos==7) ||
                    (rowPos==7 && colPos==0) ||
                    (rowPos==7 && colPos==7) ||
                    (rowPos==0 && colPos==1) ||
                    (rowPos==1 && colPos==6) ||
                    (rowPos==5 && colPos==1))
                    {
                        nivel = 1;
                        mostrarX();
                        _delay_ms(50);
                        mostrarL1();
                        for (int i = 0; i < 8; i++) frame[i] = 0;
                        frame[3] = (1 << 7);
                    }
                    
            }

            if (nivel==3){
                if ((rowPos==0 && colPos==0) ||
                    (rowPos==0 && colPos==7) ||
                    (rowPos==7 && colPos==0) ||
                    (rowPos==7 && colPos==7) ||
                    (rowPos==0 && colPos==5) ||
                    (rowPos==1 && colPos==6) ||
                    (rowPos==5 && colPos==1))
                    {
                        nivel = 1;
                        mostrarX();
                        _delay_ms(50);
                        mostrarL1();
                        for (int i = 0; i < 8; i++) frame[i] = 0;
                        frame[3] = (1 << 7);
                    }
                    
            }

            // Esperar a soltar
            _delay_ms(0);
            while (leerBotones() != -1) _delay_ms(10);
        }
        // refresco continuo
        refrescar(frame);
    }
}

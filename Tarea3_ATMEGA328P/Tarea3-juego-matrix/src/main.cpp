#include <avr/io.h>
#include <util/delay.h>
#define F_CPU 8000000UL


#define NUM_FILAS 8
#define NUM_COLUMNAS 8
uint8_t ledsFijados[NUM_FILAS][NUM_COLUMNAS] = {0};

uint8_t pinesFilas[NUM_FILAS] = {0,1,2,3,4,5,6,7};
uint8_t pinesColumnas[NUM_COLUMNAS] = {0,1,2,3,4,5,6,7};

uint8_t fila = 0;
uint8_t columna = 0;

// Escribir un pin (valor: 1 o 0)
void escribirPin(uint8_t pin, uint8_t valor, volatile uint8_t *port) {
    if (valor) {
        *port |= (1 << pin);
    } else {
        *port &= ~(1 << pin);
    }
}

// Botón presionado (LOW)
uint8_t botonPresionado(uint8_t pin) {
    return !(PINC & (1 << pin));
}

// Leer botón con pequeño debounce
uint8_t leerBotonConRebote(uint8_t pin) {
    if (!botonPresionado(pin)) return 0;

    _delay_ms(10);  // Debounce corto
    return botonPresionado(pin);
}

// Mostrar cursor en la matriz LED
void mostrarCursor() {
    for (uint8_t i = 0; i < NUM_FILAS; i++) {
        // Activar fila i
        for (uint8_t f = 0; f < NUM_FILAS; f++)
            escribirPin(pinesFilas[f], (f == i), &PORTD);

        for (uint8_t c = 0; c < NUM_COLUMNAS; c++) {
            if (ledsFijados[i][c]) {
                // LED fijado, siempre apagado
                escribirPin(pinesColumnas[c], 1, &PORTB);
            } else if (i == fila && c == columna) {
                // Cursor actual (se apaga el led para marcar posición)
                escribirPin(pinesColumnas[c], 1, &PORTB);
            } else {
                escribirPin(pinesColumnas[c], 0, &PORTB);
            }
        }
        _delay_ms(0.3);
    }
}
int main(void) {
    // Configurar salidas: Filas y Columnas
    DDRD = 0xFF;  // Filas: PD0–PD7
    DDRB = 0xFF;  // Columnas: PB0–PB7

    // Configurar entradas con pull-up: Botones
    DDRC &= ~((1 << PC0) | (1 << PC1) | (1 << PC2) | (1 << PC3));
    PORTC |= (1 << PC0) | (1 << PC1) | (1 << PC2) | (1 << PC3);

    while(1) {
    // Refrescar matriz varias veces sin cambiar cursor
    for (uint8_t i = 0; i < 5; i++) {
        mostrarCursor();
    }
    if (leerBotonConRebote(PC4)) {
        ledsFijados[fila][columna] = 1;  // Marca el LED apagado
        _delay_ms(1); // para evitar múltiples registros por rebote
    }

    // Ahora sí, actualizar posición del cursor UNA sola vez
    if (leerBotonConRebote(PC0) && fila > 0) fila--;
    else if (leerBotonConRebote(PC1) && fila < NUM_FILAS - 1) fila++;
    else if (leerBotonConRebote(PC2) && columna > 0) columna--;
    else if (leerBotonConRebote(PC3) && columna < NUM_COLUMNAS - 1) columna++;
  }

}

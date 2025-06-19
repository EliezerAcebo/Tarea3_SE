#line 1 "C:/Users/Ronal/Desktop/Tarea3_SE-main/cancion deber3/cancionnivel.c"
#line 82 "C:/Users/Ronal/Desktop/Tarea3_SE-main/cancion deber3/cancionnivel.c"
void PlayNote(unsigned int frequency, unsigned int time) {
 Sound_Play(frequency, time);
 delay_ms(5);
}


void PlayCancion1() {
 PlayNote( 659 , 150); PlayNote( 784 , 150); PlayNote( 1319 , 150);
 PlayNote( 1047 , 150); PlayNote( 1175 , 150); PlayNote( 1568 , 150);
 delay_ms(500);
}


void PlayCancion2() {
 PlayNote( 523 , 200); delay_ms(250); PlayNote( 392 , 200); delay_ms(250); PlayNote( 330 , 200); delay_ms(150);
 PlayNote( 440 , 300); PlayNote( 494 , 300); PlayNote( 440 , 300);
 PlayNote( 415 , 300); PlayNote( 466 , 300); PlayNote( 415 , 300);
 PlayNote( 392 , 150); PlayNote( 330 , 150); PlayNote( 392 , 800);
 delay_ms(500);
}


void PlayCancion3() {
 PlayNote( 196 , 150); PlayNote( 262 , 150); PlayNote( 330 , 150); PlayNote( 392 , 150); PlayNote( 523 , 150); PlayNote( 659 , 150); PlayNote( 784 , 450); PlayNote( 659 , 450);
 PlayNote( 208 , 150); PlayNote( 262 , 150); PlayNote( 311 , 150); PlayNote( 415 , 150); PlayNote( 523 , 150); PlayNote( 622 , 150); PlayNote( 831 , 450); PlayNote( 622 , 450);
 PlayNote( 233 , 150); PlayNote( 294 , 150); PlayNote( 349 , 150); PlayNote( 466 , 150); PlayNote( 587 , 150); PlayNote( 698 , 150); PlayNote( 932 , 450); PlayNote( 932 , 300); PlayNote( 932 , 150); PlayNote( 1047 , 1050);
 delay_ms(500);
}

void main() {
 ANSEL = ANSELH = 0;
 C1ON_bit = C2ON_bit = 0;

 TRISB7_bit = 1;
 TRISB6_bit = 1;
 TRISC3_bit = 0;

 Sound_Init(&PORTC, 3);

 Sound_Play(880, 300);
 delay_ms(300);
 Sound_Play(880, 300);
 delay_ms(1000);

 while (1) {
 unsigned char bit1 = RB7_bit;
 unsigned char bit0 = RB6_bit;

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

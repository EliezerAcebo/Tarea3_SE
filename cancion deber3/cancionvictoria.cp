#line 1 "C:/Users/Usuario/Desktop/Universidad/8vo Semestre/Sistemas Embebidos/cancion deber3/cancionvictoria.c"
#line 84 "C:/Users/Usuario/Desktop/Universidad/8vo Semestre/Sistemas Embebidos/cancion deber3/cancionvictoria.c"
unsigned char buttonPressed = 0;


void PlayNote(unsigned int frequency, unsigned int time) {
 Sound_Play(frequency, time);
 delay_ms(5);
}


void PlayMelody() {

 PlayNote( 196 , 150); PlayNote( 262 , 150); PlayNote( 330 , 150); PlayNote( 392 , 150); PlayNote( 523 , 150); PlayNote( 659 , 150); PlayNote( 784 , 450); PlayNote( 659 , 450);
 PlayNote( 208 , 150); PlayNote( 262 , 150); PlayNote( 311 , 150); PlayNote( 415 , 150); PlayNote( 523 , 150); PlayNote( 622 , 150); PlayNote( 831 , 450); PlayNote( 622 , 450);
 PlayNote( 233 , 150); PlayNote( 294 , 150); PlayNote( 349 , 150); PlayNote( 466 , 150); PlayNote( 587 , 150); PlayNote( 698 , 150); PlayNote( 932 , 450); PlayNote( 932 , 300); PlayNote( 932 , 150); PlayNote( 1047 , 1050);

 delay_ms(500);
}

void main() {

 ANSEL = ANSELH = 0;
 C1ON_bit = C2ON_bit = 0;
 TRISB7_bit = 1;
 TRISC3_bit = 0;


 Sound_Init(&PORTC, 3);


 Sound_Play(880, 300);
 delay_ms(300);
 Sound_Play(880, 300);
 delay_ms(1000);

 while(1) {

 if(Button(&PORTB, 7, 1, 1)) {
 delay_ms(20);
 if(!buttonPressed) {
 buttonPressed = 1;
 PlayMelody();
 }
 }
 else {
 buttonPressed = 0;
 }

 delay_ms(10);
 }
}

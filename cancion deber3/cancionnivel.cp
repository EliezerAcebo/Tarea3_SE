#line 1 "C:/Users/Usuario/Desktop/Universidad/8vo Semestre/Sistemas Embebidos/cancion deber3/cancionnivel.c"
#line 84 "C:/Users/Usuario/Desktop/Universidad/8vo Semestre/Sistemas Embebidos/cancion deber3/cancionnivel.c"
unsigned char buttonPressed = 0;


void PlayNote(unsigned int frequency, unsigned int time) {
 Sound_Play(frequency, time);
 delay_ms(5);
}


void PlayMelody() {

 PlayNote( 659 , 150); PlayNote( 784 , 150); PlayNote( 1319 , 150); PlayNote( 1047 , 150); PlayNote( 1175 , 150); PlayNote( 1568 , 150);

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

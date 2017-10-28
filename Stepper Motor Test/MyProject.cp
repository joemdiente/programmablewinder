#line 1 "C:/Users/Joem Diente/Google Drive/Thesis Backup/Program/Stepper Motor Test/MyProject.c"
#line 13 "C:/Users/Joem Diente/Google Drive/Thesis Backup/Program/Stepper Motor Test/MyProject.c"
 sbit LCD_RS at LATA0_bit ; sbit LCD_RS_Direction  at TRISA0_bit ; 
 sbit LCD_EN at LATA1_bit ; sbit LCD_EN_Direction  at TRISA1_bit ; 
 sbit LCD_D4 at LATA2_bit ; sbit LCD_D4_Direction  at TRISA2_bit ; 
 sbit LCD_D5 at LATA3_bit ; sbit LCD_D5_Direction  at TRISA3_bit ; 
 sbit LCD_D6 at LATA4_bit ; sbit LCD_D6_Direction  at TRISA4_bit ; 
 sbit LCD_D7 at LATA5_bit ; sbit LCD_D7_Direction  at TRISA5_bit ; 


int pulse,run,pulses,firstrun;
char delaystpr;
void stepper (int pulses,char stpr);
int WindingLength, bla;
int Layer;
int turns;
char text[7];
void interrupt () {

 if (INTCON.INT0IF == 1){
 if (Button(&PORTB,0,100,1)) {
 portc.f2 = 1;
 firstrun = 1;
 }
 }


 if (INTCON3.INT1IF == 1){
 if (Button(&PORTB,1,100,1)) {
 portc.f2 = 0;
 firstrun = 1;
 }

 }

 if (INTCON3.INT2IF == 1){
 if (Button(&PORTB,2,10,1)) {
 run = 1;
 turns = turns + 1;
 }
 }
 INTCON.INT0IF = 0;
 INTCON3.INT2IF = 0;
 INTCON3.INT1IF = 0;
}
void main() {

TRISA = 0b1111111;
TRISB = 255;
TRISC = 0b00110000;
ADCON1 = 0b00001111;
CMCON = 7;
PORTA = 0;
PORTB = 0;
PORTC = 0;

delay_ms(100);




INTCON.INT0IE = 1;
INTCON.INT0IF = 0;
INTCON3.INT1IE = 1;
INTCON3.INT1IF = 0;
INTCON3.INT2IE = 1;
INTCON3.INT2IF = 0;
INTCON.GIE = 1;
delay_ms(100);

UCON.USBEN = 0;
UCFG.UTRDIS = 1;

LCD_Init();

portc.f0 = 0;
portc.f2 = 0;
delay_us(500);
pulses = (1.22f)*(300);
WindingLength = 37;
Layer = WindingLength/1.22f;
run = 0;
portc.f6 = 0;
portc.f5 = 0;
portc.f7 = 0;
portb.f3 = 0;
turns = 0;
firstrun = 0;
bla = 1;
Lcd_Cmd(_LCD_CLEAR);
intToStr(Pulses,text);
LCD_Out(1,1,text);
IntToStr(portc.f2,text);
LCD_Out(2,1,text);

 for(;;) {
 if(firstrun == 1) {
 stepper(200,100000);
 firstrun = 0;
 }
 if (portc.f5 == 0) break;
 }

 Lcd_Cmd(_LCD_CLEAR);
 IntToStr(Layer,text);
 LCD_Out(1,1,text);
 PORTC.F2 = 0;
 for(;;) {

 if(bla == 1){
 portc.f6 = 1;
 delay_ms(50);
 portc.f7 = 1;
 bla = 0;
 }

 if(run == 1) {
 stepper(pulses, delaystpr);
 run = 0;
 intToStr(turns,text);
 LCD_Out(2,1,text);
 }




 }
}

void stepper (int pulses,char stpr){
 for(pulse = 0; pulse <= pulses; pulse++){
 portc.f1 = 1;
 delay_us(50);
 portc.f1 = 0;
 delay_us(50);
 }
 }

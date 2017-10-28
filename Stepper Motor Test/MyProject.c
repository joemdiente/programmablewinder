// LCD module connections
#define USE_LAT

#ifdef USE_LAT
  #define ASSIGN_PIN(name,b) \
  sbit name               at LAT ## b ## _bit; \
  sbit name ## _Direction at TRIS ## b ## _bit;
#else
  #define ASSIGN_PIN(name,b) \
  sbit name               at R ## b ## _bit; \
  sbit name ## _Direction at TRIS ## b ## _bit;
#endif
ASSIGN_PIN(LCD_RS, A0)
ASSIGN_PIN(LCD_EN, A1)
ASSIGN_PIN(LCD_D4, A2)
ASSIGN_PIN(LCD_D5, A3)
ASSIGN_PIN(LCD_D6, A4)
ASSIGN_PIN(LCD_D7, A5)
// End LCD module connections

int pulse,run,pulses,firstrun;
char delaystpr;
void stepper (int pulses,char stpr);
int WindingLength, bla;
int Layer;
int turns;
char text[7];
void interrupt () {
 //INT0 --- OK/NEXT MENU
  if (INTCON.INT0IF == 1){
   if (Button(&PORTB,0,100,1)) {
     portc.f2 = 1;
     firstrun = 1;
    }
   }

 //INT1 --- BACK MENU
  if (INTCON3.INT1IF == 1){
   if (Button(&PORTB,1,100,1)) {
     portc.f2 = 0;
     firstrun = 1;
   }

  }
 //INT2 --- COUNTER
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
//MCU CONFIG
TRISA = 0b1111111;
TRISB = 255;
TRISC = 0b00110000;
ADCON1 = 0b00001111;
CMCON = 7;
PORTA = 0;
PORTB = 0;
PORTC = 0;

delay_ms(100);
//Interrupt Bits
//INTCON.RBIE = 0;    //RB Port Change Interrupt Enable bit
//INTCON.RBIF = 0;
//INTCON2.RBIP = 0;   //RB Port Change Interrupt Priority Bit
INTCON.INT0IE = 1;  //INT0  Interrupt Enable bit
INTCON.INT0IF = 0;
INTCON3.INT1IE = 1; //INT1  Interrupt Enable bit
INTCON3.INT1IF = 0;
INTCON3.INT2IE = 1; //INT2  Interrupt Enable bit
INTCON3.INT2IF = 0;
INTCON.GIE = 1;     //Global Interrupt Enable Bit
delay_ms(100);
//USBCON
UCON.USBEN = 0;
UCFG.UTRDIS = 1;
/////////////////////////
LCD_Init();
//STEPPER INIT
portc.f0 = 0; //ENABLEon
portc.f2 = 0; //DIRECTION      1 for left 0 for right
delay_us(500);
pulses = (1.22f)*(300);//(1.63f)*(300);
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
// if(Turns >= Layer) {
//  Layer = Layer + Layer;
//  portc.f2 = ~portc.f2;
//  }
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
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


//PARAMETERS
const char *ParameterName[18] = {
                       "Voltage In",
                       "Voltage Out",
                       "Current Out",
                       "Core Width",
                       "Core Height",
                       "Winding Height",
                       "Winding Length",
                       "",                         //Placeholder for "Computing Screen"
                       "Power(VA)",
                       "Current In",
                       "Perimeter",
                       "NoOfTurns(1st)",
                       "NoOfTurns(2nd)",
                       "WireSize(1st)",
                       "WireSize(2nd)",
                       "WeightWire1",
                       "WeightWire2",
                       "Air Gap"
                       };

char *Unit[9] = {
                       "volts",
                       "amps",
                       "mm.",
                       "times",
                       "AWG",
                       "kg.",
                       "sq.mm.",
                       "VA",
                       "",
                 };
float FParameter[20] = {
                       0,0,3.0,0,0,
                       0,0,0,0,0,
                       0,0,0,0,0,
                       0,0,0,0,0
                       };
int IParameter[20] = {
                      220,6,0,29,29,
                      11,36,0,0,0,
                      0,0,0,0,0,
                      0,0,0,0,0
                      };
const char LCD_txt1[] = "Adjust Knob";
const char LCD_txt2[] = "For Start Point";
const char LCD_txt3[] = "WindingFinished!";
const char LCD_txt4[] = "PressOkToReturn";
const char LCD_txt5[] = "PressOktoProceed";
const char LCD_txt6[] = "Start Winding?";
const char LCD_txt7[] = "Insert 1st Wire";
const char LCD_txt8[] = "First Winding: ";
const char LCD_txt9[] = "Insert 2nd Wire";
const char LCD_txt10[] = "Second Winding: ";
const char LCD_txt11[] = "Turn No:  ";
const char LCD_txt12[] = "                ";
//// {AWG NO.,DIAMETER,KG/M,CURRENT CAPACITY,StepperCalibrated Delay}
float AWG[19][4] = {
{16,1.63,0.0185,5.46},
{17,1.42,0.0142,4.18},
{18,1.22,0.0104,3.07},
{19,1.02,0.00723,2.13},
{20,0.914,0.00586,1.73},
{21,0.813,0.00463,1.37},
{22,0.711,0.00354,1.05},
{23,0.61,0.0026,0.768},
{24,0.559,0.00219,0.645},
{25,0.508,0.00181,0.533},
{26,0.457,0.00146,0.432},
{27,0.417,0.00122,0.359},
{28,0.376,0.00099,0.292},
{29,0.345,0.000836,0.247},
{30,0.315,0.000695,0.205},
{31,0.295,0.000608,0.179},
{32,0.274,0.000521,0.156},
{33,0.254,0.000452,0.133},
{34,0.234,0.000383,0.113}
};


// FUNCTIONS

void IDisplay(char *a, int b,char *c);
void FDisplay(char *a, float b,char *c);
void interrupt();
void Compute();
void WindingProcess(int,int,float);
////////////////////////////////////START OF GLOBAL VARIABLES////////////////////////////////////
volatile unsigned int MenuNo,TurnCount,RunStepper;
int MaxMenu,
    EnableInputs,
    CountingOn,
    Pulse,
    test,
    RBPORTCHANGE,
    i,x;
char itext[7],          //for IntToStr
     ftext[15];         //for FloatToStr
unsigned char state;                   //For Rotary Encoder
////////////////////////////////////END OF GLOBAL VARIABLES////////////////////////////////////

//Workaround for RAM Consumption
char* txttoram(const char* ctxt){
  static char txt[20];
  char i;
  for(i =0; txt[i] = ctxt[i]; i++);

  return txt;
}
char* txttoram2(const char* ctxt){
  static char txt[20];
  char i;
  for(i =0; txt[i] = ctxt[i]; i++);

  return txt;
}
/////////////////////FloatToStringWithDecimalLimiter///////////////
void ftswd(float f, char * txt, char dec) {
   unsigned long n;
   short i = 0, j, tmp = 0, len = dec;
   unsigned long p[10] = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000};

   n = f * p[dec];

   if (n < p[dec])
      tmp = 1;

   do {
      if (i == dec) {
         txt[i++] = '.';
         continue;
      }
      txt[i++] = n % 10 + '0';
      n /= 10;
   } while((len-- > 0) || n);

   if (tmp)
      txt[i++] = '0';

   txt[i] = '\0';

   for (j = i - 1, i = 0; i < j; i++, j--)
       tmp = txt[i], txt[i] = txt[j], txt[j] = tmp;
}
////////////Stepper Pulses Generators///////////////
void steppertest(int NoOfPulses){
 for(pulse = 0; pulse <= NoOfPulses; pulse++){
  latc.f1 = 1;
  delay_cyc(70);
  latc.f1 = 0;
  delay_cyc(70);
 }
}
void stepper(int NoOfPulses){
 for(pulse = 0; pulse <= NoOfPulses; pulse++){
  latc.f1 = 1;
  delay_us(100);
  latc.f1 = 0;
  delay_us(100);
 }
}

////////////////////////////////////START OF MAIN PROGRAM////////////////////////////////////
void main() {
TRISA = 0b000000;
TRISB = 0b11111111;
TRISC = 0b00001000;
ADCON1 = 0b00001111;
CMCON = 7;
PORTA = 0;
PORTB = 0;
PORTC = 0;
delay_ms(100);
//LCDInit
Lcd_Init();
//WATCHDOG
WDTCON.SWDTEN = 0;
//Interrupt Bits
INTCON.RBIE = 1;    //RB Port Change Interrupt Enable bit
INTCON.RBIF = 0;
INTCON2.RBIP = 0;   //RB Port Change Interrupt Priority Bit
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
//STEPPER INIT
portc.f0 = 0; //ENABLE if 0 = on; 1 = off
RunStepper = 0;
//TRIAC INIT
portc.f7 = 0;
portc.f6 = 0;
/////////////////////////
  //Starting Message//
Lcd_Cmd(_Lcd_Clear);
LCD_Out(1,3,"Transformer");
LCD_Out(2,4,"Coil Winder");
delay_ms(500);
Lcd_Cmd(_Lcd_Clear);
LCD_Out(1,2,"Enter");
LCD_Out(2,2,"Specifications");
delay_ms(500);
  //Starting Message//
////////////////////////

//INITIALIZE VALUES//
CountingOn = 0;
MaxMenu = 30;
MenuNo = 0;
delay_ms(500);

 //Start of Loop//
 for(;;) {
   EnableInputs = 1;
   if(MenuNo > MaxMenu) MenuNo = 0;
    Lcd_Cmd(_LCD_CURSOR_OFF);
    switch (MenuNo) {
      case 0:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[0]);  //Voltage In
           break;
      case 1:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[0]);   //Voltage Out
           break;
      case 2:
           FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[1]); //Current Out
           break;
      case 3:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);   //XsectionWidth
           break;
      case 4:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);   //XsectionLength
           break;
      case 5:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);   //Window Height
           break;
      case 6:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);   //Window Length
           break;
      case 7:
           Compute();
           break;
      case 8:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[7]);  //Power
           break;
      case 9:
           FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[1]);  //Current In
           break;
      case 10:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);  //Perimeter
           break;
      case 11:
           IDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[3]);   //Noturn1
           break;
      case 12:
           IDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[3]);   //Noturn2
           break;
      case 13:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[4]);  //Wiresize1
           break;
      case 14:
           IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[4]);//Wiresize2
           break;
      case 15:
           FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[5]);//WeightWire1
           break;
      case 16:
           FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[5]);//WeightWire2
           break;
      case 17:
           FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[6]);//Available Window Area
           break;
      case 18:
           IDisplay(txttoram(LCD_txt8),IParameter[7],txttoram2(LCD_txt7)); /// first winding insert 1st wire
           break;
      case 19:///////////////////////START CALIBRATION OF STEPPER //////////////////////////////
           IDisplay(txttoram(LCD_txt1),IParameter[7],txttoram2(LCD_txt2)); ///  ADJUST KNOB FOR START POINT
           if (RunStepper == 1) {
           latc.f0 = 0;
           RunStepper = 0;
           steppertest(150);
           }
           break;
      case 20:
           IDisplay(txttoram(LCD_txt6),IParameter[7],txttoram2(LCD_txt12)); /// start winding null
           break;
      case 21:///////////////////////START OF FIRST WINDING PROCESS //////////////////////////////////
           IDisplay(txttoram(LCD_txt8),IParameter[7],txttoram2(LCD_txt11));  /// First winding, turn no:
           WindingProcess(FParameter[11],FParameter[22],FParameter[18]);
           break;
      case 22:
           IDisplay(txttoram(LCD_txt3),IParameter[7],txttoram2(LCD_txt5));    ///winding finished! press to proceed
           break;
      case 23:
           IDisplay(txttoram(LCD_txt10),IParameter[7],txttoram2(LCD_txt9)); /// second winding insert 1st wire
           break;
      ////////////////////////////////////////secondary winding///////////////////////////////////////
      case 24:///////////////////////START CALIBRATION OF STEPPER //////////////////////////////
           IDisplay(txttoram(LCD_txt1),IParameter[7],txttoram2(LCD_txt2)); ///  ADJUST KNOB FOR START POINT
           if (RunStepper == 1) {
           latc.f0 = 0;
           RunStepper = 0;
           steppertest(150);
           }
           break;
      case 25:
            IDisplay(txttoram(LCD_txt6),IParameter[7],txttoram2(LCD_txt12)); /// start winding null
           break;
      case 26:///////////////////////START OF second WINDING PROCESS //////////////////////////////////
           IDisplay(txttoram(LCD_txt10),IParameter[7],txttoram2(LCD_txt11));  //2nd Winding Insert 2nd Wire
           WindingProcess(FParameter[12],FParameter[23],FParameter[19]);
           break;
      case 27:
           IDisplay(txttoram(LCD_txt3),IParameter[7],txttoram2(LCD_txt4));
           break;
      }//SWITCH
   
   }//FOR
}//MAIN
////////////////////////////////END OF MAIN PROGRAM////////////////////////////////////
//////////////////////////////////INTERRUPT FUNCTION ///////////////////////////////////
void interrupt() {
//  INT0 --- BACK MENU
  if (INTCON.INT0IF == 1 && EnableInputs == 1){
   if (Button(&PORTB,0,150,1)) {
    MenuNo = MenuNo - 1;
    switch (MenuNo) {
     case 7: MenuNo = 6; break;
     case 21: MenuNo = 18; break;
     case 26: MenuNo = 23; break;
     }
    if (MenuNo <= 0) MenuNo = 0;
    }
   }
  INTCON.INT0IF = 0;
  
  //INT1 --- OK/NEXT MENU
  if (INTCON3.INT1IF == 1 && EnableInputs == 1){
   if (Button(&PORTB,1,150,1)) {
    MenuNo = MenuNo + 1;
    if (MenuNo >= MaxMenu) MenuNo = 0;
    if (MenuNo >= 7 && portc.f5 == 0) MenuNo = 23;
    }
  }
  INTCON3.INT1IF = 0;
  
//  INT2 --- COUNTER
  if (INTCON3.INT2IF == 1 && CountingOn == 1 && EnableInputs == 0){
   if (Button(&PORTB,2,2,1)) {
   TurnCount = TurnCount + 1;
   RunStepper = 1;
   }
  }
  INTCON3.INT2IF = 0;
  
 ////////////////////////////////////////IOC RB PORT CHANGE --- ROTARY ENCODER///////////////////////////////////////
  if (INTCON.RBIF == 1 && EnableInputs == 1 && MenuNo <7 || MenuNo == 19 || MenuNo == 24) {
    static unsigned char prevState=0xFF;
    state = PORTB.RB4 | PORTB.RB5<<1;
    if(prevState != 0xFF) { //If this is not the first time we enter the interrupt, process the gray codes
     if(prevState == 0b00 && state == 0b01 //Turn counterclockwise
     || prevState == 0b01 && state == 0b11
     || prevState == 0b11 && state == 0b10
     || prevState == 0b10 && state == 0b00) {
        ///////////////////////////NCREMENT
       if(MenuNo == 2) FParameter[MenuNo] = FParameter[MenuNo] + 0.1000001f;              //for current
       else if (MenuNo != 2 && MenuNo < 22 ) IParameter[MenuNo] = IParameter[MenuNo] + 1;
       if(MenuNo == 19 || MenuNo == 24) {
        if(portc.f2 != 0) {
         latc.f2 = 0;
         }
        RunStepper = 1 ;
        }
                                            }
       ////////////////////////////INCREMENT
     else if(prevState == 0b00 && state == 0b10 //Turn clockwise
     || prevState == 0b01 && state == 0b00) {
       ////////////////////////////DECREMENT
      if(MenuNo == 2) { //for current
       FParameter[MenuNo] = FParameter[MenuNo] - 0.1000001f;
       if (FParameter[MenuNo] < 0) FParameter[MenuNo] = 0;
      }
      else IParameter[MenuNo] = IParameter[MenuNo] - 1;
      if (IParameter[MenuNo] < 0) IParameter[MenuNo] = 0;
      if(MenuNo == 19 || MenuNo == 24) {
       if(portc.f2 != 1) {
        latc.f2 = 1;
        }
       RunStepper = 1;
      }
                                            }
     ////////////////////////////DECREMENT
    }
    prevState = state; //Save previous port b state.
   }
     INTCON.RBIF = 0;
  ////////////////////////////////////////////////////////////////
  //End of ISR
}
void Compute() {
    float UsedArea,Weight1,Weight2,I1,I2,SectionKernel,TurnsPerLayer1,TurnsPerLayer2;
    float WeightWire1,WeightWire2,AvailableArea,diameter1,diameter2;
    float Pulse1st,Pulse2nd,NoOfTurns1,NoOfTurns2,WindingLength,microstep;
    int PrimaryGauge,SecondaryGauge,Perimeter,CoreWidth,CoreLength,WindingHeight;
    int V1,V2,Power,delaystpr1,delaystpr2;
    EnableInputs = 0;

 //For Readability of Computations
 V1 = IParameter[0];
 V2 = IParameter[1];
 I2 = FParameter[2];
 CoreWidth = IParameter[3];
 CoreLength = IParameter[4];
 WindingHeight = IParameter[5];
 WindingLength = (float)IParameter[6];
 WindingLength = WindingLength - 0.25f; //allowance to prevent wire going out of bounds
 Microstep = 280.0f;
     Lcd_Cmd(_Lcd_Clear);
     Lcd_Out(1,1,"Computing");

     //Current Input
     Power = V2 * I2;
     I1 = (float)Power/(float)V1;
     Lcd_Chr_Cp('.');
     delay_ms(100);

   //For Section Kernel
     SectionKernel = sqrt((float)Power);           //l*w
     Lcd_Chr_Cp('.');
     delay_ms(100);

   //Turns & Turnspervolt
     NoOfTurns1 = (42.0f/SectionKernel)*(float)V1;                  // "1st Turn/s",
     NoOfTurns2 = (42.0f/SectionKernel)*(float)V2;                  // "2nd Turn/s",
     NoOfTurns1 = NoOfTurns1 + 1.0f;
     NoOfTurns2 = NoOfTurns2 + 1.0f;
     Lcd_Chr_Cp('.');
     delay_ms(100);

   //Gauge & Stepper Calculations & Turns Per Layer
   //scans the multidimensional array.column 3 is max current;column 0 is AWG no.;column 1 is diameter ; column 4 is delay stpr
   for(i=18;;i--) {
       if(I1 < AWG[i][3]) {
        PrimaryGauge = AWG[i-1][0] ;   // -1 to ensure high current capacity
        Pulse1st = AWG[i-1][1]*(microstep);    //Pulse per Turn
        TurnsPerLayer1 = (float)WindingLength/AWG[i - 1][1];  //Turns Per Layer
        diameter1 = AWG[i - 1][1];
        break;
       }
     }
   for(i=18;;i--) {
       if(I2 < AWG[i][3]) {
        SecondaryGauge = AWG[i-1][0];  // -1 to ensure high current capacity
        Pulse2nd = AWG[i-1][1]*(microstep);
        TurnsPerLayer2 = (float)WindingLength/AWG[i-1][1];  //Turns Per Layer
        diameter2 = AWG[i-1][1];
        break;
       }
     }
       Lcd_Chr_Cp('.');
       delay_ms(100);

   //Perimeter
     Perimeter = (2*CoreWidth) + (2*CoreLength);
     Lcd_Chr_Cp('.');
     delay_ms(100);
   //Weight of Wire
   /////////////////////////////////////
   /////////////////////////////////////
   /////////////////////////////////////
     Lcd_Chr_Cp('.');
     delay_ms(100);

   //UsedArea
     AvailableArea = ((float)WindingLength*(float)WindingHeight)-((float)WindingLength*((float)NoOfTurns1/(float)TurnsPerLayer1)*diameter1 + (float)WindingLength*((float)NoOfTurns2/(float)TurnsPerLayer2)*diameter2);
     Lcd_Chr_Cp('.');
     delay_ms(100);


 IParameter[8] = Power;
 FParameter[9] = I1;
 IParameter[10] = Perimeter;
 FParameter[11] = NoOfTurns1;
 FParameter[12] = NoOfTurns2;
 IParameter[13] = PrimaryGauge;
 IParameter[14] = SecondaryGauge;
 FParameter[15] = WeightWire1;
 FParameter[16] = WeightWire2;
 FParameter[17] = AvailableArea;
 FParameter[18] = TurnsPerLayer1;
 FParameter[19] = TurnsPerLayer2;
 IParameter[20] = delaystpr1;
 IParameter[21] = delaystpr2;
 FParameter[22] = Pulse1st;
 FParameter[23] = Pulse2nd;
     Lcd_Chr_Cp('.');
     delay_ms(400);

     Lcd_Cmd(_Lcd_Clear);
     MenuNo = MenuNo + 1;
     EnableInputs = 1;

     delay_ms(400);
}
////////////////////////////////////START OF DISPLAY FUNCTIONS////////////////////////////////////
void IDisplay(char *a,int b,char *c) {
     IntToStr(b,itext);
     Lcd_Cmd(_Lcd_Clear);
     LCD_Out(1,1,a);
     LCD_Out(2,1,itext);
     if (MenuNo >= 18) i = 1;
     else i = 10;
     LCD_Out(2,i,c);
     delay_ms(100);
}
void FDisplay(char *a,float b,char *c) {
     if(MenuNo <=7) {
     ftswd(b,ftext,1);
     }
     else ftswd(b,ftext,4);
     Lcd_Cmd(_Lcd_Clear);
     LCD_Out(1,1,a);
     LCD_Out(2,1,ftext);
     LCD_Out(2,10,c);
     delay_ms(100);
}
////////////////////////////////////END OF DISPLAY FUNCTIONS////////////////////////////////////
void WindingProcess(int xturns,int PulsesPerTurn, float TurnsPerLayer) {
float nLayers;
//INTRO
EnableInputs = 0;
CountingOn = 1;
TurnCount = 0;
nLayers = TurnsPerLayer;
latc.f0 = 0;     //turn on stepper
latc.f2 = 0;     //right

latc.f6 = 1;                    /////// TURN ON BREAK
delay_ms(50);                   //delay to stop stalling of motor
latc.f7 = 1;                   /////// TURN ON MOTOR
 do {
         IntToStr(TurnCount,itext);
         LCD_Out(2,10,itext);
         if(Runstepper == 1) {
         RunStepper = 0;
         Stepper(PulsesPerTurn);
         }
         if (TurnCount >= nLayers) {
         nlayers = nlayers + TurnsPerLayer;
         portc.f2 = ~portc.f2;
         }

 }
 while (TurnCount < xturns);

latc.f7 = 0;                   /////// TURN OFF MOTOR
delay_ms(50);                   //delay to stop stalling of motor
latc.f6 = 0;                    /////// TURN OFF BREAK

//OUTRO
CountingOn = 0;
EnableInputs = 1;
latc.f0 = 1;
MenuNo = MenuNo + 1;
delay_ms(200);
}
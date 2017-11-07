#line 1 "C:/Users/Joem Diente/Google Drive/Thesis Backup/Program/Display.c"
#line 13 "C:/Users/Joem Diente/Google Drive/Thesis Backup/Program/Display.c"
 sbit LCD_RS at LATA0_bit ; sbit LCD_RS_Direction  at TRISA0_bit ; 
 sbit LCD_EN at LATA1_bit ; sbit LCD_EN_Direction  at TRISA1_bit ; 
 sbit LCD_D4 at LATA2_bit ; sbit LCD_D4_Direction  at TRISA2_bit ; 
 sbit LCD_D5 at LATA3_bit ; sbit LCD_D5_Direction  at TRISA3_bit ; 
 sbit LCD_D6 at LATA4_bit ; sbit LCD_D6_Direction  at TRISA4_bit ; 
 sbit LCD_D7 at LATA5_bit ; sbit LCD_D7_Direction  at TRISA5_bit ; 




const char *ParameterName[18] = {
 "Voltage In",
 "Voltage Out",
 "Current Out",
 "Core Width",
 "Core Height",
 "Winding Height",
 "Winding Length",
 "",
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




void IDisplay(char *a, int b,char *c);
void FDisplay(char *a, float b,char *c);
void interrupt();
void Compute();
void WindingProcess(int,int,float);

volatile unsigned int MenuNo,TurnCount,RunStepper;
int MaxMenu,
 EnableInputs,
 CountingOn,
 Pulse,
 test,
 RBPORTCHANGE,
 i,x,
 temp;
char itext[7],
 ftext[15];
unsigned char state;



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

Lcd_Init();

WDTCON.SWDTEN = 0;

INTCON.RBIE = 1;
INTCON.RBIF = 0;
INTCON2.RBIP = 0;
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


portc.f0 = 0;
RunStepper = 0;

portc.f7 = 0;
portc.f6 = 0;


Lcd_Cmd(_Lcd_Clear);
LCD_Out(1,3,"Transformer");
LCD_Out(2,4,"Coil Winder");
delay_ms(500);
Lcd_Cmd(_Lcd_Clear);
LCD_Out(1,2,"Enter");
LCD_Out(2,2,"Specifications");
delay_ms(500);




CountingOn = 0;
MaxMenu = 30;
MenuNo = 0;
delay_ms(500);


 for(;;) {
 EnableInputs = 1;
 if(MenuNo > MaxMenu) MenuNo = 0;
 Lcd_Cmd(_LCD_CURSOR_OFF);
 switch (MenuNo) {
 case 0:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[0]);
 break;
 case 1:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[0]);
 break;
 case 2:
 FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[1]);
 break;
 case 3:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);
 break;
 case 4:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);
 break;
 case 5:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);
 break;
 case 6:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);
 break;
 case 7:
 Compute();
 break;
 case 8:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[7]);
 break;
 case 9:
 FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[1]);
 break;
 case 10:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[2]);
 break;
 case 11:
 IDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[3]);
 break;
 case 12:
 IDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[3]);
 break;
 case 13:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[4]);
 break;
 case 14:
 IDisplay(txttoram(ParameterName[MenuNo]),IParameter[MenuNo],Unit[4]);
 break;
 case 15:
 FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[5]);
 break;
 case 16:
 FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[5]);
 break;
 case 17:
 FDisplay(txttoram(ParameterName[MenuNo]),FParameter[MenuNo],Unit[6]);
 break;
 case 18:
 IDisplay(txttoram(LCD_txt8),IParameter[7],txttoram2(LCD_txt7));
 break;
 case 19:
 IDisplay(txttoram(LCD_txt1),IParameter[7],txttoram2(LCD_txt2));
 if (RunStepper == 1) {
 latc.f0 = 0;
 RunStepper = 0;
 steppertest(150);
 }
 break;
 case 20:
 IDisplay(txttoram(LCD_txt6),IParameter[7],txttoram2(LCD_txt12));
 break;
 case 21:
 IDisplay(txttoram(LCD_txt8),IParameter[7],txttoram2(LCD_txt11));
 WindingProcess(FParameter[11],FParameter[22],FParameter[18]);
 break;
 case 22:
 IDisplay(txttoram(LCD_txt3),IParameter[7],txttoram2(LCD_txt5));
 break;
 case 23:
 IDisplay(txttoram(LCD_txt10),IParameter[7],txttoram2(LCD_txt9));
 break;

 case 24:
 IDisplay(txttoram(LCD_txt1),IParameter[7],txttoram2(LCD_txt2));
 if (RunStepper == 1) {
 latc.f0 = 0;
 RunStepper = 0;
 steppertest(150);
 }
 break;
 case 25:
 IDisplay(txttoram(LCD_txt6),IParameter[7],txttoram2(LCD_txt12));
 break;
 case 26:
 IDisplay(txttoram(LCD_txt10),IParameter[7],txttoram2(LCD_txt11));
 WindingProcess(FParameter[12],FParameter[23],FParameter[19]);
 break;
 case 27:
 IDisplay(txttoram(LCD_txt3),IParameter[7],txttoram2(LCD_txt4));
 break;
 }

 }
}


void interrupt() {
 temp = portb;

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


 if (INTCON3.INT1IF == 1 && EnableInputs == 1){
 if (Button(&PORTB,1,150,1)) {
 MenuNo = MenuNo + 1;
 if (MenuNo >= MaxMenu) MenuNo = 0;
 if (MenuNo >= 7 && portc.f5 == 0) MenuNo = 23;
 }
 }
 INTCON3.INT1IF = 0;


 if (INTCON3.INT2IF == 1 && CountingOn == 1 && EnableInputs == 0){
 if (Button(&PORTB,2,2,1)) {
 TurnCount = TurnCount + 1;
 RunStepper = 1;
 }
 }
 INTCON3.INT2IF = 0;


 if (INTCON.RBIF == 1 && EnableInputs == 1 && MenuNo <7 || MenuNo == 19 || MenuNo == 24) {
 static unsigned char prevState=0xFF;
 state = PORTB.RB4 | PORTB.RB5<<1;
 if(prevState != 0xFF) {
 if(prevState == 0b00 && state == 0b01
 || prevState == 0b01 && state == 0b11
 || prevState == 0b11 && state == 0b10
 || prevState == 0b10 && state == 0b00) {

 if(MenuNo == 2) FParameter[MenuNo] = FParameter[MenuNo] + 0.1000001f;
 else if (MenuNo != 2 && MenuNo < 22 ) IParameter[MenuNo] = IParameter[MenuNo] + 1;
 if(MenuNo == 19 || MenuNo == 24) {
 if(portc.f2 != 0) {
 latc.f2 = 0;
 }
 RunStepper = 1 ;
 }
 }

 else if(prevState == 0b00 && state == 0b10
 || prevState == 0b01 && state == 0b00) {

 if(MenuNo == 2) {
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

 }
 prevState = state;
 }
 latb = temp;
 INTCON.RBIF = 0;


}
void Compute() {
 float UsedArea,Weight1,Weight2,I1,I2,SectionKernel,TurnsPerLayer1,TurnsPerLayer2;
 float WeightWire1,WeightWire2,AvailableArea,diameter1,diameter2;
 float Pulse1st,Pulse2nd,NoOfTurns1,NoOfTurns2,WindingLength,microstep;
 int PrimaryGauge,SecondaryGauge,Perimeter,CoreWidth,CoreLength,WindingHeight;
 int V1,V2,Power;
 EnableInputs = 0;



 V1 = IParameter[0];
 V2 = IParameter[1];
 I2 = FParameter[2];
 CoreWidth = IParameter[3];
 CoreLength = IParameter[4];
 WindingHeight = IParameter[5];
 WindingLength = (float)IParameter[6];
 WindingLength = WindingLength - 0.25f;
 Microstep = 310.0f;
 Lcd_Cmd(_Lcd_Clear);
 Lcd_Out(1,1,"Computing");


 Power = V2 * I2;
 I1 = (float)Power/(float)V1;
 Lcd_Chr_Cp('.');
 delay_ms(100);


 SectionKernel = sqrt((float)Power);
 Lcd_Chr_Cp('.');
 delay_ms(100);


 NoOfTurns1 = (42.0f/SectionKernel)*(float)V1;
 NoOfTurns2 = (42.0f/SectionKernel)*(float)V2;
 NoOfTurns1 = NoOfTurns1 + 1.0f;
 NoOfTurns2 = NoOfTurns2 + 1.0f;
 Lcd_Chr_Cp('.');
 delay_ms(100);



 for(i=18;;i--) {
 if(I1 < AWG[i][3]) {
 PrimaryGauge = AWG[i-1][0] ;
 Pulse1st = AWG[i-1][1]*(microstep);
 TurnsPerLayer1 = (float)WindingLength/AWG[i - 1][1];
 diameter1 = AWG[i - 1][1];
 break;
 }
 }
 for(i=18;;i--) {
 if(I2 < AWG[i][3]) {
 SecondaryGauge = AWG[i-1][0];
 Pulse2nd = AWG[i-1][1]*(microstep);
 TurnsPerLayer2 = (float)WindingLength/AWG[i-1][1];
 diameter2 = AWG[i-1][1];
 break;
 }
 }
 Lcd_Chr_Cp('.');
 delay_ms(100);


 Perimeter = (2*CoreWidth) + (2*CoreLength);
 Lcd_Chr_Cp('.');
 delay_ms(100);




 Lcd_Chr_Cp('.');
 delay_ms(100);


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
 FParameter[22] = Pulse1st;
 FParameter[23] = Pulse2nd;
 Lcd_Chr_Cp('.');
 delay_ms(400);

 Lcd_Cmd(_Lcd_Clear);
 MenuNo = MenuNo + 1;
 EnableInputs = 1;

 delay_ms(400);
}

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

void WindingProcess(int xturns,int PulsesPerTurn, float TurnsPerLayer) {
float nLayers;

EnableInputs = 0;
CountingOn = 1;
TurnCount = 0;
nLayers = TurnsPerLayer;
latc.f0 = 0;
latc.f2 = 0;

latc.f6 = 1;
delay_ms(50);
latc.f7 = 1;
 do {

 if(Runstepper == 1) {
 RunStepper = 0;
 Stepper(PulsesPerTurn);
 IntToStr(TurnCount,itext);
 LCD_Out(2,10,itext);
 }
 if (TurnCount >= nLayers) {
 nlayers = nlayers + TurnsPerLayer;
 portc.f2 = ~portc.f2;
 }

 }
 while (TurnCount < xturns);

latc.f7 = 0;
delay_ms(50);
latc.f6 = 0;


CountingOn = 0;
EnableInputs = 1;
latc.f0 = 1;
MenuNo = MenuNo + 1;
delay_ms(200);
}

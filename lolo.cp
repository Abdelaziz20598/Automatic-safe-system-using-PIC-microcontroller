#line 1 "D:/Data_H/data/courses_and_data/projects to github/task3/motorDirection/lolo.c"
 sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


 char txt[7];
 int time,counter=0;

char keypadPort at PORTB;

int i;
char password[4];

char get_password()
{
 line1:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Enter Password :");

 for(i=0;i<3;i++)
 {
 while (password[i] == 0)
 {
 password[i] = Keypad_Key_Click();
 }

 if(password[i]==1) password[i] = '7';
 if(password[i]==2) password[i] = '8';
 if(password[i]==3) password[i] = '9';
 if(password[i]==5) password[i] = '4';
 if(password[i]==6) password[i] = '5';
 if(password[i]==7) password[i] = '6';
 if(password[i]==9) password[i] = '1';
 if(password[i]==10) password[i] = '2';
 if(password[i]==12) password[i] = '3';
 Lcd_Chr(2, i+1, password[i] );
 }
 delay_ms(500);
 if(strncmp(password,"122", strlen("122")) == 0) {
 return 1;
 }
 else
 {
 password[0] = 0;
 password[1] = 0;
 password[2] = 0;
 goto line1;
 }
}

void initialize_timer_Interrupt(void){
 TMR0IE_bit=1;
 GIE_bit=1;
 T0CS_bit=0;
 PSA_bit=0;
 PS0_bit=1;
 PS1_bit=0;
 PS2_bit=0;
 TMR0=6;
}
 void interrupt() {
 if (INTCON.TMR0IF==1) {
 counter++;
 INTCON.TMR0IF=0;
 TMR0=6;
 }
 }

void main()
{
 trisc=0; portc=0;

 Lcd_Init(); keypad_Init();

 Lcd_Cmd(_LCD_CURSOR_OFF);

 get_password();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1 , "Welcome ENG ");
 delay_ms(300);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1 , "Abdelaziz");
 delay_ms(300);
 Lcd_Out(1,1,"Elapesed Time:");
 initialize_timer_Interrupt();
 time=0;
 while(1){
 if(counter==500){
 counter=0;

 IntToStrWithZeros(time, txt);
 Lcd_Out(2,1,txt);
 time=++time;

 rc0_bit=0;
 rc1_bit=1;

 if(time>4){
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2,1,"stop motor");
 rc0_bit=0;
 rc1_bit=0;
 break;
 }



 }
 }






 }

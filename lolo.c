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
 // ************************
char  keypadPort at PORTB;

int i;
char password[4];

char get_password()
{
   line1:
   Lcd_Cmd(_LCD_CLEAR);     // clear LCD
   Lcd_Out(1, 1, "Enter Password :"); // Displaying

     for(i=0;i<3;i++)
     {
           while (password[i] == 0)
           {
            password[i] = Keypad_Key_Click();
           }

          if(password[i]==1)     password[i]  = '7';
          if(password[i]==2)     password[i]  = '8';
          if(password[i]==3)     password[i]  = '9';
          if(password[i]==5)     password[i]  = '4';
          if(password[i]==6)     password[i]  = '5';
          if(password[i]==7)     password[i]  = '6';
          if(password[i]==9)     password[i]  = '1';
          if(password[i]==10)    password[i]  = '2';
          if(password[i]==12)    password[i]  = '3';
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
    TMR0IE_bit=1;       // Enable timer 0 interrupt
    GIE_bit=1;          //Enable Global Interrupt
    T0CS_bit=0;                  // Select f/4 clock for the TMR0
    PSA_bit=0;                 // Prescaler is assigned to the Timer0 module
    PS0_bit=1;                // Set pre-scaler to 32
    PS1_bit=0;                // PS2,PS1,PS0 = 100
    PS2_bit=0;
    TMR0=6;                  //counter starting value
}
    void interrupt() {        // Interrupt handler
  if (INTCON.TMR0IF==1) {     // check for timer 0 interrupt flag
    counter++;                // increment 1 every interrupt
    INTCON.TMR0IF=0;          // reset the TMR0IF flag
    TMR0=6;                   // store 6 in the TMR0 register
  }
  }

void main()
{
    trisc=0;    portc=0;

    Lcd_Init();    keypad_Init();

    Lcd_Cmd(_LCD_CURSOR_OFF);

    get_password();

    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1,1 , "Welcome ENG ");
    delay_ms(300);
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1,1 , "Abdelaziz");
    delay_ms(300);
     Lcd_Out(1,1,"Elapesed Time:");  // Show elapsed time message
      initialize_timer_Interrupt();   // invoke timer interrupt initialization function
        time=0;
        while(1){
         if(counter==500){  // check if the counter reaches 125
            counter=0;      // start counter from the beginning

            IntToStrWithZeros(time, txt);  // convert the number of seconds to string
            Lcd_Out(2,1,txt);              // display the number of seconds
                time=++time;    // increase time one second
             //start motor
             rc0_bit=0;
             rc1_bit=1;
              // after 4 seconds stop motor
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
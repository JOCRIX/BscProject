#define BI0 19
#define BI1 24
#define BI2 26
#define BI3 30
#define BI4 32
#define BI5 34
#define BI6 36
#define BI7 38
#define BI8 40
#define BI9 42
#define BI10 44
#define BI11 46
#define BI12 48
#define BI13 50
#define BI14 52
#define BI15 54
#define CLK 51
#define RW 53
#define btn 2

#define in 1
#define out 2

uint8_t commPortArr[16] = {BI0, BI1, BI2, BI3, BI4,
                           BI5, BI6, BI7, BI8, BI9,
                           BI10, BI11, BI12, BI13, BI14,
                           BI15
                          };


volatile uint8_t trig = 0;
uint8_t count = 1;
void Trig_ISR();
void Clk();
void SetPinValue(uint8_t val1, uint8_t val2, uint8_t val3);
void SetPinsMode(uint8_t mode, uint8_t pin0, uint8_t pin1, uint8_t pin2);
void setup() {
  Serial.begin(9600);
  pinMode(btn, INPUT);
  pinMode(RW, OUTPUT);
  digitalWrite(RW, 0);
  pinMode(CLK, OUTPUT);
  digitalWrite(CLK, LOW);
  pinMode(BI0, OUTPUT);
  pinMode(BI2, OUTPUT);

  
  pinMode(BI1, OUTPUT);
  digitalWrite(BI1, 0);
  pinMode(BI2, OUTPUT);
  digitalWrite(BI2, 0);
  digitalWrite(BI0, 0);
  
  attachInterrupt(digitalPinToInterrupt(2), Trig_ISR, RISING);
  // pinMode(CLK, OUTPUT);
  // digitalWrite(CLK, 0);
  // pinMode(RW, OUTPUT);
  // digitalWrite(RW,0);
  // delay(20000);
  trig = 0;
}

void loop() {
  if(count == 16){
    count = 1;
  }
  if (trig == 1) {
    Serial.print("Count :");
    Serial.print(count);
    Serial.println();
    delay(100);
    trig = 0;
    switch (count) {
      case 1:
        Serial.println("Case 1");
        digitalWrite(RW, 0); //Write mode
        //SetPinsMode(out, 19, 24, 26);
        pinMode(19, OUTPUT);
        pinMode(24, OUTPUT);
        pinMode(26, OUTPUT);
        digitalWrite(19, 1);
        digitalWrite(24, 1);
        digitalWrite(26, 1);
        //SetPinValue(1, 1, 1); //Address 7
        //CLK now
        count++;

        break;
        case 2:
        Serial.println("Case 2");
        Clk();
        count++;
        break;
        
      case 3:
        Serial.println("Case 3");
        //SetPinValue(0, 0, 1); //Val = 4
        digitalWrite(19, 0);
        digitalWrite(24, 0);
        digitalWrite(26, 1);
                count++;
        break;

      //Write to another add
      case 4:
      Serial.println("Case 4");
        Clk();
        count++;
      break;
      
      case 5:
        Serial.println("Case 5");
        digitalWrite(RW, 0); //Write mode
        //SetPinsMode(out, BI0, BI1, BI2);
        //SetPinValue(1, 0, 0); //Address 1
        digitalWrite(19, 1);
        digitalWrite(24, 0);
        digitalWrite(26, 0);
count++;
        break;
        case 6:
        Serial.println("Case 6");
        Clk();
        count++;
        break;
      case 7:
        Serial.println("Case 7");
       // SetPinValue(0, 1, 1); //Val = 6
        digitalWrite(19, 0);
        digitalWrite(24, 1);
        digitalWrite(26, 1);
count++;
        break;
        case 8:
        Serial.println("Case 8");
                Clk();
        count++;
        break;
      //Lets read them back out
      case 9:
        Serial.println("Case 9");
        digitalWrite(RW, 0); //Write mode for address
        //SetPinsMode(out, BI0, BI1, BI2);
        //SetPinValue(1, 1, 1); //Address 7
        digitalWrite(19, 1);
        digitalWrite(24, 1);
        digitalWrite(26, 1);
count++;
        break;
        case 10:
        Serial.println("Case 10");
                Clk();
        count++;
        break;
      case 11:
        Serial.println("Case 11");
        //SetPinsMode(in, BI0, BI1, BI2);
        pinMode(19, INPUT);
        pinMode(24, INPUT);
        pinMode(26, INPUT);
        digitalWrite(RW, 1); //Write mode
count++;

        
      break;
      case 12:
      Serial.println("Case 12");
              Clk();
              count++;
                      //Value in address 7 should now be available
        Serial.print("Value in Reg 7: ");
        Serial.print(digitalRead(26));
        Serial.print(digitalRead(24));
        Serial.print(digitalRead(19));
        Serial.println("Finished");
      break;
      case 13:
        Serial.println("Case 13");
        digitalWrite(RW, 0); //Write mode for address
        //SetPinsMode(out, BI0, BI1, BI2);
        pinMode(19, OUTPUT);
        pinMode(24, OUTPUT);
        pinMode(26, OUTPUT);
        digitalWrite(19, 1);
        digitalWrite(24, 0);
        digitalWrite(26, 0);
        //SetPinValue(1, 0, 0); //Address 1
count++;
        break;
        case 14:
        Serial.println("Case 14");
                Clk();
        count++;
        break;
      case 15:
        Serial.println("Case 15");
        //SetPinsMode(in, BI0, BI1, BI2);
        digitalWrite(RW, 1); //Write mode
        pinMode(19, INPUT);
        pinMode(24, INPUT);
        pinMode(26, INPUT);
count++;

        
        break;
        case 16:
        Serial.println("Case 16");
                Clk();
                count++;
                        //Value in address 1 should now be available
        Serial.print("Value in Reg 1: ");
        Serial.print(digitalRead(26));
        Serial.print(digitalRead(24));
        Serial.print(digitalRead(19));
        Serial.println("Finished");
        break;
    }
  }
}


void Trig_ISR() {
  trig = 1;
}

void SetPinsMode(uint8_t mode, uint8_t pin0, uint8_t pin1, uint8_t pin2) {
  if (mode = in) {
    pinMode(pin0, INPUT);
    pinMode(pin1, INPUT);
    pinMode(pin2, INPUT);
  } else if (mode = out) {
    pinMode(pin0, OUTPUT);
    pinMode(pin1, OUTPUT);
    pinMode(pin2, OUTPUT);
  }
}

void SetPinValue(uint8_t val1, uint8_t val2, uint8_t val3) {
  digitalWrite(BI0, val1);
  digitalWrite(BI1, val2);
  digitalWrite(BI2, val3);
}

void Clk() {
  digitalWrite(CLK, HIGH);
  delay(1000);
  digitalWrite(CLK, LOW);
}

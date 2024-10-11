#define BIT0 22
#define BIT1 24
#define BIT2 26
#define BIT3 30
#define BIT4 32
#define BIT5 34
#define BIT6 36
#define BIT7 38
#define BIT8 40
#define BIT9 42
#define BIT10 44
#define BIT11 46
#define BIT12 48
#define BIT13 50
#define BIT14 52
#define BIT15 54
#define CLK 51
#define RW 53

uint8_t commPortArr[16] = {BIT0, BIT1, BIT2, BIT3, BIT4,
                           BIT5, BIT6, BIT7, BIT8, BIT9,
                           BIT10, BIT11, BIT12, BIT13, BIT14,
                           BIT15};


uint16_t val1 = 0, val2 = 0;

void setup() {
  Serial.begin(115200);
  SetInput();
  pinMode(CLK, OUTPUT);
  digitalWrite(CLK, 0);
  pinMode(RW, OUTPUT);
  digitalWrite(RW,0);
  delay(5000);
}

void loop() {

  //Write To Address 10, Data = 5

  SetOutput();
  delay(10);
  digitalWrite(RW, 0);
  //CLK address into RAM
  digitalWrite(BIT1, 1);
  digitalWrite(BIT3, 1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  SetAllZero();
  //Set Data to IO
  digitalWrite(BIT0, 1);
  digitalWrite(BIT2, 1);
    digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
    digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
    digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  
  //Write to RAM complete
  SetAllZero();
  //Write To Address 7, Data = 71
  delay(10);
  digitalWrite(RW, 0);
  //CLK address into RAM
  digitalWrite(BIT0, 1);
  digitalWrite(BIT1, 1);
  digitalWrite(BIT2, 1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  SetAllZero();
  //Set Data to IO
  digitalWrite(BIT0, 1);
  digitalWrite(BIT1, 1);
  digitalWrite(BIT2, 1);
  digitalWrite(BIT6, 1);
  //CLK data into RAM
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  //Write to RAM complete
  SetAllZero();
  //Change to READ mode
  digitalWrite(RW, 1);
  
  //Read back value in register 10 and print
  //CLK address 10 into RAM
  digitalWrite(BIT1, 1);
  digitalWrite(BIT3, 1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);

  //Address clocked. Change all OUTPUTS to INPUTS. EXTREMELY IMPORTANT!!
  SetInput();
  //CLK Data Out of RAM
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  //Data should be available on IO PINS
  val1 = CommPortValue();

  //Read back value in register 7 and print
  //CLK address 7 into RAM
  //Change to outputs first
  SetOutput();
  delay(1);
  
  digitalWrite(BIT0, 1);
  digitalWrite(BIT1, 1);
  digitalWrite(BIT2, 1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  SetAllZero();
  //Address clocked, changed all outputs to inputs
  SetInput();
  //CLK data OUT of RAM.
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  digitalWrite(CLK, 1);
  delay(1);
  digitalWrite(CLK,0);
  delay(1);
  val2 = CommPortValue();

  Serial.print("Register 10 Value: ");
  Serial.print(val1);
  Serial.println();

  Serial.print("Register 7 Value: ");
  Serial.print(val1);
  Serial.println();

  delay(30000);
}

void SetOutput(){
for(int i = 0; i < 15; i++){
  pinMode(commPortArr[i], OUTPUT);
  }
}
void SetInput(){
  delay(100);
  for(int i = 0; i < 16; i++){
  pinMode(commPortArr[i], INPUT);
  }
}
void SetAllZero(){
  for(int i = 0; i < 16; i++){
  digitalWrite(commPortArr[i], 0);
  }
}

uint16_t CommPortValue(){
  uint16_t value = 0;

  for(int i = 0; i < 16; i++){
    if(digitalRead(commPortArr[i]) == 1){
      val1 += 1 << i;
    }
  }


  return value;
}

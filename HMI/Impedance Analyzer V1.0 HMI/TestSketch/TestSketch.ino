bool test = false;

uint8_t nextTXTerminate[3] = {0xff, 0xff, 0xff};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(A5, OUTPUT);
  digitalWrite(A5, LOW);
}

void loop() {
//Serial.println("Enter data:");
      while (Serial.available() == 0) {}     //wait for data available
        String teststr = Serial.readString();  //read until timeout
        teststr.trim();                        // remove any \r \n whitespace at the end of the String
      if (teststr == "RunBtn") {
       // Serial.println("A primary color");
       test = !test;
       digitalWrite(A5, test);
       Serial.println("test");
      } else {
        //Serial.println("Something else");
      }
}

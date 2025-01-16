uint32_t test = 0;

char text[] = "Test : ";
uint16_t someNumber = 0;
char nextCmdBuf[20]; //Indeholder message til nextion, aka teksten, aka command parameteren
char txCmdBuf[40]; //Indeholder den komplette string til nextion interfacet

void setup() {
  Serial.begin(115200);

}

void loop() {

  
  sprintf(nextCmdBuf, "%s%d", text, someNumber); //Lav string til command text
  sprintf(txCmdBuf, "ZStringTxt.txt=\"%s\"", nextCmdBuf); //komplet cmd til nextion
  
  delay(100);
  NextSendCmd(txCmdBuf); //Husk dobbelt quotes til Nextion. "\" bruges for at compileren kan tolke dobbelt quotes rigtigt.
  someNumber++;
}

void NextSendCmd(char* cmd){
  Serial.print(cmd);
  Serial.write(0xFF);
  Serial.write(0xFF);
  Serial.write(0xFF);
}

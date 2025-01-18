
enum UARTCommandSet{
  Undefined,
  SetFrequency,
  SetLevel,
  SetSpeed,
  OSCal,
  SetModel
};
/*
struct RXUARTCommand{
  char startCMD;
  char endCMD;

  UARTCOmmandSet NewCommand;
  uint32_t intNumber;
  uint32_t decimalNumber;
  uint32_t prefix;
}RXCMD;
*/
char UARTBuffer[30] = "/bSetFrq/e152.3/pkHz/r";
char txt2[20] = "NotLonger";
uint8_t success = 0;

size_t bufLen = 0;

void setup() {
Serial.begin(115200);

}

void loop() {

//success = CheckForMsgString(&txt2[0], &txt1[0], 9, 30);

//bufLen = sizeof(txt1);

//UARTCommandSet newcmd = GetUARTCommand(&UARTBuffer[0], sizeof(UARTBuffer));
float frqval = UARTGetFrqValue(&UARTBuffer[0], sizeof(UARTBuffer));



Serial.println(frqval);
delay(1000);
}


int8_t CheckForMsgString(char* msgToCheck, char* stringBuffer, size_t msgLength, size_t bufferLength){
  if(msgLength > bufferLength)
  {
    return -1;
  }

  uint8_t foundStr = 0;
  size_t matchingIndexes = 0;
  for (size_t i = 0; i <= bufferLength - msgLength; i++) { 
    size_t matchingIndexes = 0;
    for (size_t j = 0; j < msgLength; j++) {
      if (stringBuffer[i + j] == msgToCheck[j])
        {
          matchingIndexes++;
        }
      else
        {
          break;
        }
    }
    if (matchingIndexes == msgLength)
      {
        return 1; 
      }
    }
  return foundStr;
}
//format is /bSomeCommand/eVALUE/r
UARTCommandSet GetUARTCommand(char* stringBuffer, size_t bufferLength){
    if (bufferLength == 0 || stringBuffer == NULL) { //Trash input
        return Undefined; 
    }
    const char* startCmd = "/b";
    const char* endCmd = "/e";
    size_t startCmdLen = strlen(startCmd);
    size_t endCmdLen = strlen(endCmd);

    // Find start af command med strstr()
    char* start = strstr(stringBuffer, startCmd);
    if (!start) {
        return Undefined; // Ingen b
    }
    // Find slut af command med strstr()
    char* end = strstr(start, endCmd);
    if (!end || end <= start) {
        return Undefined; // Ingen e
    }
    //Hent string mellem /b og /e
    size_t commandLength = (size_t)(end - (start + startCmdLen));
    if (commandLength == 0) {
        return Undefined; //Tomt mellem b og e
    }
    // Check om det mellem b og e matcher en cmd og return det der findes
    if (strncmp(start + startCmdLen, "SetFrq", commandLength) == 0) { //Set Frequency
        return SetFrequency; 
    }else if (strncmp(start + startCmdLen, "SetLvl", commandLength) == 0) { //Set level
      return SetLevel;
    }

return Undefined;
}

  //char UARTBuffer[30] = "/bSetFrq/e152.3/pkHz/r";
float UARTGetFrqValue(char* stringBuffer, size_t bufferLength){
  const char* endCmd = "/e";
  const char* startPrefix = "/p";
  const char* endMsg = "/r";
  const char* decimalChar = ".";
  uint32_t intPart = 0;
  uint32_t floatPart = 0.0;
  uint8_t decimalFound = 0;



  //Find slut af af cmd = start af værdi
  char* ptrValStart = strstr(stringBuffer, endCmd);
  if (!ptrValStart) {
    return 0.0f; // No /e found
  }
  // Find slut position af værdi
  char* ptrValEnd = strstr(ptrValStart, startPrefix);
  if (!ptrValEnd) {
    return 0.0f; // No /p found
  }
  //find slut position af besked
  char* ptrMsgEnd = strstr(ptrValEnd, endMsg);
  if (!ptrMsgEnd) {
    return 0.0f; // No /r found
  }

  //Find position af komma
  char* ptrDecimalPos = strstr(ptrValStart, decimalChar);
    if (!ptrDecimalPos || ptrDecimalPos >= ptrValEnd) {
        decimalFound = 0;
    } else {
        decimalFound = 1;
    }
   if (decimalFound) {

   }else{
    
   }
}


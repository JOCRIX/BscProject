
struct complex {
  double imag;
  double real;
};

struct complexMath{
  
};

complex z;

void setup() {
  Serial.begin(115200);
  z.imag = 1.3;
  z.real = 5.4;


}

void loop() {
  Serial.println(atan(z.imag/z.real));
  delay(1000);
  // put your main code here, to run repeatedly:

}
´
double argc(complex )
{
  return atan2()
}














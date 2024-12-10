#include <math.h>

struct complex {
  double imag;
  double real;
};
struct complexMath{
  double  (*argz)(complex);
  double  (*argzDeg)(complex);
  double  (*magz)(complex);
}cmplxmath;

complex z;

void setup() {
  Serial.begin(115200);
  //z.imag = -1;
  //z.real = 1;
  z = (struct complex){1.0, 1.0};
  cmplxmath.argz = argz;
  cmplxmath.argzDeg = argzDeg;
  cmplxmath.magz = magz;
}

void loop() {
  Serial.print("ARGZ : ");
  Serial.print(cmplxmath.argz(z));
  Serial.println();
  delay(1000);

  Serial.print("ARGZDEG : ");
  Serial.print(cmplxmath.argzDeg(z));
  Serial.println();
  delay(1000);

    Serial.print("MAGZ : ");
  Serial.print(cmplxmath.magz(z));
  Serial.println();
  delay(1000);


}
double argz(complex z)
{
  return atan2(z.imag, z.real); //atan2() tager højde for og korrigerer tangens fejl.
}
double argzDeg(complex z)
{
  return atan2(z.imag, z.real) * (180/M_PI); //atan2() tager højde for og korrigerer tangens fejl.
}
double magz(complex z)
{
  return sqrt(z.real*z.real + z.imag*z.imag);
}

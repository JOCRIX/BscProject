#include <math.h>

struct complexr {
  double imag;
  double real;
};
struct complexpolar{
  double arg;
  double mod;
};
struct complexMath{
  struct rectangular{
    double  (*argz)(complexr);
    double  (*argzDeg)(complexr);
    double  (*magz)(complexr);
  }rec;
  struct polar{ //dont need.

  }pol;
}cmplxmath;

complexr z;

void setup() {
  Serial.begin(115200);
  //z.imag = -1;
  //z.real = 1;
  z = (struct complexr){1.0, 1.0};
  cmplxmath.rec.argz = argzr;
  cmplxmath.rec.argzDeg = argzDegr;
  cmplxmath.rec.magz = magzr;
}

void loop() {
  Serial.print("ARGZ : ");
  Serial.print(cmplxmath.rec.argz(z));
  Serial.println();
  delay(1000);

  Serial.print("ARGZDEG : ");
  Serial.print(cmplxmath.rec.argzDeg(z));
  Serial.println();
  delay(1000);

    Serial.print("MAGZ : ");
  Serial.print(cmplxmath.rec.magz(z));
  Serial.println();
  delay(1000);


}
double argzr(complexr z)
{
  return atan2(z.imag, z.real); //atan2() tager højde for og korrigerer tangens fejl.
}
double argzDegr(complexr z)
{
  return atan2(z.imag, z.real) * (180/M_PI); //atan2() tager højde for og korrigerer tangens fejl.
}
double magzr(complexr z)
{
  return sqrt(z.real*z.real + z.imag*z.imag);
}

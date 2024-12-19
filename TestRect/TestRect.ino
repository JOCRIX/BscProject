
#include <math.h>

typedef struct complexr {
  double real;
  double imag;
}complexr;

typedef struct complexpolar{
  double mod;
  double argDeg;
}complexp;

complexr a = (complexr){1.2,3.9};
complexr b = (complexr){0.5,1.3};
complexr c = (complexr){0,0};
complexr d = (complexr){0,0};

complexp z = (complexp){0.5,-50};
complexp x = (complexp){0.0,0.0};
char string[20];
char string2[20];

void setup() {
  Serial.begin(9600);
  a = PolarToRectangular(z);
 dtostrf(a.real, 4, 1, string); // Converts a.real to a string
  strcat(string, " + j");
  char imag_part[10];
  dtostrf(a.imag, 4, 1, imag_part); // Converts a.imag to a string
  strcat(string, imag_part);
  Serial.println(string);
/*
 dtostrf(b.real, 4, 1, string); // Converts a.real to a string
  strcat(string, " + j");
  //char imag_part[10];
  dtostrf(b.imag, 4, 1, imag_part); // Converts a.imag to a string
  strcat(string, imag_part);
  Serial.println(string);

  c = ComplexDivideRectangularForm(a,b);
   dtostrf(c.real, 4, 1, string); // Converts a.real to a string
  strcat(string, " + j");
  //char imag_part[10];
  dtostrf(c.imag, 4, 1, imag_part); // Converts a.imag to a string
  strcat(string, imag_part);
  Serial.println(string);

  d = Reciprocal(a);
   dtostrf(d.real, 4, 1, string); // Converts a.real to a string
  strcat(string, " + j");
  //char imag_part[10];
  dtostrf(d.imag, 4, 1, imag_part); // Converts a.imag to a string
  strcat(string, imag_part);
  Serial.println(string);

x = Reciprocalzp(z);
   dtostrf(x.mod, 4, 1, string); // Converts a.real to a string
  strcat(string, " + arg");
  //char imag_part[10];
  dtostrf(x.argDeg, 4, 1, imag_part); // Converts a.imag to a string
  strcat(string, imag_part);
  Serial.println(string);
*/



  delay(5000);
  

}

void loop() {
  

}

complexr PolarToRectangular(complexp z){
  return (complexr){
    z.mod * cos(DegToRadians(z.argDeg)),
    z.mod * sin(DegToRadians(z.argDeg))
  };
}

double DegToRadians(double angle){
  return angle * (M_PI/180.0);
}


complexp Reciprocalzp(complexp z){
  return (complexp){1/z.mod,-1*z.argDeg};
}

complexr Reciprocal(complexr a){

  return (complexr){
    a.real/(a.real*a.real + a.imag*a.imag),
    (-1)*(a.imag/(a.real*a.real + a.imag*a.imag))
  };
}

complexr ComplexDivideRectangularForm(complexr v, complexr i){
  complexr z = (complexr)
  {(v.real*i.real + v.imag*i.imag)/((i.imag*i.imag) +(i.real*i.real)),
  ((v.imag * i.real) - (v.real*i.imag))/((i.imag * i.imag) + (i.real * i.real))};
  return z;
}

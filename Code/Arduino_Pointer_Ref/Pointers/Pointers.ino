//This code will be the ultimate pointer walk through.

/*We can have the variable x, &x will then represent the address that x is stored in
We can declare a pointer by assingment int*p;*/


int *p = NULL; // Declare a pointer.

int x = 10;
int result = 0;

/* An interresting analogy is the page number in the index of a book. This index is a pointer to the page number of said content */


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  //This little peace of code assigns the address of x to p, result is then loaded with the value that the address of p is pointing to.
  //In other words, p points to the address of x, in this address the value 10 is stored, When we then say that result will
  //be assinged the value within the address of x, results will be loaded with a value of 10. 
  p = &x;
  result = *p;
  Serial.print("Value of x by pointer: ");
  Serial.println(result);
  space();

  //We can also change the value at address x:
  p = &x;
  *p = 15;
  Serial.print("New value for x: ");
  Serial.println(x);
  space();
  Serial.print("Value that p points to: ");
  Serial.println(*p);
  space();
  //We clearly see that there are numerous ways to change and indicate the value of x.
  //This brings the added bonus that we can access data inside a function, simply by returning a pointer, or a function can access variables not inside it.
  //Here we use the ponterFunc function that takes in an address and writes a 5 to whatever is within that address.
  pointerFunc(&x);
  //We can see that is now contains a 5.
  Serial.print("Changing the value of x by pointer inside a function: ");
  Serial.println(x);
  space();
  //We could for example have a function that multiplies two numbers and returns the result to an adress.
  multiply(9,5, &x);
  Serial.print("The product of 9 and 5, stored in the address of x: ");
  Serial.println(x);
  space();
}

void pointerFunc(int *ptr) {
  *ptr = 5;  
}

void multiply(int a, int b, int *ptr) {
  *ptr = a*b;
}

void space() {
  Serial.println("-----------------------------------------------------------------------------------------");
}

void loop() {
  // put your main code here, to run repeatedly:

}

/*
  Reading a serial ASCII-encoded string.

  This sketch demonstrates the Serial parseInt() function.
  It looks for an ASCII string of comma-separated values.
  It parses them into ints, and uses those to send out to components.

  created 13 Apr 2012
  by Tom Igoe

  This example code is in the public domain.
*/


#include <Servo.h>

Servo myservo, myservo2;  // create servo object to control a servo

int valX;    // variable to read the value from the analog pin
int valY;    // variable to read the value from the analog pin
void setup() {
  Serial.begin(115200);

  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
  myservo2.attach(10);  // attaches the servo on pin 9 to the servo object
}

void loop() {
  while (Serial.available() > 0) { // read if there's any serial available

    valX = Serial.parseInt();  // first valid integer
    valY = Serial.parseInt();  // first valid integer

    if (Serial.read() == '\n') {

      valX = constrain(valX, 0, 180);
      valY = constrain(valY, 0, 180);
      // send messages out of Arduino
      myservo.write(valX);                  // sets the servo position according to the scaled value
      myservo2.write(valY);                  // sets the servo position according to the scaled value
      // print the three numbers in one string as hexadecimal:
      Serial.print(valX);
      Serial.print(valY);

    }
  }
}


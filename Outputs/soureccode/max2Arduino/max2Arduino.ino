/*
  Reading a serial ASCII-encoded string.

  This sketch demonstrates the Serial parseInt() function.
  It looks for an ASCII string of comma-separated values.
  It parses them into ints, and uses those to send out to components.

  created 13 Apr 2012
  by Tom Igoe

  This example code is in the public domain.
*/

// pins for the LEDs:
const int digiPin = 13;
const int sliderPin =A9;
const int sliderPin02 = 4;

void setup() {
  Serial.begin(115200);

  pinMode(digiPin, OUTPUT);
  pinMode(sliderPin, OUTPUT);
  pinMode(sliderPin02, OUTPUT);
}

void loop() {
  while (Serial.available() > 0) { // read if there's any serial available

    int on = Serial.parseInt();  // first valid integer
    int light = Serial.parseInt();  // second valid integer
    int faster = Serial.parseInt();  // third valid integer

    if (Serial.read() == '\n') {

      // for common-anode LED (constrain and invert)
      on = constrain(on, 0, 1);
      light = constrain(light, 0, 255);
      faster = constrain(faster, 0, 255);

   
      // send messages out of Arduino
      digitalWrite(digiPin, on);
      analogWrite(sliderPin, light);
      analogWrite(sliderPin02, faster);

      // print the three numbers in one string as hexadecimal:
      Serial.print(on);
      Serial.print(light);
      Serial.println(faster);

    }
  }
}


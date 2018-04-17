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

const int sliderPin01 = 4;
const int sliderPin02 = 5;
const int sliderPin03 = 6;
const int sliderPin04 = 9;
const int sliderPin05 = 10;

void setup() {
  Serial.begin(115200);


  pinMode(sliderPin01, OUTPUT);
  pinMode(sliderPin02, OUTPUT);
  pinMode(sliderPin03, OUTPUT);
  pinMode(sliderPin04, OUTPUT);
  pinMode(sliderPin05, OUTPUT);
}

void loop() {
  while (Serial.available() > 0) { // read if there's any serial available

    int light = Serial.parseInt();  // first valid integer
    int faster = Serial.parseInt();  // second valid integer
    int intensity = Serial.parseInt();  // third valid integer
    int control = Serial.parseInt();  // fourth valid integer
    int brightness = Serial.parseInt();  // fifth valid integer

    if (Serial.read() == '\n') {


      // send messages out of Arduino

      analogWrite(sliderPin01, light);
      analogWrite(sliderPin02, faster);
      analogWrite(sliderPin03, intensity);
      analogWrite(sliderPin04, control);
      analogWrite(sliderPin05, brightness);


      // print the three numbers in one string as hexadecimal:

      Serial.print(light);
      Serial.println(faster);
      Serial.println(intensity);
      Serial.println(control);
      Serial.println(brightness);
    }
  }
}


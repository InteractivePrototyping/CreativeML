//This demo allows Wekinator to control size, increment, rotation and hue of an object
//All recieved values shoulb be continuous values between 0 and 1
//Visual sketch is modified from http://btk.tillnagel.com/tutorials/rotation-translation-matrix.html

import oscP5.*;
OscP5 oscP5;
import processing.serial.*;
Serial myPort;  // Create object from Serial class

float newVal1, newVal2, newVal3, newVal4, newVal5;
float l1, l2, l3, l4, l5;

void setup() {  
  size(600, 600);
  oscP5 = new OscP5(this, 12000);

  //to arduino
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw () {
  background(0);
  l1=lerp(l1, newVal1, 0.1);
  l2=lerp(l2, newVal2, 0.1);
  l3=lerp(l3, newVal3, 0.1);
  l4=lerp(l4, newVal4, 0.1);
  l5=lerp(l5, newVal5, 0.1);

  //visual of recieved data
  noStroke();
  fill(255, 0, 0);  
  rect(10, 60, 60, l1);
  rect(80, 60, 60, l2);
  rect(150, 60, 60, l3);
  rect(220, 60, 60, l4);
  rect(290, 60, 60, l5);


  drawText();
  serialSend();
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
    if (theOscMessage.checkTypetag("fffff")) { // looking for 4 parameters
      float value1 = theOscMessage.get(0).floatValue();
      float value2 = theOscMessage.get(1).floatValue();
      float value3 = theOscMessage.get(2).floatValue();
      float value4 = theOscMessage.get(3).floatValue();
      float value5 = theOscMessage.get(4).floatValue();

      newVal1=map(value1, 0, 1, 0, 255);
      newVal2=map(value2, 0, 1, 0, 255);
      newVal3=map(value3, 0, 1, 0, 255);
      newVal4=map(value4, 0, 1, 0, 255);
      newVal5=map(value5, 0, 1, 0, 255);
    } else {
      println("Error: unexpected OSC message received by Processing: ");
      theOscMessage.print();
    }
  }
}

void drawText() {
  stroke(0);
  textAlign(LEFT, TOP); 
  fill(255);

  text("Listening for message /wek/inputs on port 12000", 10, 10);
  text("Expecting 5 continuous numeric outputs, all in range 0 to 1:", 10, 25);
  text("values are then mapped between 0-255 and sent to arduino", 10, 40);
}

void serialSend() {
  byte out[] = new byte[5];
  out[0] = byte(l1);
  out[1] = byte(l2);
  out[2] = byte(l3);
  out[3] = byte(l4);
  out[4] = byte(l5);
  myPort.write(out);
}

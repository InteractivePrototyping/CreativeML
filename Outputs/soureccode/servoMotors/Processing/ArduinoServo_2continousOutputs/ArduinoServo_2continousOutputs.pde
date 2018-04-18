//This demo allows Wekinator to control size, increment, rotation and hue of an object
//All recieved values shoulb be continuous values between 0 and 1
//Visual sketch is modified from http://btk.tillnagel.com/tutorials/rotation-translation-matrix.html

import oscP5.*;
OscP5 oscP5;
import processing.serial.*;
Serial myPort;  // Create object from Serial class

float newVal1, newVal2;
float l1, l2;

void setup() {  
  size(600, 600);
  oscP5 = new OscP5(this, 12000);

  background(0);

  //to arduino
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw () {
  background(0);
  l1=lerp(l1, newVal1, 0.1);
  l2=lerp(l2, newVal2, 0.1);


  //visual of recieved data
  noStroke();
  fill(255, 0, 0);  
  rect(10, 60, 60, l1);
  rect(80, 60, 60, l2);



  drawText();
  serialSend();
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
    if (theOscMessage.checkTypetag("ff")) { // looking for 4 parameters
      float value1 = theOscMessage.get(0).floatValue();
      float value2 = theOscMessage.get(1).floatValue();


      newVal1=map(value1, 0, 1, 0, 180);
      newVal2=map(value2, 0, 1, 0, 180);
      return;
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
  text("Expecting 2 continuous numeric outputs, all in range 0 to 1:", 10, 25);
  text("values are then mapped between 0-180 and sent to arduino", 10, 40);
}

void serialSend() {
myPort.write(l1 +","+ l2 + "\n");
}

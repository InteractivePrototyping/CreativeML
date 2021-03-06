//This demo allows Wekinator to control size, increment, rotation and hue of an object
//All recieved values shoulb be continuous values between 0 and 1
//Visual sketch is modified from http://btk.tillnagel.com/tutorials/rotation-translation-matrix.html

import oscP5.*;
OscP5 oscP5;
import processing.serial.*;
Serial myPort;  // Create object from Serial class

float newVal1, newVal2;
float l1, l2;
int currentClass; 
int Label01_Value01, Label01_Value02;
int Label02_Value01, Label02_Value02;
int Label03_Value01, Label03_Value02;

void setup() {  
  size(700, 600);
  oscP5 = new OscP5(this, 12000);

  guiSetup();


  //to arduino
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw () {
  background(0);

  drawText();
  //visual of recieved data
  noStroke();
  fill(255);  


  textSize(64);
  text(currentClass, width-100, height/2-30);
  if (currentClass == 1) {
    newVal1=Label01_Value01;
    newVal2=Label01_Value02;
    fill(255);
    ellipse(30, 90, 30, 30);
    //Do something on class 1
  } else if (currentClass == 2) {
    //Do something else on class 2
    newVal1=Label02_Value01;
    newVal2=Label02_Value02;
    fill(255);
    ellipse(30, 150, 30, 30);
  } else if (currentClass == 3) {
    //Do something else on class 2
    newVal1=Label03_Value01;
    newVal2=Label03_Value02;
    fill(255);
    ellipse(30, 210, 30, 30);
  } else {
    //Else do this
  }
  serialSend();
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    currentClass = (int) theOscMessage.get(0).floatValue();
  }
}

void drawText() {
  stroke(0);
  textAlign(LEFT, TOP); 
  fill(255);
  pushMatrix();
  textSize(16);
  text("Listening for message /wek/inputs on port 12000", 10, 10);
  text("Expecting 5 continuous numeric outputs, all in range 0 to 1:", 10, 25);
  text("values are then mapped between 0-255 and sent to arduino", 10, 40);
  popMatrix();

  pushMatrix();
  textSize(22);
  text("Class ID#1 outputs", width/2, 130);
  text("Class ID#2 outputs", width/2, 290);
  text("Class ID#3 outputs", width/2, 430);
  popMatrix();
}

void serialSend() {
myPort.write(newVal1 +","+ newVal2 +"\n");
}

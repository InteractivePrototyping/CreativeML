//This demo allows Wekinator to control size, increment, rotation and hue of an object
//All recieved values shoulb be continuous values between 0 and 1
//Visual sketch is modified from http://btk.tillnagel.com/tutorials/rotation-translation-matrix.html

import oscP5.*;
OscP5 oscP5;
import processing.serial.*;
Serial myPort;  // Create object from Serial class

float newVal1, newVal2, newVal3, newVal4, newVal5;
float l1, l2;
int currentClass; 
int Label01_Value01, Label01_Value02, Label01_Value03, Label01_Value04, Label01_Value05;
int Label02_Value01, Label02_Value02, Label02_Value03, Label02_Value04, Label02_Value05;
int Label03_Value01, Label03_Value02, Label03_Value03, Label03_Value04, Label03_Value05;

void setup() {  
  size(700, 600);
  oscP5 = new OscP5(this, 12000);

  guiSetup();


  //to arduino
  printArray(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}

void draw () {
  background(0);

  drawText();
  //visual of recieved data
  noStroke();
  fill(255);  
  textSize(64);
  text(currentClass, width-100, height/2-50);
  if (currentClass == 1) {
    newVal1=Label01_Value01;
    newVal2=Label01_Value02;
    newVal3=Label01_Value03;
    newVal4=Label01_Value04;
    newVal5=Label01_Value05;
    fill(255);
    ellipse(30, 130, 30, 30);
    //Do something on class 1
  } else if (currentClass == 2) {
    //Do something else on class 2
    newVal1=Label02_Value01;
    newVal2=Label02_Value02;
    newVal3=Label02_Value03;
    newVal4=Label02_Value04;
    newVal5=Label02_Value05;
    fill(255);
    ellipse(30, 290, 30, 30);
  } else if (currentClass == 3) {
    //Do something else on class 2
    newVal1=Label03_Value01;
    newVal2=Label03_Value02;
    newVal3=Label03_Value03;
    newVal4=Label03_Value04;
    newVal5=Label03_Value05;
    fill(255);
    ellipse(30, 430, 30, 30);
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
myPort.write(newVal1 +","+ newVal2 + newVal3 + newVal4 + newVal5 +"\n");
}

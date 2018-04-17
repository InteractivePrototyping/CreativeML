import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;
float X, Y,Z;

void setup() {  
  size(600, 600);
  oscP5 = new OscP5(this, 57120);
  dest = new NetAddress("127.0.0.1", 6448);
}


void draw() {
  background(0);
  drawText();
  if (mousePressed) {
    sendOsc();
    text("sending!", 520, 30);
  }
}
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/acc")==true) {
    if (theOscMessage.checkTypetag("fff")) { // looking for 4 parameters
       X = theOscMessage.get(0).floatValue();
       Y = theOscMessage.get(1).floatValue();
       Z = theOscMessage.get(2).floatValue();
    } else {
      println("Error: unexpected OSC message received by Processing: ");
      theOscMessage.print();
    }
  }
}

void drawText() {
  stroke(0);
  textAlign(LEFT, TOP); 
  fill(0, 0, 255);

  text("Listening for message /accel on port 57120", 10, 10);
  text("X:" + X+ "Y:" + Y+ "Z:" + Z, 10, 40);
  text("Send x, y and z position (3 inputs) to Wekinator", 10, 60);
}

void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add((float)X); 
  msg.add((float)Y);
  oscP5.send(msg, dest);
}

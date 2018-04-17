/*
 *Adapted from rebecka fiebrink Leap Motion 15 inputs example. https://github.com/fiebrink1/wekinator_examples/tree/master/inputs/LeapMotion
 *17 inputs sends to port 6448 using /wek/inputs message
 *Using Myo for Processing library  https://github.com/nok/myo-processing
 *referencing get EMG example. 
 */

import oscP5.*;
import netP5.*;
import processing.opengl.*;
int num=0;
int numFound = 0;
int frame=0;
OscP5 oscP5;
NetAddress dest;

import de.voidplus.myo.*;

Myo myo;
ArrayList<ArrayList<Integer>> sensors;



int  xPos=1;

int[] data;
float[] features = new float[17];
PVector orientation;
PVector accelerometer;
PVector gyroscope;
float lastdata;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float ax, ay, az;
float gx, gy, gz;
float ox, oy, oz;
float lerpsig;

void setup() {
  size(800, 400, P3D);
  oscP5 = new OscP5(this, 9000);
  dest = new NetAddress("127.0.0.1", 6448);
  background(255);

  stroke(0);
  // ...

  myo = new Myo(this);
  myo = new Myo(this, true); // enable EMG data



  sensors = new ArrayList<ArrayList<Integer>>();
  for (int i=0; i<8; i++) {
    sensors.add(new ArrayList<Integer>());
  }
}

void draw() {
  numFound = 0;
  orientation = myo.getOrientation();
  accelerometer = myo.getAccelerometer();
  gyroscope = myo.getGyroscope();
  data = myo.getEmg();


  background(255);
  numFound++;
  if (data !=null) {  
    noFill();
    stroke(0);
    text("Sending 17 inputs of the Myo to Wekinator", width/2+10, 180);
    text("EMG inputs 1-8", width/2+10, 200);
    //text("EMG[0]=" + data[0] + ", EMG[1]=" + data[1] + ",EMG[2]=" + data[2] + ",EMG[3]=" + data[3] + ",EMG[4]=" + data[4] + ",EMG[5]=" + data[5]+ ",EMG[6]=" + data[6]+ ",EMG[7]=" + data[7], 10, 220);

    features[0]=data[0];
    features[1]=data[1];
    features[2]=data[2];
    features[3]=data[3];
    features[4]=data[4];
    features[5]=data[5];
    features[6]=data[6];
    features[7]=data[7];

    // Drawing data:
    synchronized (this) {
      for (int i=0; i<8; i++) {
        if (!sensors.get(i).isEmpty()) {
          beginShape();
          for (int j=0; j<sensors.get(i).size(); j++) {
            stroke(255,0,0);
            vertex(j, sensors.get(i).get(j)+(i*50));
          }
          endShape();
        }
      }
    }
  }

  if (orientation !=null) {
    features[8] = orientation.x;
    features[9] = orientation.y;
    features[10] = orientation.z;


    ox = lerp(ox, orientation.x, 0.1);
    oy = lerp(oy, orientation.y, 0.1);
    oz = lerp(oz, orientation.z, 0.1);

    //rotating box visual 
    pushMatrix();
    noStroke();
    fill(255, 0, 0, 200);
    translate(width-200, 75);
    float mx= map(ox, 0, 0.5, 0, 180);
    float my= map(oy, 0, 0.5, 0, 180);
    float mz= map(oz, 0, 0.5, 0, 180);
    //move
    rotateX(radians(-mx));
    rotateY(radians(my));
    rotateZ(radians(mz));
    box(75, 75, 75);
    popMatrix();

    fill(0);
    stroke(0);
    text("Orientation inputs 9-11", width/2+10, 250);
    text("x=" + ox + ", y=" + oy + ", z=" + oz, width/2+10, 270);

    if (accelerometer !=null) { 
      features[11] = accelerometer.x;
      features[12] = accelerometer.y;
      features[13] = accelerometer.z;

      ax = lerp(ax, accelerometer.x, 0.1);
      ay = lerp(ay, accelerometer.y, 0.1);
      az = lerp(az, accelerometer.z, 0.1);

      fill(0);
      stroke(0);
      text("Accelerometer inputs 12-14", width/2+10, 300);
      text("x=" + ax + ", y=" + ay + ", z=" + ay, width/2+10, 320);

      if (gyroscope !=null) { 
        features[14] = gyroscope.x;
        features[15] = gyroscope.y;
        features[16] = gyroscope.z;

        gx = lerp(gx, gyroscope.x, 0.1);
        gy = lerp(gy, gyroscope.y, 0.1);
        gz = lerp(gz, gyroscope.z, 0.1);

        fill(0);
        stroke(0);
        text("Gyroscope inputs 15-17", width/2+10, 350);
        text("x=" + gx + ", y=" + gy + ", z=" + gz, width/2+10, 370);
      }
    }
  }




  // =========== OSC ============
  if (frameCount % 2 == 0) {
    sendOsc();
  }
}



// ----------------------------------------------------------
void sendOsc() {



  OscMessage msg = new OscMessage("/wek/inputs");

  if (numFound > 0) {
    for (int i = 0; i < features.length; i++) {
      msg.add(features[i]);
    }
  } else {
    for (int i = 0; i < features.length; i++) {
      msg.add(0.);
    }
  }
  oscP5.send(msg, dest);
}


// ----------------------------------------------------------

void myoOnEmgData(Device myo, long timestamp, int[] data) {
  // println("Sketch: myoOnEmgData, device: " + myo.getId());
  // int[] data <- 8 values from -128 to 127

  // Data:
  synchronized (this) {
    for (int i = 0; i<data.length; i++) {
      sensors.get(i).add((int) map(data[i], -128, 127, 0, 50)); // [-128 - 127]
    }
    while (sensors.get(0).size() > width/2) {
      for (ArrayList<Integer> sensor : sensors) {
        sensor.remove(0);
      }
    }
  }
}


// ==========================================================
// Executable commands:

void mousePressed() {
  if (myo.hasDevices()) {
    myo.vibrate();
    myo.requestRssi();
    myo.requestBatteryLevel();
  }
}

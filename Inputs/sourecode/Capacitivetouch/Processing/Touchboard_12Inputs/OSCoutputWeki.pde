import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress dest;

void oscOutSetup() {
  oscP5 = new OscP5(this, 9000);
  dest = new NetAddress("127.0.0.1", 6448);
}

void oscOut() {
  printArray(filteredData);//check its working
  
}

void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  for (int i = 0; i<filteredData.length; i++) {
    msg.add(filteredData[i]); 
  }
  oscP5.send(msg, dest);
}

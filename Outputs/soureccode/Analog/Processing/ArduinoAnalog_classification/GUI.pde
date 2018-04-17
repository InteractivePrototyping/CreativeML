import controlP5.*;

ControlP5 cp5;

void guiSetup() {
  cp5 = new ControlP5(this);
  cp5.addSlider("Label01_Value01")
    .setPosition(70, 70)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label01_Value02")
    .setPosition(70, 100)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label01_Value03")
    .setPosition(70, 130)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label01_Value04")
    .setPosition(70, 160)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label01_Value05")
    .setPosition(70, 190)
    .setRange(0, 180)
    .setSize(100,20)
    ;


//class id 2
  cp5.addSlider("Label02_Value01")
    .setPosition(70, 230)
    .setRange(0, 180)
    .setSize(100,20)
    ;

  cp5.addSlider("Label02_Value02")
    .setPosition(70, 260)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label02_Value03")
    .setPosition(70, 290)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label02_Value04")
    .setPosition(70, 320)
    .setRange(0, 180)
    .setSize(100,20)
    ;
  cp5.addSlider("Label02_Value05")
    .setPosition(70, 350)
    .setRange(0, 180)
    .setSize(100,20)
    ;
    
    
  //class 3  
  cp5.addSlider("Label03_Value01")
    .setPosition(70, 390)
    .setRange(0, 180)
    .setSize(100,20)
    ;

  cp5.addSlider("Label03_Value02")
    .setPosition(70, 420)
    .setRange(0, 180)
    .setSize(100,20)
    ;
       cp5.addSlider("Label03_Value03")
    .setPosition(70, 450)
    .setRange(0, 180)
    .setSize(100,20)
    ;
      cp5.addSlider("Label03_Value04")
    .setPosition(70, 480)
    .setRange(0, 180)
    .setSize(100,20)
    ;
      cp5.addSlider("Label03_Value05")
    .setPosition(70, 510)
    .setRange(0, 180)
    .setSize(100,20)
    ;
}

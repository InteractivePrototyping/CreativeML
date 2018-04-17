import controlP5.*;

ControlP5 cp5;

void guiSetup() {
  cp5 = new ControlP5(this);
  cp5.addSlider("Label01_Value01")
    .setPosition(70, 70)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label01_Value02")
    .setPosition(70, 100)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label01_Value03")
    .setPosition(70, 130)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label01_Value04")
    .setPosition(70, 160)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label01_Value05")
    .setPosition(70, 190)
    .setRange(0, 180)
    ;


//class id 2
  cp5.addSlider("Label02_Value01")
    .setPosition(70, 230)
    .setRange(0, 180)
    ;

  cp5.addSlider("Label02_Value02")
    .setPosition(70, 260)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label02_Value03")
    .setPosition(70, 290)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label02_Value04")
    .setPosition(70, 310)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label02_Value05")
    .setPosition(70, 340)
    .setRange(0, 180)
    ;
    
    
  //class 3  
  cp5.addSlider("Label03_Value01")
    .setPosition(70, 380)
    .setRange(0, 180)
    ;

  cp5.addSlider("Label03_Value02")
    .setPosition(70, 410)
    .setRange(0, 180)
    ;
       cp5.addSlider("Label03_Value03")
    .setPosition(70, 440)
    .setRange(0, 180)
    ;
      cp5.addSlider("Label03_Value04")
    .setPosition(70, 470)
    .setRange(0, 180)
    ;
      cp5.addSlider("Label03_Value05")
    .setPosition(70, 500)
    .setRange(0, 180)
    ;
}

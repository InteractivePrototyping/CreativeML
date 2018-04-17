import controlP5.*;

ControlP5 cp5;

void guiSetup() {
  cp5 = new ControlP5(this);
  cp5.addSlider("Label01_Value01")
    .setPosition(70, 120)
    .setRange(0, 180)
    .setSize(100, 20)
    ;

  cp5.addSlider("Label01_Value02")
    .setPosition(70, 150)
    .setRange(0, 180)
    .setSize(100, 20)
    ;
  cp5.addSlider("Label02_Value01")
    .setPosition(70, 280)
    .setRange(0, 180)
    .setSize(100, 20)
    ;

  cp5.addSlider("Label02_Value02")
    .setPosition(70, 310)
    .setRange(0, 180)
    .setSize(100, 20)
    ;
  cp5.addSlider("Label03_Value01")
    .setPosition(70, 420)
    .setRange(0, 180)
    .setSize(100, 20)
    ;

  cp5.addSlider("Label03_Value02")
    .setPosition(70, 450)
    .setRange(0, 180)
    .setSize(100, 20)
    ;
}

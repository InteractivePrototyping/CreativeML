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
  cp5.addSlider("Label02_Value01")
    .setPosition(70, 130)
    .setRange(0, 180)
    ;

  cp5.addSlider("Label02_Value02")
    .setPosition(70, 160)
    .setRange(0, 180)
    ;
  cp5.addSlider("Label03_Value01")
    .setPosition(70, 190)
    .setRange(0, 180)
    ;

  cp5.addSlider("Label03_Value02")
    .setPosition(70, 220)
    .setRange(0, 180)
    ;
}

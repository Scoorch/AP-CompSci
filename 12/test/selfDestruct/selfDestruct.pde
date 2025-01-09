import java.awt.Robot;
import java.awt.event.InputEvent;
Robot rbt;
//InputEvent input;
int delay1 = 0;
int delay2 = 0;
boolean dStart = true;

void setup() {
  fullScreen();
  frameRate(1);
  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
}

void draw() {
  if (dStart) {
    delay2++;
    if (delay2 >= 10) {
      if (delay1 == 0) {
        rbt.keyPress(524);
        rbt.keyRelease(524);
      }
      if (delay1 == 1) rbt.mouseMove(25, 641);
      if (delay1 == 2) rbt.mousePress(InputEvent.BUTTON1_DOWN_MASK);
      if (delay1 == 3) rbt.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
      if (delay1 == 4) rbt.mouseMove(25, 550);
      if (delay1 == 5) rbt.mousePress(InputEvent.BUTTON1_DOWN_MASK);
      if (delay1 == 6) rbt.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
      if (delay1 == 7) {
        delay1 = 0;
        delay2 = 0;
        dStart = false;
      }

      delay1++;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    dStart = true;
  }
}

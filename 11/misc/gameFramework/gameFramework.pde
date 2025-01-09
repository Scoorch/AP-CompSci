//Trevor Chen
//2-2
//23/4/20

int mode;
final int INTRO = 0;
final int OPTIONS = 1;
final int GAME = 2;
final int PAUSE = 3;
final int END = 4;

void setup() {
  size(800, 800);
  mode = INTRO;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == OPTIONS) {
    options();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == END) {
    end();
  } else {
    println("funny mode error hehe code sucks" + mode);
  }
  println(mode);
}

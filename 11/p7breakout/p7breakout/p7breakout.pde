//Trevor Chen
//2-2
//23/5/26

int[] x;
int[] y;
boolean[] alive;
int brickD;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int END = 3;

int life, resetCount, pauseOpacity;

float padX, padD; // pad L
float ballX, ballY, ballD, ballVX, ballVY, speedMult;
int f, tempX, tempY, brickAmount;

boolean offset, reset, aKey, dKey, win;

PFont main;
PImage[] gif;

void setup() {
  size(800, 600);
  colorMode(HSB, 12);
  textAlign(CENTER, CENTER);
  textSize(50);
  noStroke();
  mode = INTRO;

  tempX = 80;
  tempY = 80;
  offset = true;

  x = new int[68];
  y = new int[68];
  alive = new boolean[68];

  for (int i = 0; i < x.length; i ++) { // bricks
    x[i] = tempX;
    y[i] = tempY;
    alive[i] = true;
    tempX += 80;
    if (tempX > width - 80) {
      if (offset) {
        tempX = 120;
        tempY += 40;
        offset = false;
      } else {
        tempX = 80;
        tempY += 40;
        offset = true;
      }
    }
  }

  main = loadFont("AgencyFB-Bold-48.vlw");
  textFont(main);
  
  f = 0;
  gif = new PImage[8];
  for (int i = 0; i < gif.length; i++) {
    gif[i] = loadImage("frame_"+i+"_delay-0.03s.gif");
  }
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == END) {
    end();
  }
}

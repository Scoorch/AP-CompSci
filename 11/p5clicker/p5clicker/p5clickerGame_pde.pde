import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Trevor Chen
//2-2
//23/4/20

// to do list: shadow for text, icon for circle

int mode;
final int INTRO = 0;
final int OPTIONS = 1;
final int GAME = 2;
final int PAUSE = 3;
final int END = 4;

float rainbowhell;
boolean startup1, startup2; // 2 startups because need more for 2nd time around of draw because delay before end of draw stops draw from finishing

PFont main;
PImage current;
PImage brain;
PImage sbrain;
PImage bbrain;

Minim minim;
AudioPlayer backg, option, click, button, levelup, lifeloss, lose, lbackg;

void setup() {
  startup1 = false; // unused??
  startup2 = true;
  iSetup(); // to keep clutter out of main
  oSetup();
  gSetup();
  pSetup();

  size(800, 800);

  mode = INTRO;

  colorMode(HSB, 12);

  textAlign(CENTER, CENTER);
  main = loadFont("AgencyFB-Bold-48.vlw");

  minim = new Minim(this);
  backg = minim.loadFile("background.mp3");
  option = minim.loadFile("optionsmusic.mp3");
  button = minim.loadFile("button.mp3");
  click = minim.loadFile("click.mp3");
  levelup = minim.loadFile("levelup.mp3");
  lifeloss = minim.loadFile("lifeloss.mp3");
  lose = minim.loadFile("lose.mp3");
  lbackg = minim.loadFile("gameover.mp3");
  
  brain = loadImage("brain.png");
  sbrain = loadImage("smoothbrain.png");
  bbrain = loadImage("bigbrain.png");
  current = brain;
}

void draw() {
  textFont(main);
  //if (startup1) { hmm
  //  delay(3000);
  //  startup1 = !startup1;
  //}
  //if (startup2) {
  //  fill(0);
  //  textSize(100);
  //  text("EPILEPSY WARNING >:D", 400, 400);
  //  startup1 = !startup1;
  //  startup2 = !startup2;
  //} else {

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
    println("funny mode error hehe code sucks " + mode);
  }
}
//}

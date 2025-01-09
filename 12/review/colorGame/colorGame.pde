//Trevor
//24/2/15
//2-4

// import sound libraries
import processing.sound.*;
SoundFile wangdongnewsnetwork;
SoundFile undersuccess;
SoundFile yellowsnow;
SoundFile mogolovonia;

import processing.javafx.*;

int mode, cFont;
PFont menu, medium, hard;

void setup() {
  frameRate(30);
  colorMode(RGB, 255, 255, 255, 100); // 100 for transparency easier to work with, but not necessary anymore
  fullScreen(FX2D);
  //size(600, 400, FX2D);
  background(70);
  noStroke();
  textSize(128);
  textAlign(CENTER, CENTER);

  wangdongnewsnetwork = new SoundFile(this, "dong.wav");
  undersuccess = new SoundFile(this, "win.wav");
  yellowsnow = new SoundFile(this, "metalbonk.wav");
  mogolovonia = new SoundFile(this, "Saness song.wav");

  mode = 0;
  cFont = 0;
  ans = true; // answer is same (true) or different)
  correct = true; // holds info of if guess was correct/incorrect
  score = 0;
  life = 3;
  tCount = 70; // fade of edge
  timerR = 10*30;
  timer = timerR;

  refresh();
  // if highscore text file does not exist, creates it and sets to 0
  if (loadStrings("highscore.txt") == null) {
    createWriter("highscore.txt");
    String[] temp = {"0"};
    saveStrings("highscore.txt", temp);
    println("highscore file initiated");
  }
}

void draw() {
  menu = loadFont("BerlinSansFB-Reg-255.vlw");
  medium = loadFont("Chiller-Regular-255.vlw");
  hard = loadFont("Parchment-Regular-255.vlw");
  if (cFont == 0) {
    textFont(menu);
  } else if (cFont == 1) {
    textFont(medium);
  } else {
    textFont(hard);
  }

  // mode framework
  if (mode == 0) {
    background(70);
    textSize(48);
    text("Easy", width/2-150, height-height/8-100);
    text("Medium", width/2, height-height/8-100);
    text("Hard", width/2+150, height-height/8-100);
    for (int i = 0; i < 3; i++) {
      button(width/2-150+150*i, height-height/8, i);
    }
    intro();
  } else if (mode == 1) {
    game();
  } else if (mode == 2) {
    gameOver();
    button(width/2, height-height/8, 0);
  } else {
    mode ++;
  }
  fill(0);
  textSize(128);
  //text(frameRate, 200, 200);
}

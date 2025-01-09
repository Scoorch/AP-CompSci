//Trevor Chen
//2-2
//23/5/12

// NICHOLAS BROKE

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode, sat, bri; // sat and bri for color select
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int END = 3;

int stdirX, stdirY, introS, scoreL, scoreR, scoreLim, pauseOpacity;

float padLX, padLY, padLD, padRX, padRY, padRD; // pad L
float ballX, ballY, ballD, ballVX, ballVY, rmult;
float mrewindbg, mrewindlbg;

boolean ai, reset1, reset2, wKey, sKey, upKey, downKey, lWin;

PFont main;

Minim minim;
AudioPlayer backg, click, button, lifeloss, lose, lbackg;

void setup() {
  size(800, 800);
  colorMode(HSB, 12); // i like
  textAlign(CENTER, CENTER);
  mode = INTRO;

  // paddlesetup
  padLX = 0;
  padLY = height/2;
  padLD = 150;

  padRX = width;
  padRY = height/2;
  padRD = 150;

  // ballsetup
  ballX = width/2;
  ballY = height/2;
  ballD = 80;
  ballVX = random(4, 6);
  ballVY = random(3, 5);
  if ((int)random(0, 2) == 0) {
    stdirX = -1;
  } else {
    stdirX = 1;
  }
  if ((int)random(0, 2) == 0) {
    stdirY = -1;
  } else {
    stdirY = 1;
  }
  reset1 = false;
  reset2 = false;
  
  // misc
  introS = 0;
  scoreL = 0;
  scoreR = 0;
  scoreLim = 5;
  pauseOpacity = 0;
  lWin = false;
  
  main = loadFont("AgencyFB-Bold-48.vlw");
  textFont(main);
  
  minim = new Minim(this);
  backg = minim.loadFile("background.mp3");
  button = minim.loadFile("button.mp3");
  click = minim.loadFile("click.mp3");
  lifeloss = minim.loadFile("lifeloss.mp3");
  lose = minim.loadFile("lose.mp3");
  lbackg = minim.loadFile("gameover.mp3");
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

// color select
/* 
void keyPressed() {

  // colors

  if (key == '=') {
    sat++;
    for (int i = 0; i < 12; i++) {
      fill(i, sat, bri);
      rect(0, i * 50, 800, 50);
      println("sat: " + sat + " bri: " + bri);
    }
    println("sat: " + sat + " bri: " + bri);
  }
  if (key == '-') {
    sat--;
    for (int i = 0; i < 12; i++) {
      fill(i, sat, bri);
      rect(0, i * 50, 800, 50);
      println("sat: " + sat + " bri: " + bri);
    }
    println("sat: " + sat + " bri: " + bri);
  }
  if (key == ']') {
    bri++;
    for (int i = 0; i < 12; i++) {
      fill(i, sat, bri);
      rect(0, i * 50, 800, 50);
      println("sat: " + sat + " bri: " + bri);
    }
    println("sat: " + sat + " bri: " + bri);
  }
  if (key == '[') {
    bri--;
    for (int i = 0; i < 12; i++) {
      fill(i, sat, bri);
      rect(0, i * 50, 800, 50);
      println("sat: " + sat + " bri: " + bri);
    }
    println("sat: " + sat + " bri: " + bri);
  }
}
*/

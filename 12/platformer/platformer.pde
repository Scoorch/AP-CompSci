//Trevor Chen
//24/3/11
//2-4

import fisica.*;
import processing.sound.*;
SoundFile background;
SoundFile hurt;
SoundFile jump;
SoundFile win;
SoundFile click;

FWorld world;

FPlayer player1;
FPSprite p1Sprite;

color white  = #ffffff; // background
color purp   = #6f3198; // wall
color blue   = #2f3699; // no jump bricks
color lgreen = #0dff00; // jump
color lblue  = #c7e2ed; // ice
color gold   = #ffc20e; // bridge
color dgreen = #408c3b; // leaf
color brown  = #592b2b; // trunk
color dred   = #990030; // spike
color lred   = #ed1c24; // lava
color yellow = #fff200; // goal
color teal   = #18ffff; // checkpoint
color pink   = #ffa3b1; // spawn
color rBrown = #750000; // goomba
color tan    = #f5e49c; // hammerbro
color grey   = #464646; // thwomp

boolean controls, levelSelect, wKey, aKey, sKey, dKey, sbar, aClick, dClick, jReset1, jDelay, Catch, oldContactIce, dir, dead, goal;
float spawnX, spawnY, jReady1, oldVel1, oldVel2;
int mode, buttonH, gridSize, level;

PImage map, testMap, map1, map2;
PImage bridgeC, bridgeR, bridgeL;
PImage spike;
PImage leafL, leafM, leafR, leafI;
PImage brickA, brickB, brickBL, brickBLR, brickBR, brickL, brickLR, brickN, brickR, brickT, brickTB, brickTBL, brickTBR, brickTL, brickTLR, brickTR;
PImage bounce;
PImage ice;
PImage treeT;
PImage lavaMid;
PImage hammer;

PImage[] pIdle, pJump, pRun, pAction, goomba, hammerB, thwomp, lava, cFlag, wFlag;

FHitbox hitH, hitF, hitC;
FHammer h;

ArrayList<FGameBox> terrain = new ArrayList<>();
ArrayList<Integer> goombaNumArray = new ArrayList<>();

void setup() {
  //fullScreen(P2D);
  size(1200, 800, P2D);
  textAlign(CENTER, CENTER);


  controls = true;
  levelSelect = true;
  dead = false;
  goal = false;
  mode = 0;
  buttonH = 0;
  gridSize = 50;
  level = 1;
  spawnY = -100;

  Fisica.init(this);
  world = new FWorld(-590, -500, gridSize*100, gridSize*100);
  world.setGravity(0, 900);

  Sound s = new Sound(this);
  s.volume(0.05);
  background = new SoundFile(this, "background.mp3");
  hurt = new SoundFile(this, "hurt.mp3");
  jump = new SoundFile(this, "jump.mp3");
  win = new SoundFile(this, "win.mp3");
  click = new SoundFile(this, "click.wav");

  loadImages();
  loadAnimations();
}

void draw() {
  background(0);

  //debug();

  mode();
  aClick = dClick = false;
}

void gameAct() {
  player1.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameBox t = terrain.get(i);
    t.act();
    if (t.ded) {
      terrain.remove(i);
    }
  }
}

void debug() {
  image(map, 0, 0, map.width*10, map.height*10);
  strokeWeight(1);
  stroke(0, 255, 0);
  line(player1.getX()/gridSize*10, 0, player1.getX()/gridSize*10, map.height*10);
  line(0, player1.getY()/gridSize*10, map.width*10, player1.getY()/gridSize*10);
}

void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 'a') aKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;
}

void keyReleased() {
  if (key == 'w') {
    wKey = false;
    jReset1 = true;
  }
  if (key == 'a') {
    aKey = false;
    aClick = true;
  }
  if (key == 's') sKey = false;
  if (key == 'd') {
    dKey = false;
    dClick = true;
  }

  if (key == ' ') {
    click.jump(0);
    if (mode == 0) {
      if (controls) {
        controls = false;
      } else if (levelSelect) {
        levelSelect = false;
      } else {
        background.jump(0);
        mode = 1;
        if (buttonH == 0) {
          map = testMap;
          level = 1;
        }
        else if (buttonH == 1) {
          map = map1;
          level = 2;
        }
        else if (buttonH == 2) {
          map = map2;
          level = 3;
        }
        resetGame();
        drawMap();
        makePlayers();
      }
    } else if (mode == 1) {
      mode = 2;
    } else if (mode == 2) {
      if (buttonH == 1) {
        resetGame();
        mode = 0;
        levelSelect = true;
      } else mode = 1;
    }
  }
}

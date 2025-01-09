//Trevor Chen
//24/5/27
//2-4

import java.awt.Robot;
Robot rbt;

PImage map, diamond, mBrick, oLogS, oLogT, grass, dirt;

float gridSize, wallHeight, rotX, rotY, rotZ, eyeX, eyeY, eyeZ, focusX, focusY, focusZ, lrAngle, udAngle;
boolean wKey, aKey, sKey, dKey, space, shift, pressed;

ArrayList<GameObj> objects;

void setup() {
  fullScreen(P3D);
  //size(1200, 800, P3D);
  //lights();
  perspective(PI/3, float(width)/float(height), 1, height/2/tan(radians(30))*10.0);
  noCursor();
  noSmooth();

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  objects = new ArrayList<GameObj>();

  map = loadImage("map.png");
  diamond = loadImage("diamondBlock.png");
  mBrick = loadImage("mStoneBricks.png");
  oLogS = loadImage("oakLogSide.png");
  oLogT = loadImage("oakLogTop.png");
  grass = loadImage("grassTop.png");
  dirt = loadImage("dirt.png");
  textureMode(NORMAL);

  gridSize = 100;
  wallHeight = 3;
  eyeX = map.width/2*gridSize;
  eyeY = height-gridSize;
  eyeZ = map.height/2*gridSize;
  udAngle = radians(155);
  lrAngle = radians(180);

  for (int i = 0; i < 1; i++) {
    Bat bat = new Bat();
    objects.add(bat);
  }
}

void draw() {
  background(0);
    fill(255);
  //focus();
  lightFalloff(0.65, 0.00030, 0.0000001);
  ambientLight(200, 150, 150, eyeX, eyeY, eyeZ);


  rbt.mouseMove(width/2, height/2);
  moveCam();
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, 0, 1, 0);

  //drawPlatform(0, -1, 0, rotX, rotY, 0);
  //drawPlatform(0, wallHeight, 0, rotX, rotY, 0);
  //block(255, width/2, height/2, 0, rotX, rotY, 0, 100);
  drawMap();

  for (int i = 0; i < objects.size(); i++) {
    GameObj obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
      i--;
    }
  }
  if (pressed) {
    Bullet bull = new Bullet();
    objects.add(bull);
  }
}

void focus() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(255);
  sphere(5);
  popMatrix();
}

void mousePressed() {
  pressed = true;
}

void mouseReleased() {
  pressed = false;
}

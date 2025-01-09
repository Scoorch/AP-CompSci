//Trevor Chen
//24/3/13
//2-4

import fisica.*;

int cX1, cX2, cN1, cN2;
float[] rX, rY;
boolean mouseReleased;

Button[] cButton = new Button[2];

//pallete
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets
PImage redBird, shrek;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();

  cN1 = int(random(5, 10));
  cN2 = int(random(5, 10));
  rX = new float[cN1+cN2];
  rY = new float[cN1+cN2];
  for (int i = 0; i < cN1+cN2; i++) {
    rX[i] = random(0, 100);
    rY[i] = random(0, 100);
  }
  //load resources
  redBird = loadImage("red-bird.png");
  shrek = loadImage("shrek.png");
  shrek.resize(50, 0);
  cButton[0] = new Button(width/4, height/2, 150, 100, 0, 180, "grav");
  cButton[1] = new Button(width/4+width/2, height/2, 150, 100, 0, 180, "spawn");

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(50, height*0.1);
  topPlatform.vertex(100, height*0.1);
  topPlatform.vertex(150, height*0.35);
  topPlatform.vertex(width-150, height*0.350);
  topPlatform.vertex(width-100, height*0.1);
  topPlatform.vertex(width-50, height*0.1);
  topPlatform.vertex(width-100, height*0.4);
  topPlatform.vertex(100, height*0.4);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(width+100, height*0.6);
  bottomPlatform.vertex(300, height*0.8);
  bottomPlatform.vertex(300, height*0.8+100);
  bottomPlatform.vertex(width+100, height*0.6+100);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println(frameRate);
  background(blue);

  //button effects
  if (cButton[0].clicked) {
    world.setGravity(0, 900);
  } else {
    world.setGravity(0, 0);
  }

  fill(255, 50);
  noStroke();
  for (int i = 0; i < cN1; i++) {
    circle(-150+rX[i]+cX1, width*0.2+rY[i], 50);
  }
  if (cX1 > width+300) cX1 = -150;
  cX1++;


  if (cButton[1].clicked && frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  for (int i = cN1; i < cN1+cN2; i++) {
    fill(255, 50);
    noStroke();
    circle(-150-width/2+rX[i]+cX2, width*0.2+rY[i], 50);
  }
  if (cX2 > width+300+width/2) cX2 = -150;
  cX2++;

  //button
  cButton[0].show();
  cButton[1].show();
  mouseReleased = false;
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), 10);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), 10, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(1);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(width), 10);

  //set visuals
  //box.setStroke(0);
  //box.setStrokeWeight(2);
  //box.setFillColor(green);
  box.attachImage(shrek);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), 10);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}

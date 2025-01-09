//Trevor Chen
//24/3/11
//2-4

//1v1 archery

import fisica.*;

FWorld world;

FPoly platform;
FCircle bullet1, bullet2, aimLine1;
FPlayer player1, player2;

PVector velocity1, velocity2;

color white  = #FFFFFF;
color red    = #FF0000;
color orange = #F0A000;
color green  = #00FF00;
color blue   = #0000FF;
color black  = #000000;
color brown  = #996633;

boolean wKey, aKey, sKey, dKey, qKey, eKey, sbar, aiming1, jReset1, p1Win, up, left, down, right, fourKey, fiveKey, oneKey, aiming2, jReset2, p2Win, reset;
float power1, power2, pMult1, pMult2, pMultVis1, pMultVis2, bullet1V, bullet2V, aim1, aim2, aimY1, aimY2, charge1, charge2, jReady1, jReady2;

PImage map;
int gridSize;
ArrayList<FGameBox> terrain = new ArrayList<>();

void setup() {
  fullScreen(P2D);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  map = loadImage("map1.png");
  //world.setEdges();
  gridSize = width/32;

  velocity1 = new PVector(35, 0);
  velocity2 = new PVector(-35, 0);

  aim1 = 500;
  aim2 = 500;
  p1Win = false;
  p2Win = false;
  //makePlatform();
  makePlayers();
  loadMap();
}

void draw() {
  background(255);
  //if (player1.getTouching() == ) println("yes");

  pMult1 = map(power1, 0, 80, 0, 50);
  pMultVis1 = (int)map(power1, 0, 80, 0, 5);
  bullet1V = aim1*pMult1;
  pMult2 = map(power2, 0, 80, 0, 50);
  pMultVis2 = (int)map(power2, 0, 80, 0, 5);
  bullet2V = aim2*pMult2;

  pInput();
  gameAct();
  //makeAimLine1();
  
  pushMatrix();
  float avgPosX = ((-player1.getX()+width/2)+(-player2.getX()+width/2))/2;
  float avgPosY = ((-player1.getY()+height/2)+(-player2.getY()+height/2))/2;
  float distP1P2 = dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
  translate(avgPosX, avgPosY);
  scale(map(distP1P2, 150, width-150, 1.7, 1));
  world.step();
  world.draw();

  strokeCap(PROJECT);
  strokeWeight(15);
  stroke(0);
  line(player1.getX(), player1.getY(), player1.getX() + velocity1.x, player1.getY() + velocity1.y);
  stroke(0);
  line(player2.getX(), player2.getY(), player2.getX() + velocity2.x, player2.getY() + velocity2.y);
  strokeWeight(6);
  stroke(255);
  for (int i = 0; i < pMultVis1; i++) {
    stroke(charge1);

    circle(player1.getX() + velocity1.x/7*i + velocity1.x/9*i, player1.getY() + velocity1.y/7*i + velocity1.y/9*i, 6);
    charge1 += 50;
  }
  for (int i = 0; i < pMultVis2; i++) {
    stroke(charge2);

    circle(player2.getX() + velocity2.x/7*i + velocity2.x/9*i, player2.getY() + velocity2.y/7*i + velocity2.y/9*i, 6);
    charge2 += 50;
  }
  charge1 = 50;
  charge2 = 50;
  
  popMatrix();
  
  if (p1Win) p1Win();
  if (p2Win) p2Win();
}

void gameAct() {
  for (int i = 0; i < terrain.size(); i++) {
    FGameBox t = terrain.get(i);
    t.act();
  }
}

void p1Win() {
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(0);
  text("right player sucks!", width*.5, height*.3);
  reset = true;
}

void p2Win() {
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(0);
  text("left player sucks!", width*.5, height*.3);
  reset = true;
}

void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 'a') aKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;
  if (key == 'n') qKey = true;
  if (key == 'm') eKey = true;
  if (key == ' ') {
    sbar = true;
    aiming1 = true;
  }
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
  if (key == '4') fourKey = true;
  if (key == '5') fiveKey = true;
  if (key == '1') {
    oneKey = true;
    aiming2 = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    wKey = false;
    jReset1 = true;
  }
  if (key == 'a') aKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;
  if (key == 'n') qKey = false;
  if (key == 'm') eKey = false;
  if (key == ' ') {
    sbar = false;
    if (aiming1) {
      makeBullet1();
    }
    aiming1 = false;
  }
  if (keyCode == UP) {
    up = false;
    jReset2 = true;
  }
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (key == '4') fourKey = false;
  if (key == '5') fiveKey = false;
  if (key == '1') {
    oneKey = false;
    if (aiming2) {
      makeBullet2();
    }
    aiming2 = false;
  }
}

void mouseClicked() {
  if (reset) {
    world.clear();
    velocity1.set(35, 0);
    velocity2.set(-35, 0);
    aim1 = 500;
    aim2 = 500;
    jReady1 = 2;
    jReady2 = 2;
    reset = false;
    p1Win = false;
    p2Win = false;
    //makePlatform();
    makePlayers();
    //makePlayer2();
    loadMap();
  }
}

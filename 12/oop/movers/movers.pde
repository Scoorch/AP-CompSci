//Trevor Chen
//24/3/1
//2-4

int mN = 50;
float bkg = 0;
boolean mouseReleased = false;
PImage karp;
PImage[] file = new PImage[25];

Nicholas[] cNicholas = new Nicholas[mN];
Mover[] cMover = new Mover[mN];
Button[] cButton = new Button[3];
Gif[] feebas = new Gif[1];

void setup() {
  fullScreen(P2D);
  background(0, 0, 0);
  imageMode(CENTER);

  karp = loadImage("magikarp.png");
  feebas[0] = new Gif("feebas/frame_", "_delay-0.1s.gif", 25, 1, width/2, height/2, 800, 500);

  for (int i = 0; i < mN; i++) {
    cNicholas[i] = new Nicholas();
    float tempC = random(0, 360);
    cMover[i] = new Mover(tempC, true);
  }

  cButton[0] = new Button(karp, width/2, height/2-200, 150, 100, 0, 180, 0, true);
  cButton[1] = new Button(karp, width/2, height/2, 200, 125, 60, 240, 0, false);
  cButton[2] = new Button(karp, width/2, height/2+220, 250, 150, 120, 300, 0, false);
}

void draw() {
  //println(frameRate);
  feebas[0].show();

  //colorMode(HSB, 360, 100, 100);
  //background(bkg, 100, 100);
  //for (int i = 0; i < cButton.length; i++) {
  //  cButton[i].show();
  //  if (cButton[i].clicked) {
  //    bkg = cButton[i].highlight;
  //  }
  //}
  //colorMode(RGB, 255, 255, 255);

  //for (int i = 0; i < mN; i++) {
  //  cMover[i].act();
  //  cMover[i].show(false, false);
  //}


  //for (int j = 0; j < mN; j++) {
  //  for (int i = 0; i < mN; i++) {
  //    cNicholas[i].act();
  //    cNicholas[i].show();
  //  }
  //}

  //mouseReleased = false;
}

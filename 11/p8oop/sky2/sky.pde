//Trevor Chen
//2-2
//23/6/21

Lightning[] myLightning;
Cloud[] myClouds;
Rain[] myRain;

int l = 0;
int ls = 0;
int lcd = 10;
int r;

void setup() {
  size(800, 600, P2D);

  myLightning = new Lightning[3];
  myClouds = new Cloud[30];
  myRain = new Rain[1000];

  for (int i = 0; i < myLightning.length; i++) {
    myLightning[i] = new Lightning();
  }
  for (int i = 0; i < myClouds.length; i++) {
    myClouds[i] = new Cloud(i);
  }
  r = (int)random(1, myLightning.length);
}

void draw() {
  //lightning

  if (l >= 1000) {
    ls = 1;
    if (ls == 1) {
      int r = (int)random(1, myLightning.length);
      for (int i = 0; i < r; i++) {
        myLightning[i].reset();
        myLightning[i].show();
        myLightning[i].flash();
      }
      ls = 0;
    }
    background(255);
    for (int i = 0; i < r; i++) {
      myLightning[i].show();
    }
    if (lcd <= 0) {
      l = 0;
      ls = 1;
      lcd = 10;
    }
    lcd -= 1;
  } else background(50);

  l += (int)random(1, 10);
  //println(l);

  //cloud
  for (int i = 0; i < myClouds.length; i++) {
    myClouds[i].show();
    myClouds[i].move();
    myClouds[i].rain();
  }
  for (int i = 0; i < myRain.length; i++) {
    if (myRain[i] == null) { // find 1st blank
      continue;
    }
    myRain[i].show();
    myRain[i].fall();
  }
}

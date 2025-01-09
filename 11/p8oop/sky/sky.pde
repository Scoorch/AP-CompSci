//Trevor Chen
//2-2
//23/6/21

Sunshine[] mySunshine;
Cloud[] myClouds;


void setup() {
  size(800, 600, P2D);
  
  mySunshine = new Sunshine[1];
  myClouds = new Cloud[30];
  
  for (int i = 0; i < mySunshine.length; i++) {
    mySunshine[i] = new Sunshine();
  }
  for (int i = 0; i < myClouds.length; i++) {
    myClouds[i] = new Cloud(i);
  }
}

void draw() {
  background(0);
  //sunshine
  //for (int i = 0; i < mySunshine.length; i++) {
  //  mySunshine[i].show();
  //  mySunshine[i].move();
  //}
  
  //cloud
  for (int i = 0; i < myClouds.length; i++) {
    myClouds[i].show();
    myClouds[i].move();
    myClouds[i].rain();
  }
}  

//Trevor Chen
//2-2
//23/6/5

//Object Oriented Programming OOP

Star[] myStars;
Ripple[] myRipples;
Spike[] mySpikes;
Pixel[] myPixels;

void setup() {
  size(800, 800, P2D);
  background(255);
  noStroke();
  rectMode(CENTER);
  colorMode(HSB); 

  //instantiate arrays
  myStars = new Star[1000];
  myRipples = new Ripple[50];
  mySpikes = new Spike[150];
  myPixels = new Pixel[100];

  //instantiate contents of array
  for (int i = 0; i < myStars.length; i++) {
    myStars[i] = new Star();
  }
  for (int i = 0; i < myRipples.length; i++) {
    myRipples[i] = new Ripple();
  }
  for (int i = 0; i < mySpikes.length; i++) {
    mySpikes[i] = new Spike();
  }
  for (int i = 0; i < myPixels.length; i++) {
    myPixels[i] = new Pixel();
  }
}

void draw() {
  //star
  //fill(0, 10);
  //rect(width/2, height/2, width, height);
  //for (int i = 0; i < myStars.length; i++) {
  //  myStars[i].show();
  //  myStars[i].move();
  //}
  
  //ripple
  //background(0);
  //for (int i = 0; i < myRipples.length; i++) {
  //  myRipples[i].show();
  //  myRipples[i].act();
  //}
  
  //spike
  //for (int i = 0; i < mySpikes.length; i++) {
  //  mySpikes[i].show();
  //  mySpikes[i].grow();
  //}
  
  //pixel
  for (int i = 0; i < myPixels.length; i++) {
    myPixels[i].show();
    myPixels[i].grow();
  }
}

// Trevor Chen
// 2-2
// 23/2/13

// variables:
//  - mouseX, mouseY: coordinates of mouse

float e = 0;

void setup() {
  size(600, 600);
} // end of setup

void draw() {
  
  strokeWeight(1);
  fill(255);
  ellipse(300, 300, 200, 200);
  line(300, 300, mouseX, mouseY);
} // end of draw
// now processing draws a bunch of images repeatedly at about 60 fps

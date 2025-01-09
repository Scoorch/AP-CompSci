// Trevor Chen
// 2-2
// 23/2/13

// variables:
//  - mouseX, mouseY: coordinates of mouse

float e = 0;

void setup() {
  size(600, 600);
} // end of setup

void mouseWheel(MouseEvent event) {
  e += event.getCount() * 10;
  println(e);
}

void draw() {
  ellipse(mouseX, mouseY, e, e);
} // end of draw
// now processing draws a bunch of images repeatedly at about 60 fps

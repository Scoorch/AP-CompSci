float c = 0;

//void setup() {
fullScreen();
smooth(1);
//}

//void draw() {
for (int i = 0; i < height; i++) {
  c = map(i, 0, height, 0, 255);
  
  stroke(0);
  strokeWeight(1);
  fill(c, 0, 255-c);
  ellipse(width/2, 900-i, width, 900-i);
  println(i, c);
}

////for (int i = 0; i < height; i++) {
//if (e == 0) {
//  if (n < height/2) {
//    //stroke(c, g, b);
//    ellipse(width/2, n, width, n); //wtf?
//    n++;
//    //c += .4;
//    //println(c);
//  } else e = 1;
//} else {
//  //for (int i = height; i > 0; i--) {
//  if (n >= height/2) {
//    //stroke(r, g, c);
//    ellipse(width/2, n, width, 900-n);
//    n++;
//    //c += .4;
//    //println("phase2");
//  }
//}
//}

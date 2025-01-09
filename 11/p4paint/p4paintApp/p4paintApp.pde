//Trevor Chen
//2-2
//23/4/5

color sColorH = 0;
color sColorS = 12;
color sColorB = 0;
float slideY = 350;
float slideS = 20;
float slideMap;
float stampScale = 1;
boolean dragged = false;
boolean stamp = false;
PImage meowFloppy;

void setup() {
  size(600, 550);
  colorMode(HSB, 12); // to put colors in for loop instead of color index
  background(12);
  textSize(14);
  textAlign(CENTER, CENTER);
  meowFloppy = loadImage("meowFloppy.png");
}

void draw() {
  slideMap = map(slideY, 298, 391, 2, 38);
  fill(0, 0, 3);
  noStroke();
  strokeWeight(1);
  rect(0, 0, 50, height);

  // rectangle button array
  for (int i = 0; i < 12; i += 1) {
    preColor(10, 10 + i * 20, 30, 10, i);
  }
  noStroke();
  // black/white/clear/save/load buttons and tactile highlight outside of function b/c not hue change
  if (mouseX >= 10 && mouseX <= 40 && mouseY >= 250 && mouseY <= 260) { // b
    stroke(12);
  }
  fill(0, 0, 0);
  rect(10, 250, 30, 10);
  noStroke();
  if (mouseX >= 10 && mouseX <= 40 && mouseY >= 270 && mouseY <= 280) { // w
    stroke(0);
  }
  fill(0, 0, 12);
  rect(10, 270, 30, 10);
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 75 && mouseY <= height - 55) { // c
    stroke(12);
  }
  fill(0, 0, 0);
  rect(5, height - 75, 40, 20);
  fill(0, 0, 12);
  text("CLEAR", 25, height - 67.5);
  noStroke();
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 50 && mouseY <= height - 30) { // s
    stroke(12);
  }
  fill(0, 0, 0);
  rect(5, height - 50, 40, 20);
  fill(0, 0, 12);
  text("SAVE", 25, height - 42.5);
  noStroke();
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 25 && mouseY <= height - 5) { // l
    stroke(12);
  }
  fill(0, 0, 0);
  rect(5, height - 25, 40, 20);
  fill(0, 0, 12);
  text("LOAD", 25, height - 17.5);
  noStroke();

  // strokeWeight slider
  fill(0, 0, 8);
  stroke(0, 0, 0);
  strokeWeight(2.5);
  triangle(5, 391, 25, 290, 45, 391);
  arc(25.5, 391, 40, 40, radians(-3), radians(183), OPEN);

  // knob
  stroke(sColorH, sColorS, sColorB);
  strokeWeight(slideMap);
  point(25, slideY);
  stroke(sColorH, sColorS, sColorB - 6);
  strokeWeight(slideMap/5 * 4);
  point(25, slideY);
  
  // stamp
  noFill();
  noStroke();
  if (stamp) {
    fill(12);
  }
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= 425 && mouseY <= 465) {
    stroke(12);
  }
  strokeWeight(1);
  rect(5, 425, 40, 40);
  image(meowFloppy, 5, 425, 40, 40);
}

void preColor(int x, int y, int w, int h, int a) { // preset colors
  noStroke();
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    stroke(12);
  }
  fill(a, 12, 12);
  rect(x, y, w, h);
}

String[] extendList = new String[] {"JPEG", "jpeg", "JPG", "jpg", "TIFF", "tiff", "TIF", "tif", "BMP", "bmp", "PNG", "png", "GIF", "gif", "WBMP", "wbmp"}; // why so many

void saveImage(File f) { // saveimage
  if (f != null) {
    PImage canvas = get(50, 0, width - 50, height);
    String path = f.getAbsolutePath();
    for (String ext : extendList) { // auto add .png so you dont have to put in file name
      if (path.contains(ext)) {
        canvas.save(path);
        return;
      }
    }
    canvas.save(path.concat(".png"));
  }
}

void openImage(File f) { // openimage
  if (f != null) {
    for (int i = 0; i <= 10; i ++) {
      PImage pic = loadImage(f.getPath());
      image(pic, 50, 0);
    }

    //  PGraphics tempImage = createGraphics(width - 50, height);
    //  PImage pic = loadImage(f.getPath());
    //  tempImage.beginDraw();
    //  tempImage.image(pic, 0, 0);
    //  tempImage.endDraw();
    //  image(tempImage, 50, 0);
  }
}

void mouseClicked() { // button clicky
  for (int i = 0; i < 12; i++) { // colors
    if (mouseX >= 10 && mouseX <= 40 && mouseY >= 10 + i * 20 && mouseY <= 20 + i * 20) {
      sColorH = i;
      sColorS = 12;
      sColorB = 12;
    }
  }
  if (mouseX >= 10 && mouseX <= 40 && mouseY >= 250 && mouseY <= 260) { // b
    sColorB = 0;
  }
  if (mouseX >= 10 && mouseX <= 40 && mouseY >= 270 && mouseY <= 280) { // w
    sColorS = 0;
    sColorB = 12;
  }
  
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 125 && mouseY <= height - 85) { // stamp
    stamp = !stamp;
  }

  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 75 && mouseY <= height - 55) { // clear
    fill(12);
    noStroke();
    rect(50, 0, width - 50, height);
  }
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 50 && mouseY <= height - 30) { // save
    selectOutput("Choose a name for your new image file", "saveImage");
  }
  if (mouseX >= 5 && mouseX <= 45 && mouseY >= height - 25 && mouseY <= height - 5) { // load
    selectInput("Pick an image to load", "openImage");
  }
}

void mouseDragged() {
  // slider!
  if (dragged) {
    slideY = mouseY;
    slideY = max(298, slideY);
    slideY = min(391, slideY);
  }

  // draw!
  if (mouseX >= 50 && mouseX <= width && mouseY >= 0 && mouseY <= height) {
    if (stamp) { // stamp draw
      noStroke();
      noFill();
      pushMatrix();
      translate(mouseX, mouseY);
      scale(map(slideMap, 2, 38, 0, 2));
      image(meowFloppy, -65, -65);
      popMatrix();
    } else {
      stroke(sColorH, sColorS, sColorB);
      strokeWeight(slideMap);
      line(pmouseX, pmouseY, mouseX, mouseY); // before nicho told me about pmouse i was trying to make a variable that does the exact same thing because i didnt watch video yet
    }
  }
}

void mousePressed() {
  // slide when no movement!
  if (mouseX >= 25 - slideS && mouseX <= 25 + slideS && mouseY >= 298 && mouseY <= 410) {
    slideY = mouseY;
    dragged = true;
  }

  // draw when no movement!
  if (mouseX >= 50 && mouseX <= width && mouseY >= 0 && mouseY <= height) {
    if (stamp) {
      noStroke();
      noFill();
      pushMatrix();
      translate(mouseX, mouseY);
      scale(map(slideMap, 2, 38, 0, 2));
      image(meowFloppy, -65, -65);
      popMatrix();
    } else {
      stroke(sColorH, sColorS, sColorB);
      strokeWeight(slideMap);
      println(slideY);
      line(pmouseX, pmouseY, mouseX, mouseY); // before nicho told me about pmouse i was trying to make a variable that does the exact same thing because i didnt watch video yet
    }
  }
}

void mouseReleased() {
  dragged = false;
}

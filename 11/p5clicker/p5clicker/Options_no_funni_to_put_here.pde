int img;
float slideX1, slideX2, mrewindop;
boolean dragged1, dragged2;

void oSetup() {
  img = 0;
  slideX1 = 300;
  slideX2 = 300;
  dragged1 = false;
  dragged2 = false;
  circX = 500;
}

void options() {
  backg.pause();
  option.play();
  mrewindop += 1;
  if (mrewindop >= 10260) {
    option.rewind();
    mrewindop = 0;
  }
  
  noStroke();
  fill(0, 12, 8);
  rect(20, 20, 760, 760, 50);
  
  // exit button
  fill(0, 12, 6);
  circle(105, 100, 115);
  if (dist(mouseX, mouseY, 105, 100) <= 57.5) {
    fill(0, 12, 10);
  } else {
    fill(0, 12, 8);
  }
  triangle(60, 100, 130, 60, 130, 140);
  
  // size slider
  if (dist(mouseX, mouseY, slideX1, 665) <= 25 || dragged1) { // bottom code above top for some reason
    fill(0, 12, 10);
  } else {
    fill(0, 12, 8);
  }
  stroke(0, 12, 6);
  strokeWeight(10);
  circle(slideX1, 665, 50);
  line(300, 665, 700, 665);

  // label text
  textSize(80);
  fill(0, 12, 4);
  text("Size", 502, 577);
  text("Speed", 502, 377);
  fill(0, 12, 6);
  text("Size", 500, 575);
  text("Speed", 500, 375);
  
  // speed slider
  if (dist(mouseX, mouseY, slideX2, 475) <= 25 || dragged2) {
    fill(0, 12, 10);
  } else {
    fill(0, 12, 8);
  }
  circle(slideX2, 475, 50);
  line(300, 475, 700, 475);

  // example clicker
  fill(12);
  stroke(0);
  strokeWeight(2);;
  circVX = map(slideX2, 300, 700, 0.5, 5);
  
  circle(circX, 200, map(slideX1, 300, 700, 40, 200) - 2); // messy but works
  if (current == brain) {
  image(brain, circX - map(slideX1, 300, 700, 30, 188)/2, 200 - map(slideX1, 300, 700, 30, 188)/2, map(slideX1, 300, 700, 32, 190), map(slideX1, 300, 700, 32, 190));
  } else if (current == sbrain) {
  image(sbrain, circX - map(slideX1, 300, 700, 30, 175)/2, 200 - map(slideX1, 300, 700, 30, 175)/2, map(slideX1, 300, 700, 30, 170), map(slideX1, 300, 700, 30, 170));
  } else {
  image(bbrain, circX - map(slideX1, 300, 700, 40, 200)/2, 200 - map(slideX1, 300, 700, 40, 200)/2, map(slideX1, 300, 700, 40, 200), map(slideX1, 300, 700, 40, 200));
  }
  circX += sqrt(circVX * circVX * 2) * directX;
  if (circX <= 300 || circX >= 650) {
    directX *= -1;
  }
  
  // image selector
  noStroke();
  fill(0, 12, 6);
  rect(80, 300, 120, 120, 20);
  image(brain, 80, 300, 120, 120);
  rect(80, 450, 120, 120, 20);
  image(sbrain, 80, 450, 120, 120);
  rect(80, 600, 120, 120, 20);
  image(bbrain, 80, 600, 120, 120);
}

void optionsClicks() {
  if (dist(mouseX, mouseY, 105, 100) <= 57.5) {
    mode = INTRO;
    circX = 500;
    option.rewind();
    option.pause();
  }
  
  if (mouseX >= 80 && mouseX <= 200 && mouseY >= 300 && mouseY <= 420) {
    current = brain;
  }
  if (mouseX >= 80 && mouseX <= 200 && mouseY >= 450 && mouseY <= 570) {
    current = sbrain;
  }
  if (mouseX >= 80 && mouseX <= 200 && mouseY >= 600 && mouseY <= 720) {
    current = bbrain;
  }
}

void optionsPress() {
  if (mouseX >= 275 && mouseX <= 725 && mouseY >= 640 && mouseY <= 690) {
    if (mouseX >= 300 && mouseX <= 700) { // drag when click outside line but not jump slider outside
      slideX1 = mouseX;
    }
    dragged1 = true;
  }
  if (mouseX >= 275 && mouseX <= 725 && mouseY >= 450 && mouseY <= 500) {
    if (mouseX >= 300 && mouseX <= 700) {
      slideX2 = mouseX;
    }
    dragged2 = true;
  }
}

void optionsRelease() {
  dragged1 = false;
  dragged2 = false;
}

void optionsDrag() {
  if (dragged1) {
    slideX1 = mouseX;
    slideX1 = max(300, slideX1);
    slideX1 = min(700, slideX1);
  }
  if (dragged2) {
    slideX2 = mouseX;
    slideX2 = max(300, slideX2);
    slideX2 = min(700, slideX2);
  }
}

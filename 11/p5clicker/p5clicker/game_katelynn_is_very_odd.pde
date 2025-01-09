int score, highscore, level, lives, hurt;
float circX, circY, circW, circVX, circVY, directX, directY, lvlXP, lvlXPCap;

void gSetup() {
  score = 0; // clicks
  level = 0; // increases speed
  lives = 3; 
  hurt = 0; // for red screen on life loss
  circX = width/2; // x
  circY = height/2;
  circW = map(slideX1, 300, 700, 40, 200);
  circVX = map(slideX2, 300, 700, 0.5, 5); // velocity x
  circVY = map(slideX2, 300, 700, 0.5, 5);
  directX = 1; // direction multiplier to invert velocity
  directY = 1;
  lvlXP = 0; // 1 per click
  lvlXPCap = 3; // xp required for levelup
}
void game() {
  mrewindbg += 1;
  if (mrewindbg >= 8460) {
    backg.rewind();
    mrewindbg = 0;
  }
  
  if (hurt > 0) {
    background(0, 12, 12);
    hurt -= 1; // 2 frames of ow
  } else {
    background(3, 12, 12);
  }
  circX = circX + circVX * directX; 
  circY = circY + circVY * directY;
  if (dist(mouseX, mouseY, circX, circY) <= circW/2) {
    stroke(12, 12, 12);
  } else {
    stroke(0, 0, 0);
  }
  strokeWeight(2);
  fill(12);
  circle(circX, circY, circW - 2);
  if (current == brain) {
  image(brain, circX - map(slideX1, 300, 700, 30, 188)/2, circY - map(slideX1, 300, 700, 30, 188)/2, map(slideX1, 300, 700, 32, 190), map(slideX1, 300, 700, 32, 190));
  } else if (current == sbrain) {
  image(sbrain, circX - map(slideX1, 300, 700, 30, 175)/2, circY - map(slideX1, 300, 700, 30, 175)/2, map(slideX1, 300, 700, 30, 170), map(slideX1, 300, 700, 30, 170));
  } else {
  image(bbrain, circX - map(slideX1, 300, 700, 40, 200)/2, circY - map(slideX1, 300, 700, 40, 200)/2, map(slideX1, 300, 700, 40, 200), map(slideX1, 300, 700, 40, 200));
  }

  fill(0);
  textAlign(LEFT, CENTER);
  text("Score: " + score, 10, 80);
  text("Lives: " + lives, 10, 130);
  textAlign(RIGHT, CENTER);
  text("Highscore: " + highscore, 790, 80);
  text("Level: " + level, 790, 130);
  textAlign(CENTER, CENTER);

  noStroke();
  fill(8, 12, 12);
  rect(15, 15, map(lvlXP, 0, lvlXPCap, 0, 770), 30);
  noFill();
  stroke(0);
  strokeWeight(5);
  rect(15, 15, 770, 30);
  noStroke();

  if (circX + circW/2 >= width || circX - circW/2 <= 0) {
    directX *= -1;
  }
  if (circY + circW/2 >= height || circY - circW/2 <= 0) {
    directY *= -1;
  }
}

void gamePress() {
  if (dist(mouseX, mouseY, circX, circY) <= circW/2) {
    click.rewind();
    click.play();
    
    score += 1;
    lvlXP += 1;
    if (lvlXP >= lvlXPCap) {
      levelup.rewind();
      levelup.play();
      
      lvlXPCap += lvlXPCap/3;
      lvlXP = 0;
      level += 1;
      circVX += random(0.2, 1);
      circVY += random(0.2, 1);
      println(circVX);
    }
    if (score > highscore) {
      highscore = score;
    }
  } else {
    lifeloss.rewind();
    lifeloss.play();
    
    lives -= 1;
    hurt = 2;
    if (lives <= 0) {
      mode = END;
    }
  }
}

void gameRelease() {
}

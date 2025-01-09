void mode() {
  if (mode == 0) {
    intro();
  } else if (mode == 1) {
    game();
  } else if (mode == 2) {
    pause();
  }
}

void intro() {
  background(0);
  rectMode(CENTER);

  if (controls) {
    fill(200, 50);
    stroke(255);
    rect(width/2, height*.8, gridSize*6, gridSize*2);

    textSize(64);
    fill(255);
    text("a/d to move left/right", width*.5, height*.2);
    text("w to jump and navigate menus", width*.5, height*.3);
    text("s to quick fall and navigate menus", width*.5, height*.4);
    text("space to press menu and in game buttons", width*.5, height*.5);
    text("you have double jump", width*.5, height*.6);
    text("got it", width/2, height*.8-10);
  } else if (levelSelect) {
    text("level select", width*.5, height*.1);
    imageMode(CENTER);
    strokeWeight(16);

    if (aClick && buttonH > 0) buttonH--;
    if (dClick && buttonH < 2) buttonH++;

    if (buttonH == 0) stroke(255);
    rect(width*.2, height*.4, width*.1, height*.1);
    image(testMap, width*.2, height*.4, width*.1, height*.1);
    noStroke();

    if (buttonH == 1) stroke(255);
    rect(width*.4, height*.4, width*.1, height*.1);
    image(map1, width*.4, height*.4, width*.1, height*.1);
    noStroke();
    
    if (buttonH == 2) stroke(255);
    rect(width*.6, height*.4, width*.1, height*.1);
    image(map2, width*.4, height*.4, width*.1, height*.1);
    noStroke();

    imageMode(CORNER);
  } else {
    strokeWeight(1);
    stroke(255);

    textSize(96);
    text("game", width*.5, height*.1);

    fill(200, 50);
    rect(width/2, height*.5, gridSize*6, gridSize*2);

    fill(255);
    text("start!", width/2, height*.5-10);
  }
}

void game() {
  if (background.isPlaying() == false) background.jump(0);
  gameAct();
  if (frameCount % 2 == 0) {
    oldVel1 = player1.getVelocityX();
  } else {
    oldVel2 = player1.getVelocityX();
  }
  pushMatrix();
  translate(-p1Sprite.getX()+width/2, -p1Sprite.getY()+height/2);
  world.step();
  world.draw();
  detectCatch();

  popMatrix();
}

void pause() {
  pushMatrix();
  translate(-p1Sprite.getX()+width/2, -p1Sprite.getY()+height/2);
  world.draw();
  popMatrix();

  noStroke();
  rectMode(CORNER);
  fill(0, 100);
  rect(0, 0, width, height);

  textSize(64);
  rectMode(CENTER);
  if (dead != true && goal != true) {
    if (wKey && buttonH == 1) buttonH = 0;
    if (sKey && buttonH == 0) buttonH = 1;

    fill(200, 50);
    if (buttonH == 0) {
      stroke(255);
    } else {
      noStroke();
    }
    rect(width/2, height*.3, gridSize*6, gridSize*2);
    fill(255);
    text("resume!", width/2, height*.3-10);
  } else {
    buttonH = 1;
    rect(width/2, height*.3, gridSize*6, gridSize*2);
    fill(255);
    if (dead) text("dead :(", width/2, height*.3-10); else text("win :)", width/2, height*.3-10);
  }

  fill(200, 50);
  if (buttonH == 1) {
    stroke(255);
  } else {
    noStroke();
  }
  rect(width/2, height*.7, gridSize*6, gridSize*2);
  fill(255);
  text("restart?", width/2, height*.7-10);
}

void detectCatch() { // detect if catch
  if (player1.getVelocityX() == 0) { // if stationary
    if (map.get((int)player1.getX()/gridSize, (int)player1.getY()/gridSize+1) != white) { // if tile below is not white (to avoid step up catches)
      if (player1.isTouching("ice")) { // values differ because of movement differences
        if (oldVel1 >= 12 || dKey) { // prev frame's velocity right is above a certain amount, or is detecting input for that direction
          if (map.get((int)player1.getX()/gridSize+1, (int)player1.getY()/gridSize) == white) { // if tile to the right is white (should be moving
            //println("YES_R");
            player1.setPosition(player1.getX(), player1.getY()-0.15*gridSize); // sets position upwards to go over the bump
            p1Sprite.setPosition(player1.getX(), player1.getY()+0.15*gridSize); // sets sprite position back to original
            Catch = true; // for animation and sprite
            oldContactIce = true; // remembers that player was touching ice, for movement
            if (frameCount % 2 == 0) { // sets vel to 2 frames prior
              player1.setVelocity(oldVel2, player1.getVelocityY());
            } else {
              player1.setVelocity(oldVel1, player1.getVelocityY());
            }
          } else { // false alarm
            //println("NO_R" + frameCount);
          }
        } else if (oldVel1 <= -12 || aKey) {
          if (map.get((int)player1.getX()/gridSize-1, (int)player1.getY()/gridSize) == white) {
            //println("YES_L" + frameCount);
            player1.setPosition(player1.getX(), player1.getY()-0.15*gridSize);
            p1Sprite.setPosition(player1.getX(), player1.getY()+0.15*gridSize);
            Catch = true;
            if (frameCount % 2 == 0) {
              player1.setVelocity(oldVel2, player1.getVelocityY());
            } else {
              player1.setVelocity(oldVel1, player1.getVelocityY());
            }
          } else {
            //println("NO_L" + frameCount);
          }
        }
      } else {
        if ((oldVel1 >= 50 && aKey == false) || dKey) {
          if (map.get((int)player1.getX()/gridSize+1, (int)player1.getY()/gridSize) == white) {
            //println("YES_R");
            player1.setPosition(player1.getX(), player1.getY()-0.15*gridSize);
            p1Sprite.setPosition(player1.getX(), player1.getY()+0.15*gridSize);
            Catch = true;
            if (frameCount % 2 == 0) {
              player1.setVelocity(oldVel2, player1.getVelocityY());
            } else {
              player1.setVelocity(oldVel1, player1.getVelocityY());
            }
          } else {
            //println("NO_R" + frameCount);
          }
        } else if ((oldVel1 <= -50 && dKey == false) || aKey) {
          if (map.get((int)player1.getX()/gridSize-1, (int)player1.getY()/gridSize) == white) {
            //println("YES_L" + frameCount);
            player1.setPosition(player1.getX(), player1.getY()-0.15*gridSize);
            p1Sprite.setPosition(player1.getX(), player1.getY()+0.15*gridSize);
            Catch = true;
            if (frameCount % 2 == 0) {
              player1.setVelocity(oldVel2, player1.getVelocityY());
            } else {
              player1.setVelocity(oldVel1, player1.getVelocityY());
            }
          } else {
            //println("NO_L" + frameCount);
          }
        }
      }
    }
  }
}

void levelup() {
  level++;
  if (level == 2) {
    map = map1;
  } else if (level == 3) {
    map = map2;
  } else {
    win.jump(0);
    goal = true;
    mode = 2;
    buttonH = 1;
  }
}

void resetGame() {
  world.clear();
  terrain.clear();
  buttonH = 0;
  dead = false;
}

PImage reverseImage( PImage image ) { // image reverser
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );

  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

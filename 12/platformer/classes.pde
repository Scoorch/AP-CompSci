class FGameBox extends FBox {
  boolean ded = false;
  
  FGameBox(float tempX, float tempY) {
    super(tempX, tempY);
  }

  void act() {
  }

  boolean isTouching(String type) {
    ArrayList<FContact> contactList = getContacts();
    for (int i = 0; i < contactList.size(); i ++) {
      FContact fc = contactList.get(i);
      if (fc.contains(type)) {
        return true;
      }
    }
    return false;
  }
}

class FGoomba extends FGameBox {
  int frame = 0;
  int contactTimer = 0;
  int gDir;
  int goombaNum;

  FGoomba(boolean tempGDir, int tempGoombaNum) {
    super(gridSize*.7, gridSize*.7);
    if (tempGDir) {
      gDir = 1;
    } else {
      gDir = -1;
    }
    goombaNum = tempGoombaNum;
  }

  void act() {
    if (contactTimer > 0) contactTimer--;
    move();
    animate();
    collisions();
  }

  void move() {
    if (contactTimer == 0 && (isTouching("brickwall") || isTouching("brickjwall") || isTouching("leafedge"))) {
      if (contactTimer == 0) contactTimer = 10;
      gDir *= -1;
      //println(getName(), frameCount);
      //for (int g = 0; g < goombaNumArray.size(); g++) println("goomba"+goombaNumArray.get(g));
    }
    setVelocity(100 * gDir, getVelocityY());
  }

  void animate() {
    if (frame >= goomba.length) frame = 0;
    if (frameCount % 10 == 0) {
      attachImage(goomba[frame]);
      frame++;
    }
  }

  void collisions() {
    if (isTouching("hitF")) {
      world.remove(this);
      ded = true;
    }
  }

  //boolean goombaTouch() {
  //  ArrayList<FContact> contactList = getContacts();
  //  for (int i = 0; i < contactList.size(); i ++) {
  //    FContact fc = contactList.get(i);
  //    println(fc.contains("goomba"+'0'), frameCount);
  //    for (int g = 0; g < goombaNumArray.size(); g++) {
  //      if (fc.contains("goomba"+goombaNumArray.get(g)) == true) {
  //        if (goombaNumArray.get(g) != goombaNum) {
  //          return true;
  //          //println("s9du8ayfhosdf");
  //        }
  //      }
  //    } 
  //  }
  //  return false;
  //}
}

class FHammerBro extends FGoomba {

  FHammerBro(boolean tempGDir, int tempGoombaNum) {
    super(tempGDir, tempGoombaNum);
  }

  void act() {
    super.act();
    if (frameCount % 20 == 0) {
      h = new FHammer(gridSize*.8, gDir);
      h.setPosition(getX(), getY());
      h.setSensor(true);
      h.setName("hammer");
      terrain.add(h);
      world.add(h);
    }
  }

  void animate() {
    if (frame >= hammerB.length) frame = 0;
    if (frameCount % 10 == 0) {
      if (gDir < 0) attachImage(reverseImage(hammerB[frame]));
      else attachImage(hammerB[frame]);
      frame++;
    }
  }
}

class FHammer extends FGameBox {

  FHammer(float tempS, int dir) {
    super(tempS, tempS);
    if (dir > 0) setVelocity(300, -400);
    else setVelocity(-300, -400);
    attachImage(hammer);
  }

  void act() {
    adjustRotation(radians(5));
    if (isTouching("bounce") || isTouching("brick") || isTouching("brickwall") || isTouching("brickj") || isTouching("brickjwall") ||  isTouching("ice") || isTouching("leaf") || isTouching("leafedge") || isTouching("bridge")) {
      world.remove(this);
      ded = true;
    }
  }
}

class FThwomp extends FGameBox {
  float rposX, rposY;
  boolean down, mad, reset;
  int count;

  FThwomp(float tempX, float tempY) {
    super(gridSize*2, gridSize*2);
    rposX = tempX;
    rposY = tempY;

    down = false;
    mad = false;
    reset = false;
    count = 0;
  }

  void act() {
    if (reset != true && (down || (player1.getX() > getX() - gridSize && player1.getX() < getX() + gridSize && player1.getY() > getY()))) {
      setVelocity(0, 500);
      down = true;
      setStatic(false);
      count++;
      if (reset) mad = false;
      else mad = true;
    } else {
      setVelocity(0, -350);
      //println(rposY, getY());
      if (rposY == (int)getY()) {
        setStatic(true);
        count = 0;
        reset = false;
      }
    }
    if (count > 90) {
      down = false;
      mad = false;
      reset = true;
    }
    animate();
  }

  void animate() {
    if (mad) attachImage(thwomp[1]);
    else attachImage(thwomp[0]);
  }
}

class FBridge extends FGameBox {

  FBridge(float tempX, float tempY) {
    super(tempX, tempY);
  }

  void act() {
    if (isTouching("player1")) {
      setSensor(true);
      setStatic(false);
    }
  }
}

class FLava extends FGameBox {
  int frame = int(random(0, lava.length));
  int speed = int(random(5, 15));
  boolean doAnimate;

  FLava(float tempX, float tempY, boolean tempA) {
    super(tempX, tempY);
    doAnimate = tempA;
    attachImage(lava[0]);
  }

  void act() {
    if (doAnimate) animate();
  }

  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % speed == 0) {
      attachImage(lava[frame]);
      frame++;
    }
  }
}

class FFlag extends FGameBox {
  char type;
  int frame;

  FFlag(float tempX, float tempY, char tType) {
    super(tempX, tempY);
    type = tType;
    if (type == 'c') frame = int(random(0, cFlag.length));
    else frame = int(random(0, wFlag.length));
  }

  void act() {
    setVelocity(0, -15);
    animate();
  }

  void animate() {
    if (type == 'c') {
      if (frame >= cFlag.length) frame = 0;
      if (frameCount % 15 == 0) {
        attachImage(cFlag[frame]);
        frame++;
      }
    } else {
      if (frame >= wFlag.length) frame = 0;
      if (frameCount % 15 == 0) {
        attachImage(wFlag[frame]);
        frame++;
      }
    }
  }
}

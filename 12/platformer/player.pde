class FHitbox extends FGameBox { // vertical hitbox
  String type;
  int topbottom;

  FHitbox(String t, float sX, float sY, int tempTB) {
    super(sX, sY);
    type = t;
    topbottom = tempTB;
  }

  void act() {
    if (topbottom == 0) {
      if (type == "player") setPosition(player1.getX(), player1.getY()-gridSize*.35);
    } else if (topbottom == 1) {
      if (type == "player") setPosition(player1.getX(), player1.getY()+gridSize*.35);
    } else {
      if (type == "player") setPosition(player1.getX(), player1.getY());
    }
  }
}
class FPlayer extends FGameBox {

  FPlayer(float tempX, float tempY) {
    super(gridSize*.5, gridSize*.7);

    hitH = new FHitbox("player", gridSize*.5+5, 2, 0);
    hitH.setStatic(true);
    hitH.setGroupIndex(-1);
    hitH.setNoFill();
    hitH.setName("hitH");
    world.add(hitH);

    hitF = new FHitbox("player", gridSize*.5-5, 2, 1);
    hitF.setStatic(true);
    hitF.setGroupIndex(-1);
    hitF.setNoFill();
    hitF.setName("hitF");
    world.add(hitF);

    hitC = new FHitbox("player", gridSize*.2, gridSize*.3, 2);
    hitC.setStatic(true);
    hitC.setGroupIndex(-1);
    hitC.setNoFill();
    hitC.setName("hitC");
    world.add(hitC);

    setPosition(tempX, tempY);

    setNoStroke();
    setNoFill();

    setGroupIndex(-1);
    setRestitution(0);
    setRotatable(false);
    setDensity(0.1);
  }

  void act() {
    input();
    collisions();
    p1Sprite.act();
    hitH.act();
    hitF.act();
    hitC.act();
  }

  void input() {
    pAction = pIdle; // default idle
    if (jDelay) { // after jump delay, to prevent refreshing jump on the same frame as jumping
      if (isTouching("bounce") || isTouching("brick") || isTouching("brickwall") || isTouching("brickj") || isTouching("brickjwall") ||  isTouching("ice") || isTouching("leaf") || isTouching("leafedge") || isTouching("bridge") || isTouching("trunk")) jReady1 = 2; // jump
    }
    if (jDelay == false) jDelay = true;
    if (wKey) {
      if (jReset1 && jReady1 > 0) {
        jump.jump(0.225);
        if (isTouching("bounce")) { // bounce pad jump height
          setVelocity(getVelocityX(), -gridSize*30);
        } else { // normal jump height
          setVelocity(getVelocityX(), -gridSize*10);
        }

        jReady1--; // amount of available jumps goes down
        jReset1 = false; // prevents detection of multiple jumps per button press, have to release then press again to double jump
        jDelay = false; // delay
      }
    }
    if (aKey) {
      if (isTouching("ice")) { // ice movement speed
        adjustVelocity(map(getVelocityX(), -1000, 1500, -20, 0), 0);
      } else if (oldContactIce) { // after catch and was touching ice, movement tweaked to attmempt to simulate ice friction while in the air
        adjustVelocity(map(getVelocityX(), -1000, 1500, -1, 0), 0);
      } else { // normal movement
        adjustVelocity(map(getVelocityX(), -1000, 1000, 0, -150), 0);
      }
      pAction = pRun; // run animation of char
      dir = true; // direction is true when facing left
    }
    if (sKey) adjustVelocity(0, 20); // quick fall
    if (dKey) { // same as aKey but right instead of left
      if (isTouching("ice")) {
        adjustVelocity(map(getVelocityX(), -1500, 1000, 0, 20), 0);
      } else if (oldContactIce) {
        adjustVelocity(map(getVelocityX(), -1000, 1500, 0, 1), 0);
      } else {
        adjustVelocity(map(getVelocityX(), -1000, 1000, 150, 0), 0);
      }
      pAction = pRun;
      dir = false;
    }
    if (isTouching("bounce") || isTouching("brick") || isTouching("brickwall") || isTouching("brickj") || isTouching("brickjwall") || isTouching("ice") || isTouching("leaf") || isTouching("leafedge") || isTouching("bridge")) {
    } else {
      pAction = pJump; // if not touching any solid blocks, jump animation
    }
  }

  void collisions() {
    if (isTouching("spike") || isTouching("lava") || isTouching("hammer") || hitH.isTouching("thwomp") || hitH.isTouching("goomba")) { // die
      hurt.jump(0);
      setPosition(spawnX, spawnY);
    }

    if (hitC.isTouching("checkpoint")) { // checkpoint
      spawnX = hitC.getX();
      spawnY = hitC.getY();
    }

    if (hitC.isTouching("win")) { // win
      levelup();
      resetGame();
      drawMap();
      makePlayers();
    }
  }
}

class FPSprite extends FGameBox { // player sprite
  int catchTimer, frame;

  FPSprite(float tempX, float tempY) {
    super(tempX, tempY);
    setPosition(player1.getX(), player1.getY());
    setGroupIndex(-1); // contacts with everything but others in its index
    setRestitution(0);
    setRotatable(false);
    setDensity(0.1);
    setNoFill();
    setNoStroke();
  }

  void act() {
    dCatch();
    animate();
  }

  void dCatch() { // check if caught
    if (Catch && catchTimer <= 3) { // for 3 frames if catch
      setSensor(true); // touch nothing
      setDensity(0); // no grav
      setVelocity(player1.getVelocityX(), player1.getVelocityY()*-1); // fall up
      catchTimer++; // timer increase
    } else {
      Catch = false; // reset all variables
      oldContactIce = false;
      catchTimer = 0;
      setSensor(false);
      setDensity(0.1);
      setPosition(player1.getX(), player1.getY());
      setVelocity(player1.getVelocityX(), player1.getVelocityY());
    }
  }

  void animate() { // animate
    if (frame >= pAction.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (dir) attachImage(reverseImage(pAction[frame]));
      else attachImage(pAction[frame]);
      frame++;
    }
  }
}

void makePlatform() {
  platform = new FPoly();

  platform.vertex(width*.2, height*.6);
  platform.vertex(width*.8, height*.6);
  platform.vertex(width*.6, height*.75);
  platform.vertex(width*.4, height*.75);
  platform.vertex(width*.2, height*.6);

  platform.setStrokeWeight(3);
  platform.setStroke(20);
  platform.setFill(100);

  platform.setStatic(true);
  platform.setGrabbable(false);
  platform.setFriction(10);
  world.add(platform);
}

void loadMap() {
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      if (map.get(x, y) == black) {
        //mapTiles.add(new FBox());
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize+gridSize/2-width/2, y*gridSize-height/2);
        b.setStatic(true);
        b.setFillColor(orange);
        b.setStrokeColor(orange);
        b.setName("ground");
        world.add(b);
      }
    }
  }
}

void makePlayers() {
  player1 = new FPlayer(true);
  player2 = new FPlayer(false);

  world.add(player1);
  world.add(player2);
}

//void makePlayer2() {
//  //player2 = new FCircle(50);

//  player2.setPosition(width*.8-width*.05, height*.6-100);

//  player2.setStroke(255);
//  player2.setFill(205);

//  player2.setRestitution(.5);
//  player2.setRotatable(false);
//  player2.setDensity(0.1);

//  world.add(player2);
//}

void makeBullet1() {
  bullet1 = new FCircle(10);
  bullet1.setPosition(player1.getX() + velocity1.x, player1.getY() + velocity1.y);
  bullet1.setVelocity(velocity1.x * pMult1 + player1.getVelocityX(), velocity1.y * pMult1 + player1.getVelocityY());
  player1.adjustVelocity(bullet1.getVelocityX()/-2, bullet1.getVelocityY()/-2);

  bullet1.setNoStroke();
  bullet1.setFill(80);

  bullet1.setRestitution(.5);

  world.add(bullet1);

  power1 = 0;
}

void makeAimLine1() {
  aimLine1 = new FCircle(1);
  aimLine1.setPosition(player1.getX() + velocity1.x, player1.getY() + velocity1.y);
  aimLine1.setVelocity(velocity1.x * pMult1 + player1.getVelocityX(), velocity1.y * pMult1 + player1.getVelocityY());

  aimLine1.setNoStroke();
  aimLine1.setFill(80);

  aimLine1.setSensor(true);

  world.add(aimLine1);
}

void makeBullet2() {
  bullet2 = new FCircle(10);
  bullet2.setPosition(player2.getX() + velocity2.x, player2.getY() + velocity2.y);
  bullet2.setVelocity(velocity2.x * pMult2 + player2.getVelocityX(), velocity2.y * pMult2 + player2.getVelocityY());
  player2.adjustVelocity(bullet2.getVelocityX()/-2, bullet2.getVelocityY()/-2);

  bullet2.setNoStroke();
  bullet2.setFill(80);

  bullet2.setRestitution(.5);

  world.add(bullet2);

  power2 = 0;
}

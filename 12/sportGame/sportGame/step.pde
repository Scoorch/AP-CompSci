void pInput() {
  
  if (p1Win == false && player1.getY() >= height - 25) p2Win = true;
  if (wKey) {
    if (jReset1 && jReady1 > 0) {
      player1.setVelocity(player1.getVelocityX(), -400);
      jReady1--;
      jReset1 = false;
    }
  }
  if (aKey) player1.adjustVelocity(map(player1.getVelocityX(), -1000, 1000, 0, -150), 0);
  if (sKey) player1.adjustVelocity(0, 20);
  if (dKey) player1.adjustVelocity(map(player1.getVelocityX(), -1000, 1000, 150, 0), 0);
  if (qKey) velocity1.rotate(-0.05);
  if (eKey) velocity1.rotate(0.05);
  if (sbar) {
    if (power1 < 80) power1++;
  }
  println(player1.getVelocityX());
  println(width);
  if (player1.isTouching("ground")) jReady1 = 2;

  if (p2Win == false && player2.getY() >= height - 25) p1Win = true;
  if (up) {
    if (jReset2 && jReady2 > 0) {
      player2.setVelocity(player2.getVelocityX(), -400);
      jReady2--;
      jReset2 = false;
    }
  }
  if (left) player2.adjustVelocity(map(player2.getVelocityX(), -1000, 1000, 0, -150), 0);
  if (down) player2.adjustVelocity(0, 20);
  if (right) player2.adjustVelocity(map(player2.getVelocityX(), -1000, 1000, 150, 0), 0);
  if (fourKey) velocity2.rotate(-0.05);
  if (fiveKey) velocity2.rotate(0.05);
  if (oneKey) {
    if (power2 < 80) power2++;
  }
  if (player2.isTouching("ground")) jReady2 = 2;
}

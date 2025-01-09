void makePlayers() { // init player and sprite
  player1 = new FPlayer(spawnX, spawnY);
  player1.setName("player1");
  world.add(player1);
  
  p1Sprite = new FPSprite(gridSize*.7, 2);
  p1Sprite.setName("p1Sprite");
  world.add(p1Sprite);
}

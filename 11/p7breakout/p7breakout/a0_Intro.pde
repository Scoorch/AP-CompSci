void intro() {
  if (f >= gif.length) f = 0;
  image(gif[f], 0, 0, width, height);
  f++;

  fill(8, 12, 12);
  text("breakout", width/2, height/3);

  // paddlesetup
  padX = width/2;
  padD = 120;

  // ballsetup
  ballX = width/2;
  ballY = height/1.2;
  ballD = 10;
  ballVX = 0.1;
  ballVY = 1;

  // misc
  life = 3;
  reset = false;
  resetCount = 0;
  pauseOpacity = 0;
  win = false;

  // brickarray
  brickD = 40;
  brickAmount = x.length;

  speedMult = 5;

  for (int i = 0; i < x.length; i ++) {
    alive[i] = true;
  }
}

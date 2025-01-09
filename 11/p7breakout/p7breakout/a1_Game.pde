void game() {
  background(6, 12, 12);

  ballY = max(ballY, 0 + ballD/2);
  ballX = min(ballX, width - ballD/2);
  ballX = max(ballX, 0 + ballD/2);

  fill(0);
  circle(padX, height, padD); // paddle

  circle(ballX, ballY, ballD);

  for (int i = 0; i < life; i += 1) { // hearts
    triangle(i * 35 + 20, 20, i * 35 + 40, 20, i * 35 + 30, 35);
    circle(i*35 + 25, 18, 11);
    circle(i*35 + 36, 18, 11);
  }

  // paddle move
  if (aKey == true) {
    padX -= 12;
  }
  if (dKey == true) {
    padX += 12;
  }

  // bal move
  ballX += ballVX;
  ballY += ballVY;


  if (ballY >= height && reset == false) {
    life -= 1;
    ballX = width/2;
    ballY = height/1.2;
    ballVX = 0;
    ballVY = 0;
    padX = width/2;
    speedMult = 5;
    resetCount = 0;
    if (life == 0) mode = END;
    reset = true;
  }

  if (ballX <= 0 + ballD/2 || ballX >= width - ballD/2) { // ball bounce side
    ballVX *= -1;
    speedMult += .05;
  }
  if (ballY <= 0 + ballD/2) { // ball bounce top
    ballVY *= -1;
    speedMult += .05;
  }

  if (dist(padX, height, ballX, ballY) <= padD/2 + ballD/2) { // ball bounce paddle
    ballVX = ballX - padX;
    ballVY = ballY - height;
    float hyp = sqrt(ballVX * ballVX + ballVY * ballVY);
    ballVX /= hyp;
    ballVY /= hyp;
    ballVX *= speedMult;
    ballVY *= speedMult;
    ballX += ballVX;
    ballY += ballVY;
    speedMult += .05;
  }

  if (reset) {
    if (resetCount < 60) {
      resetCount += 1;
      background(0, 12, 10);
    } else {
      ballVY = 1;
      resetCount = 0;
      reset = false;
    }
  }

  // brick
  for (int i = 0; i < x.length; i ++) {
    if (alive[i]) {
      manageBrick(i);
    }
  }
}

void manageBrick(int i) {
  if (y[i] == 80) fill(0, 12, 12);
  if (y[i] == 120) fill(0, 12, 12);
  if (y[i] == 160) fill(10, 12, 12);
  if (y[i] == 200) fill(10, 12, 12);
  if (y[i] == 240) fill(6.5, 12, 12);
  if (y[i] == 280) fill(6.5, 12, 12);
  if (y[i] == 320) fill(5, 12, 12);
  if (y[i] == 360) fill(5, 12, 12);
  circle(x[i], y[i], brickD);
  if (dist(x[i], y[i], ballX, ballY) <= brickD/2 + ballD/2) { // ball bounce brick
    ballVX = ballX - x[i];
    ballVY = ballY - y[i];
    float hyp = sqrt(ballVX * ballVX + ballVY * ballVY);
    ballVX /= hyp;
    ballVY /= hyp;
    ballVX *= speedMult;
    ballVY *= speedMult;
    speedMult += .05;
    
    alive[i] = false;
    
    brickAmount -= 1;
    if(brickAmount == 0) {
      rectMode(CENTER);
      fill(6, 12, 12);
      rect(ballX, ballY, 80, 80);
      fill(0);
      circle(ballX, ballY, ballD);
      win = true;
      mode = END;
    }
    
    speedMult -= 0.005;
  }
}

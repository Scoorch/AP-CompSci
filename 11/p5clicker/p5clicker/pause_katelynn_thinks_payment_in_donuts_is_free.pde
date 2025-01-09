int pauseOpacity;

void pSetup() {
  pauseOpacity = 0;
}

void pause() {
  backg.pause();
  
  if (pauseOpacity < 8) { // fades into pause discovered on accident  
    fill(6, 12, 12, 2);
    rect(0, 0, width, height);
    pauseOpacity += 1;
  }
  
  fill(6, 12, 10);
  rect(50, 650, 250, 100, 20);
  fill(7, 12, 10);
  text("Paused", 175, 700);
}

void pauseClicks() {
  if (mouseX >= 50 && mouseX <= 300 && mouseY >= 650 && mouseY <= 750) {
    mode = GAME;
    pauseOpacity = 0;
    backg.play();
  }
}

void pausePress() {
  
}

void pauseRelease() {
  
}

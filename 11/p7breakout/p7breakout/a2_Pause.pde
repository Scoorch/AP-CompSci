void pause() {
  if (pauseOpacity < 6) {
    rectMode(CORNER);
    fill(0, 2);
    rect(0, 0, width, height);
    pauseOpacity += 1;
  }
  text("pause", width/2, 500);
}

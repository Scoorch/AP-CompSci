void pause() {
  backg.pause();

  if (pauseOpacity < 6) {
    fill(10, 4, 10, 2);
    rect(0, 0, width, height);
    pauseOpacity += 1;
  }
}

void pauseReleased() {
}

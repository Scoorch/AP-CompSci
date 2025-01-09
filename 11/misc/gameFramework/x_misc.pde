
void mouseClicked() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == OPTIONS) {
    optionClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == END) {
    endClicks();
  }
}

void mouseClicked() {
  if (mode == INTRO) {
    //introClicks();
  } else if (mode == OPTIONS) {
    optionsClicks();
  } else if (mode == GAME) {
    //gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == END) {
    endClicks();
  } else {
    println("funny click mode error hehe code sucks" + mode);
  }
}

void mousePressed() {
  if (mode == INTRO) {
    introPress();
  } else if (mode == OPTIONS) {
    optionsPress();
  } else if (mode == GAME) {
    gamePress();
  } else if (mode == PAUSE) {
    pausePress();
  } else if (mode == END) {
    endPress();
  } else {
    println("funny press mode error hehe code sucks" + mode);
  }
}

void mouseReleased() {
  if (mode == INTRO) {
    introRelease();
  } else if (mode == OPTIONS) {
    optionsRelease();
  } else if (mode == GAME) {
    gameRelease();
  } else if (mode == PAUSE) {
    pauseRelease();
  } else if (mode == END) {
    endRelease();
  } else {
    println("funny release mode error hehe code sucks" + mode);
  }
}

void keyReleased() {
  if (key == 'p' || key == 'P') {
    if (mode == GAME) {
      mode = PAUSE;
    } else if (mode == PAUSE) {
      mode = GAME;
      pauseOpacity = 0;
      backg.play();
    }
  }
}

void mouseDragged() {
  if (mode == OPTIONS) {
    optionsDrag();
  }
}

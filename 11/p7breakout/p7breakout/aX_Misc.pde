void keyPressed() {
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 'd' || key == 'D') dKey = true;
  if (keyCode == LEFT) aKey = true;
  if (keyCode == RIGHT) dKey = true;
}


void keyReleased() {
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 'd' || key == 'D') dKey = false;
  if (keyCode == LEFT) aKey = false;
  if (keyCode == RIGHT) dKey = false;
  
  if (keyCode == ' '  && mode == GAME) {
    mode = PAUSE;
  } else if (keyCode == ' '  && mode == PAUSE) {
    mode = GAME;
    pauseOpacity = 0;
  }
  
  if(key == ' ' && mode == INTRO) {
    mode = GAME;
  } else if (keyCode == ' '  && mode == END) {
    mode = INTRO;
  }
}

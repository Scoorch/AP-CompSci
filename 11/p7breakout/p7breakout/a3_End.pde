void end() {
  fill(0);
  if (win) {
    text("YOU WIN", width/2, 450);
  } else {
    text("YOU SUCK", width/2, 450);
    text(brickAmount + " remaining", width/2, 500);
  }
}

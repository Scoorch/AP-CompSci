void moveCam() {
  if (wKey && canMove('w')) {
    eyeX += cos(lrAngle) * 15;
    eyeZ += sin(lrAngle) * 15;
  }
  if (aKey && canMove('a')) {
    eyeX -= cos(lrAngle + PI/2) * 10;
    eyeZ -= sin(lrAngle + PI/2) * 10;
  }
  if (sKey && canMove('s')) {
    eyeX -= cos(lrAngle) * 15;
    eyeZ -= sin(lrAngle) * 15;
  }
  if (dKey && canMove('d')) {
    eyeX += cos(lrAngle + PI/2) * 10;
    eyeZ += sin(lrAngle + PI/2) * 10;
  }
  if (space) eyeY -= 10;
  if (shift) eyeY += 10;

  lrAngle += (mouseX - width/2) * .005;
  udAngle += (mouseY - height/2) * .005;
  udAngle = min(udAngle, PI/2.001);
  udAngle = max(udAngle, -PI/2.001);

  focusX = eyeX + cos(lrAngle) * 300;
  focusY = eyeY + tan(udAngle) * 300;
  focusZ = eyeZ + sin(lrAngle) * 300;
}

void keyPressed() {
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (key == 'd' || key == 'D') dKey = true;
  if (key == ' ') space = true;
  if (keyCode == SHIFT) shift = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (key == 'd' || key == 'D') dKey = false;
  if (key == ' ') space = false;
  if (keyCode == SHIFT) shift = false;
}

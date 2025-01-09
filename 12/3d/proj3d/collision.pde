boolean canMove(char d) {
  float x, z;
  x = z = 0;
  if (d == 'w') {
    x = eyeX + cos(lrAngle)*50;
    z = eyeZ + sin(lrAngle)*50;
  } else if (d == 'a') {
    x = eyeX + cos(lrAngle-PI/2)*50;
    z = eyeZ + sin(lrAngle-PI/2)*50;
  } else if (d == 's') {
    x = eyeX + cos(lrAngle+PI)*50;
    z = eyeZ + sin(lrAngle+PI)*50;
  } else if (d == 'd') {
    x = eyeX + cos(lrAngle+PI/2)*50;
    z = eyeZ + sin(lrAngle+PI/2)*50;
  } 
  
  int mapX = int((x+gridSize/2)/gridSize);
  int mapY = int((z+gridSize/2)/gridSize);
  //pushMatrix();
  //translate(mapX*gridSize, eyeY+100, mapY*gridSize);
  //box(100);
  //popMatrix();
  
  if(map.get(mapX, mapY) == #FFFFFF) {
    return true;
  }
  return false;
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int z = 0; z < map.height; z++) {
      color c = map.get(x, z);
      if (c != #ffffff) {
        for (int y = 0; y < wallHeight; y++) {
          if (c == #000000) {
            block(oLogT, oLogT, oLogS, oLogS, oLogS, oLogS, x*gridSize, height - gridSize*y, z*gridSize, rotX, rotY, rotZ, gridSize/2);
          } else {
            block(mBrick, x*gridSize, height - gridSize*y, z*gridSize, rotX, rotY, rotZ, gridSize/2);
          }
        }
      }
    }
  }
}

void drawPlatform(float tX, float tY, float tZ, float rX, float rY, float rZ) {
  for (int x = 0; x < gridSize*map.width; x += gridSize) {
    for (int z = 0; z < gridSize*map.height; z += gridSize) {
      block(diamond, tX*gridSize+x, height - tY*gridSize, tZ*gridSize+z, rX, rY, rZ, gridSize/2);
    }
  }
}

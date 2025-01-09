void loadImages() {
  testMap = loadImage("testmap.png");
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.png");
  //map3 = loadImage("map3.png");

  bridgeC = loadImage("bridgeM.png");
  bridgeR = loadImage("bridgeR.png");
  bridgeL = loadImage("bridgeL.png");
  bridgeC.resize(gridSize, 0);
  bridgeR.resize(gridSize, 0);
  bridgeL.resize(gridSize, 0);

  spike = loadImage("spike.png");
  spike.resize(gridSize, 0);

  leafL = loadImage("leafL.png");
  leafM = loadImage("leafM.png");
  leafR = loadImage("leafR.png");
  leafI = loadImage("leafI.png");
  leafL.resize(gridSize, 0);
  leafM.resize(gridSize, 0);
  leafR.resize(gridSize, 0);
  leafI.resize(gridSize, 0);

  brickA   = loadImage("brickA.png");
  brickB   = loadImage("brickB.png");
  brickBL  = loadImage("brickBL.png");
  brickBLR = loadImage("brickBLR.png");
  brickBR  = loadImage("brickBR.png");
  brickL   = loadImage("brickL.png");
  brickLR  = loadImage("brickLR.png");
  brickN   = loadImage("brickN.png");
  brickR   = loadImage("brickR.png");
  brickT   = loadImage("brickT.png");
  brickTB  = loadImage("brickTB.png");
  brickTBL = loadImage("brickTBL.png");
  brickTBR = loadImage("brickTBR.png");
  brickTL  = loadImage("brickTL.png");
  brickTLR = loadImage("brickTLR.png");
  brickTR  = loadImage("brickTR.png");
  brickA.resize  (gridSize, 0);
  brickB.resize  (gridSize, 0);
  brickBL.resize (gridSize, 0);
  brickBLR.resize(gridSize, 0);
  brickBR.resize (gridSize, 0);
  brickL.resize  (gridSize, 0);
  brickLR.resize (gridSize, 0);
  brickN.resize  (gridSize, 0);
  brickR.resize  (gridSize, 0);
  brickT.resize  (gridSize, 0);
  brickTB.resize (gridSize, 0);
  brickTBL.resize(gridSize, 0);
  brickTBR.resize(gridSize, 0);
  brickTL.resize (gridSize, 0);
  brickTLR.resize(gridSize, 0);
  brickTR.resize (gridSize, 0);

  bounce = loadImage("springRest.png");
  bounce.resize(gridSize, 0);

  ice = loadImage("ice.png");
  ice.resize(gridSize, 0);

  treeT = loadImage("treeT.png");
  treeT.resize(gridSize, 0);
  
  lavaMid = loadImage("lava6.png");
  lavaMid.resize(gridSize, 0);
  
  hammer = loadImage("hammer.png");
  hammer.resize(int(gridSize*.8), 0);
}

void loadAnimations() {
  pIdle = new PImage[2];
  pIdle[0] = loadImage("idle0.png");
  pIdle[1] = loadImage("idle1.png");
  pIdle[0].resize((int)gridSize/2, 0);
  pIdle[1].resize((int)gridSize/2, 0);
  
  pJump = new PImage[1];
  pJump[0] = loadImage("jump0.png");
  pJump[0].resize((int)gridSize/2, 0);
  
  pRun = new PImage[3];
  pRun[0] = loadImage("runright0.png");
  pRun[1] = loadImage("runright1.png");
  pRun[2] = loadImage("runright2.png");
  pRun[0].resize((int)gridSize/2, 0);
  pRun[1].resize((int)gridSize/2, 0);
  pRun[2].resize((int)gridSize/2, 0);
  
  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[1] = loadImage("goomba1.png");
  goomba[0].resize(int(gridSize*.7), 0);
  goomba[1].resize(int(gridSize*.7), 0);
  
  hammerB = new PImage[2];
  hammerB[0] = loadImage("hammerbro0.png");
  hammerB[1] = loadImage("hammerbro1.png");
  hammerB[0].resize(int(gridSize*.7), 0);
  hammerB[1].resize(int(gridSize*.7), 0);
  
  hammer = loadImage("hammer.png");
  hammer.resize(int(gridSize*.5), 0);
  
  thwomp = new PImage[2];
  thwomp[0] = loadImage("thwomp0.png");
  thwomp[1] = loadImage("thwomp1.png");
  thwomp[0].resize(gridSize*2, 0);
  thwomp[1].resize(gridSize*2, 0);
  
  lava = new PImage[10];
  lava[0] = loadImage("lava0.png");
  lava[1] = loadImage("lava1.png");
  lava[2] = loadImage("lava2.png");
  lava[3] = loadImage("lava3.png");
  lava[4] = loadImage("lava4.png");
  lava[5] = loadImage("lava5.png");
  lava[6] = loadImage("lava0.png");
  lava[7] = loadImage("lava0.png");
  lava[8] = loadImage("lava0.png");
  lava[9] = loadImage("lava0.png");
  lava[0].resize(gridSize, 0);
  lava[1].resize(gridSize, 0);
  lava[2].resize(gridSize, 0);
  lava[3].resize(gridSize, 0);
  lava[4].resize(gridSize, 0);
  lava[5].resize(gridSize, 0);
  lava[6].resize(gridSize, 0);
  lava[7].resize(gridSize, 0);
  lava[8].resize(gridSize, 0);
  lava[9].resize(gridSize, 0);
  
  cFlag = new PImage[10];
  cFlag[0] = loadImage("cFlag0.png");
  cFlag[1] = loadImage("cFlag1.png");
  cFlag[2] = loadImage("cFlag2.png");
  cFlag[3] = loadImage("cFlag3.png");
  cFlag[4] = loadImage("cFlag4.png");
  cFlag[5] = loadImage("cFlag5.png");
  cFlag[6] = loadImage("cFlag6.png");
  cFlag[7] = loadImage("cFlag7.png");
  cFlag[8] = loadImage("cFlag8.png");
  cFlag[9] = loadImage("cFlag9.png");
  cFlag[0].resize(gridSize, 0);
  cFlag[1].resize(gridSize, 0);
  cFlag[2].resize(gridSize, 0);
  cFlag[3].resize(gridSize, 0);
  cFlag[4].resize(gridSize, 0);
  cFlag[5].resize(gridSize, 0);
  cFlag[6].resize(gridSize, 0);
  cFlag[7].resize(gridSize, 0);
  cFlag[8].resize(gridSize, 0);
  cFlag[9].resize(gridSize, 0);
  
  wFlag = new PImage[10];
  wFlag[0] = loadImage("wFlag0.png");
  wFlag[1] = loadImage("wFlag1.png");
  wFlag[2] = loadImage("wFlag2.png");
  wFlag[3] = loadImage("wFlag3.png");
  wFlag[4] = loadImage("wFlag4.png");
  wFlag[5] = loadImage("wFlag5.png");
  wFlag[6] = loadImage("wFlag6.png");
  wFlag[7] = loadImage("wFlag7.png");
  wFlag[8] = loadImage("wFlag8.png");
  wFlag[9] = loadImage("wFlag9.png");
  wFlag[0].resize(gridSize, 0);
  wFlag[1].resize(gridSize, 0);
  wFlag[2].resize(gridSize, 0);
  wFlag[3].resize(gridSize, 0);
  wFlag[4].resize(gridSize, 0);
  wFlag[5].resize(gridSize, 0);
  wFlag[6].resize(gridSize, 0);
  wFlag[7].resize(gridSize, 0);
  wFlag[8].resize(gridSize, 0);
  wFlag[9].resize(gridSize, 0);
}

void drawMap() {
  int goombaNum = 0;
  for (int pY = 0; pY < map.height; pY++) {
    for (int pX = 0; pX < map.width; pX++) {
      color c = map.get(pX, pY);
      color t = map.get(pX, pY-1);
      color r = map.get(pX+1, pY);
      color b = map.get(pX, pY+1);
      color l = map.get(pX-1, pY);
      if (c == rBrown) { // goomba
        FGoomba x = new FGoomba(true, goombaNum);
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setFriction(0);
        x.setRotatable(false);
        x.setName("goomba");
        terrain.add(x);
        world.add(x);
        goombaNumArray.add(goombaNum);
        goombaNum++;
      } else if (c == tan) { // hammerb
        FHammerBro x = new FHammerBro(true, goombaNum);
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setFriction(0);
        x.setRotatable(false);
        x.setName("hammerb");
        terrain.add(x);
        world.add(x);
        goombaNumArray.add(goombaNum);
        goombaNum++;
      } else if (c == grey) { // thwomp
        FThwomp x = new FThwomp(pX*gridSize+gridSize, pY*gridSize+gridSize);
        x.setStatic(true);
        x.setPosition(pX*gridSize+gridSize, pY*gridSize+gridSize);
        x.setFriction(0);
        x.setRotatable(false);
        x.setName("thwomp");
        x.attachImage(thwomp[0]);
        terrain.add(x);
        world.add(x);
      } else if (c == gold) { // bridge
        FBridge x = new FBridge(gridSize, gridSize/2);
        x.setStatic(true);
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/4);
        x.setFriction(10);
        x.setName("bridge");
        if (l == gold) {
          if (r == gold) {
            x.attachImage(bridgeC);
          } else {
            x.attachImage(bridgeR);
          }
        } else if (r == gold) {
          x.attachImage(bridgeL);
        }
        terrain.add(x);
        world.add(x);
      } else if (c == dgreen) { // tree leaves
        FGameBox x = new FGameBox(gridSize, gridSize/2);
        x.setStatic(true);
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/4);
        x.setFriction(10);
        x.setName("leaf");
        if (l == dgreen || l == purp) {
          if (r == dgreen || r == purp) {
            if (b == brown) {
              x.attachImage(leafI);
              x.setName("leafedge");
            } else {
              x.attachImage(leafM);
            }
          } else {
            x.attachImage(leafR);
            x.setName("leafedge");
          }
        } else {
          if (r == dgreen || r == purp) {
            x.attachImage(leafL);
            x.setName("leafedge");
          }
        }
        terrain.add(x);
        world.add(x);
      } else if (c == dred) { // spikes
        FGameBox x = new FGameBox(gridSize*.8, 2);
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setStatic(true);
        x.attachImage(spike);
        x.setName("spike");
        if (t == purp || t == blue) {
          if (r == purp || r == blue) {
            if (b == purp || b == blue) {
              x.setRotation(-PI/2);
            } else {
              if (l == purp || l == blue) {
                x.setRotation(PI);
              } else {
                if (b == dred) {
                  x.setRotation(-PI/2);
                } else {
                  x.setRotation(PI);
                }
              }
            }
          } else {
            if (b == purp || b == blue) {
              if (l == purp || l == blue) {
                x.setRotation(PI/2);
              }
            } else {
              if (l == purp || l == blue) {
                if (b == dred) {
                  x.setRotation(PI/2);
                } else {
                  x.setRotation(PI);
                }
              } else {
                x.setRotation(PI);
              }
            }
          }
        } else {
          if (r == purp || r == blue) {
            if (b == purp || b == blue) {
              if (l == purp || l == blue) {
              } else {
                if (t == dred) {
                  x.setRotation(-PI/2);
                } else {
                }
              }
            } else {
              if (l != purp) {
                x.setRotation(-PI/2);
              }
            }
          } else {
            if (b == purp || b == blue) {
              if (l == purp || l == blue) {
                if (t == dred) {
                  x.setRotation(PI/2);
                } else {
                }
              } else {
              }
            } else {
              if (l == purp || l == blue) {
                x.setRotation(PI/2);
              }
            }
          }
        }
        terrain.add(x);
        world.add(x);
      } else if (c == lred) { // lava
        FLava x;
        if (t == white) {
          x = new FLava(gridSize*.8, 2, true);
        } else {
          x = new FLava(gridSize*.8, 2, false);
          x.attachImage(lavaMid);
        }
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setStatic(true);
        x.setSensor(true);
        x.setName("lava");
        terrain.add(x);
        world.add(x);
      } else if (c == teal) { // checkpoint
        FFlag x = new FFlag(gridSize, gridSize, 'c');
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setSensor(true);
        x.setName("checkpoint");
        terrain.add(x);
        world.add(x);
      } else if (c == yellow) { // win
        FFlag x = new FFlag(gridSize, gridSize, 'w');
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setSensor(true);
        x.setName("win");
        terrain.add(x);
        world.add(x);
      } else if (c != white) {
        FGameBox x = new FGameBox(gridSize, gridSize);
        x.setPosition(pX*gridSize + gridSize/2, pY*gridSize + gridSize/2);
        x.setStatic(true);
        x.setFriction(10);
        x.setRestitution(0);

        if (c == purp || c == blue) { // brick blocks
          if (c == purp) x.setName("brick");
          if (c == blue) x.setName("brickj");
          if (t == purp || t == blue) {
            if (r == purp || r == blue) {
              if (b == purp || b == blue) {
                if (l == purp || l == blue) {
                  x.attachImage(brickA);
                } else {
                  x.attachImage(brickTBR);
                  if (c == blue) x.setName("brickjwall"); else x.setName("brickwall");
                }
              } else {
                if (l == purp || l == blue) {
                  x.attachImage(brickTLR);
                } else {
                  x.attachImage(brickTR);
                  if (c == blue) x.setName("brickjwall"); else x.setName("brickwall");
                }
              }
            } else {
              if (c == blue) x.setName("brickjwall"); else x.setName("brickwall");
              if (b == purp || b == blue) {
                if (l == purp || l == blue) {
                  x.attachImage(brickTBL);
                } else {
                  x.attachImage(brickTB);
                }
              } else {
                if (l == purp || l == blue) {
                  x.attachImage(brickTL);
                } else {
                  x.attachImage(brickT);
                }
              }
            }
          } else {
            if (r == purp || r == blue) {
              if (b == purp || b == blue) {
                if (l == purp || l == blue) {
                  x.attachImage(brickBLR);
                } else {
                  x.attachImage(brickBR);
                  if (c == blue) x.setName("brickjwall"); else x.setName("brickwall");
                }
              } else {
                if (l == purp || l == blue) {
                  x.attachImage(brickLR);
                } else {
                  x.attachImage(brickR);
                  if (c == blue) x.setName("brickjwall"); else x.setName("brickwall");
                }
              }
            } else {
              if (c == blue) x.setName("brickjwall"); else x.setName("brickwall");
              if (b == purp || b == blue) {
                if (l == purp || l == blue) {
                  x.attachImage(brickBL);
                } else {
                  x.attachImage(brickB);
                }
              } else {
                if (l == purp || l == blue) {
                  x.attachImage(brickL);
                } else {
                  x.attachImage(brickN);
                }
              }
            }
          }
        }

        if (c == lgreen) { // bouncy blocks
          x.setFriction(10);
          x.setRestitution(.3);
          x.attachImage(bounce);
          x.setName("bounce");
        }

        if (c == lblue) { // ice blocks
          x.setFriction(0.005);
          x.attachImage(ice);
          x.setName("ice");
        }

        if (c == brown) { // tree trunk
          x.setSensor(true);
          x.setName("trunk");
          if (b == purp || b == blue) {
            if (t == dgreen) {
              x.attachImage(treeT);
            } else {
              x.attachImage(treeT);
            }
          } else {
            x.attachImage(treeT);
          }
        }

        if (c == pink) { // spawn
          x.setSensor(true);
          x.setFill(pink);
          x.setName("spawn");
          spawnX = pX*gridSize + gridSize/2;
          spawnY = pY*gridSize + gridSize/2;
        }

        terrain.add(x);
        world.add(x);
      }
    }
  }
}

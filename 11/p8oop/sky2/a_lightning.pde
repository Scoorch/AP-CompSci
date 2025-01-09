class Lightning {
  int branchC, sideFlop;
  float w, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, y1, y2, y3, y4; // clockwise from topleft

  Lightning() {
   
  }

  void reset() {
    branchC = (int)random(0, 2);
    sideFlop = (int)random(0, 2);
    w = random(50, 100);
    x1 = random(w + 100, width - 100); // segment1 | i could probably array this but whatev alr did all this i dont feel like optimizing
    x2 = x1 + w;
    x3 = random(x1 - 100, x1 + 100); // seg2
    x4 = x3 - w/2;
    if (branchC == 0) {
      x5 = random(x3 + 100, x3 + 200) + w/3; // seg3 r
      x8 = random(x4 - 100, x4 - 200); // seg3 l
    } else if (sideFlop == 0) {
      x5 = random(x3 + 100, x3 + 200) + w/3; // seg3 r if no branching
    } else {
      x5 = random(x4 - 100, x4 - 200); // seg3 l
    }
    x6 = x5 - w/3;
    x9 = x8 - w/3;
    sideFlop = (int)random(0, 2);
    if (sideFlop == 0) {
      x7 = random(x5 + 100, x5 + 200) + w/5; // seg4 r (r r if branched)
    } else {
      x7 = random(x6 - 100, x6 - 200); // seg4 l
    }
    sideFlop = (int)random(0, 2);
    if (sideFlop == 0) {
      x10 = random(x8 + 100, x8 + 200) + w/5; // seg4 l r (only used if branched)
    } else {
      x10 = random(x9 - 100, x9 - 200); // seg4 l l
    }
    y1 = 0;
    y2 = random(150, 200);
    y3 = y2 * 1.5;
    y4 = y2 * 2.3;
    println(x8);
  }
  
  void show() {
    fill(255, 255, 0);
    noStroke();
    lightSegment(x1, x2, x3, x4, y1, y2);
    lightSegment(x6, x5, x3, x4, y3, y2);
    lightSegment(x6, x5, x7, x7, y3, y4);
    if (branchC == 0) {
      lightSegment(x9, x8, x3, x4, y3, y2);
      lightSegment(x9, x8, x10, x10, y3, y4);
    }
  }

  void flash() {
  }

  void lightSegment(float tx1, float tx2, float tx3, float tx4, float ty1, float ty2) {
    beginShape();
    vertex(tx1, ty1);
    vertex(tx2, ty1);
    vertex(tx3, ty2);
    vertex(tx4, ty2);
    vertex(tx1, ty1);
    endShape();
  }
}

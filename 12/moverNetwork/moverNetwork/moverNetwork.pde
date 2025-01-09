//Trevor Chen
//24/3/11
//2-4

ArrayList<Mover> movers;
int mAmount = 0;

void setup() {
  fullScreen(P2D);
  movers = new ArrayList();

  //  for (int i = 0; i < mAmount; i++) {
  //    movers.add(new Mover(i));
  //  }
}

void draw() {
  background(#0E005F);
  println(frameRate);
  for (int i = 0; i < mAmount; i++) {
    Mover m = movers.get(i);
    m.act();
    //m.showBody();
    m.showConnections();
  }
  //for (Mover m : movers) {
  //  m.act();
  //  m.showConnections();
  //}
  
  if (mousePressed) {
    movers.add(new Mover(mouseX, mouseY, mAmount));
    mAmount ++;
  }
}

//void mouseReleased() {
//  movers.add(new Mover(mouseX, mouseY, mAmount));
//  mAmount ++;
//}

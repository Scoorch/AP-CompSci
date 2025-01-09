class Mover {

  int num;
  float d;
  PVector loc, vel; //location/velocity


  Mover(int x, int y, int num) {
    d = 100;
    loc = new PVector (x, y);//random(0+d/2, width-d/2), random(0+d/2, height-d/2));
    vel = new PVector (5, 0);//random(-100, 100), random(-100, 100));
    vel.rotate(radians(random(0, 360)));
    this.num = num;
  }

  void act() {
    loc.add(vel);

    if (loc.x < 0+d/2 || loc.x > width-d/2) vel.x *= -1;
    if (loc.y < 0+d/2 || loc.y > height-d/2) vel.y *= -1;
  }

  void showBody() {
    noStroke();
    fill(#9F63F0, 50);
    circle(loc.x, loc.y, d);
  }

  void showConnections() {
    for (int i = 0; i < mAmount; i++) {
      float dist = dist(loc.x, loc.y, movers.get(i).loc.x, movers.get(i).loc.y);
      if (i != num && dist <= 300) {
        stroke(#9F63F0, map(dist, 0, 300, 255, 0));
        strokeWeight(2/*map(dist, 0, 200, d/5, 0)*/);
        line(loc.x, loc.y, movers.get(i).loc.x, movers.get(i).loc.y);
      }
    }
  }
}

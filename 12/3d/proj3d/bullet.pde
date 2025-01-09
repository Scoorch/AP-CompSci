class Bullet extends GameObj {
  PVector dir;
  float speed;
  Bullet() {
    super(eyeX, eyeY, eyeZ, 10);
    speed = 50;
    dir = new PVector(cos(lrAngle), tan(udAngle), sin(lrAngle));
    dir.setMag(speed);
  }

  void act() {
    int hitX = int((loc.x+gridSize/2)/gridSize);
    int hitZ = int((loc.z+gridSize/2)/gridSize);
    if (map.get(hitX, hitZ) != #FFFFFF || loc.y < height-wallHeight*gridSize+gridSize/2 || loc.y > height+1*gridSize-gridSize/2) {
      lives = 0;
      dir.setMag(0);
      for (int i = 0; i < 5; i++) {
        objects.add(new Particle(loc));
      }
    } else {
      loc.add(dir);
    }
    noStroke();
    fill(255);
  }
}

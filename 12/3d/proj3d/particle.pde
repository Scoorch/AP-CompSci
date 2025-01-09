class Particle extends GameObj {
  PVector posO;
  PVector dir;

  Particle(PVector tempP) {
    posO = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    //posO = new PVector(0, 0, 0);
    loc = tempP;
    loc.add(posO);
    dir = PVector.random3D();
    size = 5;
    lives = 255;
  }

  void act() {
    int hitX = int((loc.x+gridSize/2)/gridSize);
    int hitZ = int((loc.z+gridSize/2)/gridSize);
    lives--;
    fill(255, 0, 0, lives);
    //if (lives <= 250) {
      if (map.get(hitX, hitZ) != #FFFFFF || loc.y < height-wallHeight*gridSize+gridSize/2 || loc.y > height+1*gridSize-gridSize/2) {
      } else {
        loc.add(dir);
        dir.add(0, 0.1, 0);
      }
    //}
  }
}

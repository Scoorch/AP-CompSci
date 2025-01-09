class GameObj {
  PVector loc;
  float size;
  float lives;
  
  GameObj() {
    loc = new PVector(0, 0, 0);
    size = 10;
    lives = 1;
  }
  
  GameObj(float x, float y, float z, float s) {
    loc = new PVector(x, y, z);
    size = s;
    lives = 1;
  }
  
  void act() {
  }
  
  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    box(size);
    popMatrix();
  }
}

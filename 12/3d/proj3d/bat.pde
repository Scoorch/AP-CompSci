class Bat extends GameObj {
  PVector dir, dirX, dirY, dirZ, dir2d;
  float moveDelay, temp;
  int mag;

  Bat() {
    super(random(gridSize, gridSize*map.width-gridSize*2), height, random(gridSize, gridSize*map.height-gridSize*2), 50);
    //super(map.width/2*gridSize, height-gridSize, map.height/2*gridSize, 50);

    mag = 1;

    //dir = new PVector(cos(radians(random(0, 360))), tan(radians(random(-45, 45))), sin(radians(random(0, 360))));
    //dir = PVector.random3D();
    dir = new PVector(0, 0, 0);
    dir.setMag(5);
    dirX = new PVector(dir.x, 0, 0);
    dirY = new PVector(0, dir.y, 0);
    dirZ = new PVector(0, 0, dir.z);
    dir2d = new PVector(dir.x, dir.y);
    moveDelay = int(random(10, 50));
  }

  void act() {
    //println(dir2d.x, dir2d.y, dir2d.heading());
    int hitXR, hitXL, hitZB, hitZT;
    noStroke();
    //if ((loc.x+gridSize/2+25)/gridSize % 1 >= 0.75) {
    //println((loc.x+gridSize/2+25)/gridSize%1>=.75);
    hitXR = ceil((loc.x)/gridSize);
    hitXL = floor((loc.x)/gridSize);
    hitZT = ceil((loc.z)/gridSize);
    hitZB = floor((loc.z)/gridSize);

    for (int i = 0; i < mag; i++) {
      if (map.get(hitXR, hitZB) != #FFFFFF || map.get(hitXL, hitZB) != #FFFFFF) { // x collision
        dirX.mult(-1);
        loc.add(dirX);
        //println("x "+frameCount);
      }
      loc.add(dirX);
      if (loc.y < height-wallHeight*gridSize+gridSize/2+25 || loc.y > height+1*gridSize-gridSize/2-25) { // y collision
        dirY.mult(-1);
        loc.add(dirY);
        //println("y "+frameCount);
      }
      loc.add(dirY);
      if (map.get(hitXR, hitZB) != #FFFFFF || map.get(hitXR, hitZT) != #FFFFFF) { // z collision
        dirZ.mult(-1);
        loc.add(dirZ);
        //println("z "+frameCount);
      }
      loc.add(dirZ);
    }
    //println(dirY);
    //loc.add(dirX.x, dirY.y, dirZ.z);

    //if (frameCount % moveDelay == 0) changeDir();
    fill(255);

    if (pressed) {
      //dir2d = new PVector(dirX.x, dirZ.z);
      temp++;
      if (temp > 90) temp = 0;
      dir2d.rotate(radians(temp));
      //dirX = new PVector(dir2d.x, 0, 0);
      //dirZ = new PVector(0, 0, dir2d.z);
    }
    //println(temp, dir2d.heading());

    //temp++;
    //pushMatrix();
    //translate(map.width/2*gridSize, height-wallHeight*gridSize, map.height/2*gridSize);
    //rotateY(dir2d.heading());
    //rotateZ(radians(20));
    //stroke(255);
    //strokeWeight(10);
    ////line(0, 0, 100, 0);
    //box(100, 100, 100);
    //popMatrix();
  }

  void changeDir() { //tan(radians(random(-11.25, 11.25)))
    dir.set(cos(radians(random(45, 135))), tan(radians(random(-11.25, 11.25))), sin(radians(random(-45, 135))));
    dir.setMag(5);
    dirX = new PVector(dir.x, 0, 0);
    dirY = new PVector(0, dir.y, 0);
    dirZ = new PVector(0, 0, dir.z);
    moveDelay = int(random(10, 50));
  }

  void show() {
    dir2d = new PVector(dirZ.z, dirX.x);
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    //if (dir2d.heading() < radians(-90) || dir2d.heading() > radians(90)) {
    //if ((dirX.x < 0 && dirZ.z >= 0) || (dirX.x >= 0 && dirZ.z < 0)) {
      //println('a', dir2d.heading(), frameCount);
    //} else {
      //println('b', dir2d.heading(), frameCount);
    //}
    //println(dirX.x, dirZ.z, dir2d.heading(), degrees(dir2d.heading()));
    rotateY(radians(180)+dir2d.heading());
    rotateX(radians(20));
    batB(0, 0, 0, 0, 0, 0, gridSize/2);
    fill(255);
    popMatrix();

    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    rotateY(radians(180)+dir2d.heading());
    
    pushMatrix();
    translate(0, -20, -15);
    batH(0, 0, 0, 0, 0, 0, gridSize/2);
    popMatrix();
    
    pushMatrix();
    translate(10, -10, 10);
    rotateX(radians(20));
    rotateY(radians(115));
    batW(0, 0, 0, 0, 0, 0, gridSize/2);
    popMatrix();
    
    pushMatrix();
    translate(-10, -10, 10);
    rotateX(radians(20));
    rotateY(radians(65));
    batW(0, 0, 0, 0, 0, 0, gridSize/2);
    popMatrix();
    
    fill(255);
    popMatrix();
  }
}

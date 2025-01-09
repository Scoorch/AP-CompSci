class Star {
  //1. Instance Variables  - the data that objects
  //                         of this type need to
  //                         remember

  color colour;
  float x, y, size, vx, vy;

  //2. Constructor - initializes (give default
  //                 values) the instance variables

  //                 The constructor is a function
  //                 with no void and its name
  //                 must be the same as the class
  Star() {
    //x = random(0, width);
    //y = random(0, height);
    x = width/2;
    y = height/2;
    size = 2;
    vx = random(-size/2, size/2);
    vy = random(-size/2, size/2);
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }

  //3. Behaviour Functions - regular functions that
  //                         act upon the instance
  //                         variables and do whatever
  //                         tasks these objects are
  //                         supposed to do
  void show() {
    fill(colour);
    square(x, y, size);
  }

  void move() {
    x += vx;
    y += vy;
    size += 0.002;
    
    if (y > height || y < 0 || x > width || x < 0) {
      //x = random(0, width);
      //y = 0;
      x = width/2;
      y = height/2;
      size = 2;
      vx = random(-size, size);
      vy = random(-size, size);
    }
  }
} //eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

class Cloud {


  float[] cx; //individual cloud circles xyd
  float[] cy;
  float[] cd;
  int nr;
  float x, y, v;
  boolean cRain;

  Cloud(int cn) {
    x = random(-150, width + 150);
    y = random(-50, height/2);
    v = random(1, 5);
    nr = 0;

    cx = new float[20];
    cy = new float[20];
    cd = new float[20];

    if ((int)random(0, 10) == 0) cRain = true;

    for (int i = 0; i < cx.length; i ++) {
      cx[i] = random(x - 50, x + 50);
      cy[i] = random(y - 50, y + 50);
      cd[i] = random(50, 100);
    }
  }

  void show() {
    fill(200, 50);
    noStroke();
    for (int i = 0; i < cx.length; i ++) {
      circle(cx[i], cy[i], cd[i]);
    }
  }

  void move() {
    x += v;
    for (int i = 0; i < cx.length; i ++) {
      cx[i] += v;
    }

    if (x > width + 150) {
      x = -150;
      y = random(-50, height/2);
      v = random(1, 5);
      if ((int)random(0, 10) == 0) cRain = true;
      for (int i = 0; i < cx.length; i ++) {
        cx[i] = random(x - 50, x + 50);
        cy[i] = random(y - 50, y + 50);
        cd[i] = random(50, 100);
      }
    }
  }

  void rain() {
    if (cRain) {
      Rain r = new Rain(x + random(-50, 50), y + random(-50, 50)); //stuff
      for (int i = 0; i < myRain.length; i ++) {
        if (myRain[i] == null) {
          myRain[i] = r;
          break;
        }
      }
    }
  }
}

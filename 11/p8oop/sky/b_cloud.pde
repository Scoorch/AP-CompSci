class Cloud {
  Rain[] myRain;

  float[] cx; //individual cloud circles xyd
  float[] cy;
  float[] cd;
  float[] tempX;
  float[] tempY;
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
    tempX = new float[20];
    tempY = new float[20];

    if ((int)random(0, 10) == 0) cRain = true;

    for (int i = 0; i < cx.length; i ++) {
      cx[i] = random(x - 50, x + 50);
      cy[i] = random(y - 50, y + 50);
      cd[i] = random(50, 100);
      tempX[i] = cx[i];
      tempY[i] = cy[i];
    }

    myRain = new Rain[20];
    for (int i = 0; i < myRain.length; i++) {
      myRain[i] = new Rain();
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
        tempX[i] = cx[i];
        tempY[i] = cy[i];
      }
    }
  }

  void rain() {
    if (cRain) {
      nr = (int)random(0, 20);
      myRain[nr].show(tempX[nr], tempY[nr]);
      myRain[nr].fall();
    }
  }
}

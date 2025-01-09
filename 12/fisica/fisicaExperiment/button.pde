class Button {

  int x, y;
  float w, h, highlight, normal;
  String text;
  boolean clicked;

  Button(int x, int y, float w, float h, float normal, float highlight, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.normal = normal;
    this.highlight = highlight;
    this.text = text;
    clicked = true;
  }

  void show() {
    rectMode(CENTER);
    colorMode(HSB, 360, 100, 100);
    if (clicked) {
      if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
        fill(normal, 100, 100);
      } else {
        fill(highlight, 100, 100);
      }
    } else {
      if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
        fill(highlight, 100, 100);
      } else {
        fill(normal, 100, 100);
      }
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    textAlign(CENTER, CENTER);
    if (clicked) {
      if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
        fill(highlight, 100, 100);
      } else {
        fill(normal, 100, 100);
      }
    } else {
      if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
        fill(normal, 100, 100);
      } else {
        fill(highlight, 100, 100);
      }
    }
    textSize(w/4);
    text(text, x, y);

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked = !clicked;
    }
    colorMode(RGB, 255, 255, 255);
  }
}

void mouseReleased() {
  mouseReleased = true;
}

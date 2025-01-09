class Button {

  int x, y, text;
  PImage ethan;
  float w, h, highlight, normal;
  boolean clicked, textimage;
  char letter;

  Button(PImage ethan, int x, int y, float w, float h, float normal, float highlight, int text, boolean textimage) {
    this.ethan = ethan;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.normal = normal;
    this.highlight = highlight;
    this.text = text;
    this.textimage = textimage;
    clicked = false;
    letter = 'A';
    letter += text;
  }

  void show() {
    rectMode(CENTER);
    colorMode(HSB, 360, 100, 100);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight, 100, 100);
    } else {
      fill(normal, 100, 100);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal, 100, 100);
    } else {
      fill(highlight, 100, 100);
    }
    if (textimage == true) {
      textSize(w/4);
      text(letter, x, y);
    } else {
      image(ethan, x, y, w, h);
    }

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}

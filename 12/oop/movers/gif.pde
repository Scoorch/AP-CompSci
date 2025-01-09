class Gif {
  int frames, delay, x, y, w, h, temp;

  Gif(String f1, String f2, int frames, int delay, int x, int y, int w, int h) {
    for (int i = 0; i < frames; i ++) {
      file[i] = loadImage(f1+i+f2);
      file[i].resize(w, h);
    }
    this.frames = frames;
    this.delay = delay;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    temp = 0;
  }

  void show() {
    if (frameCount % delay == 0) if (temp < frames) {
      background(0);
      image(file[temp], x, y);
      temp++;
    } else {
      temp = 0;
    }
  }
}

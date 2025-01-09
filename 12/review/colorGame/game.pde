color[] colour = {#FF0000, #FF9F03, #FFFF00, #00FF00, #0000FF, #FF00FF};
String[] word = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"};
boolean ans, correct;
int cFill, cWord, score, life, tCount, timer, timerR;

void game() {
  background(70, 70, 70);

  timer -= 1;
  if (timer <=0) {
    life -= 1;
    correct = false;
    refresh();
    wangdongnewsnetwork.jump(0);
  }
  if (tCount < 70) {
    for (int i = 0; i <= 200; i+= 15) {
      if (correct == true) {
        stroke(0+tCount, 255-map(tCount, 0, 70, 0, 185), 0+tCount, 5); // map to take away from 255 until it is 70 (255-185=70), if framerate is low some issues are visible
      } else {
        stroke(255-map(tCount, 0, 70, 0, 185), 0+tCount, 0+tCount, 10);
      }
      strokeWeight(i+50);
      noFill();
      rect(-50, -50, width+100, height+100, 250); // hollow rect around edge, darker in middle
    }

    tCount += 5; // increases until same grey as background
  }

  // center rounded rect
  noStroke();
  fill(50);
  rect(width/5, height/5, width-width/5*2, height-height/5*2, 100);

  // lose detector
  if (life <=0) {
    mode = 2;
    yellowsnow.jump(0);
  } else {

    // text
    fill(colour[cFill]);
    textSize(96);
    text(word[cWord], width/2, height/2);

    // life hearts
    fill(255, 0, 127);
    noStroke();
    for (int i = 0; i < life; i ++) {
      pushMatrix();
      translate(-100+100*i, 0);
      circle(width/2-10, height/2+height/6, 30);
      circle(width/2+10, height/2+height/6, 30);
      triangle(width/2-20, height/2+height/6+11, width/2+20, height/2+height/6+11, width/2, height/2+height/6+34);
      popMatrix();
    }
  }

  // timer bar
  strokeWeight(50);
  stroke(0);
  line(width/4, height/3.5, width-width/4, height/3.5);
  strokeWeight(30);
  stroke(255);
  line(width/4, height/3.5, width-width/4, height/3.5);
  colorMode(HSB, 360, 100, 100);
  stroke(map(timer, 1*30, 10*30, 0, 122.5), 100, 100);
  line(width/4-30, height/3.5, map(timer, 0, 10*30, width/4-30, width-width/4), height/3.5);
  colorMode(RGB, 255, 255, 255, 100);
  
  stroke(50);
  strokeWeight(40);
  rect(width/4-36, height/3.5, 1, 1); // covering square for reasons below
  stroke(0);
  strokeWeight(10);
  noFill();
  arc(width/4, height/3.5, 40, 40, radians(90), radians(270)); // makeshift border cap to cover colored line so it doesnt poof out of existence when it reaches 0 length

  timer--;
}

void keyReleased() {
  if (mode == 1) {
    if (keyCode == LEFT) { // left = same
      if (ans == true) { // if choice is correct
        score += 1;
        correct = true; // tells edge what color it should be
        undersuccess.jump(0);
      } else {
        life -= 1;
        correct = false;
        wangdongnewsnetwork.jump(0);
      }
      refresh();
    } else if (keyCode == RIGHT) { // right = different
      if (ans == false) { // if choice is correct
        score += 1;
        correct = true;
        undersuccess.jump(0);
      } else {
        life -= 1;
        correct = false;
        wangdongnewsnetwork.jump(0);
      }
      refresh();
    }
  }
}

void refresh() {
  cWord = int(random(0, 6));
  cFill = cWord;
  if (int(random(0, 2)) == 0) { // half of the time b/c int rounds down
    while (cFill == cWord) { // changes until different
      cFill = int(random(0, 6));
    }
    ans = false; // tells code they arent the same
  } else {
    ans = true;
  }
  tCount = 0; // resets fade timer
  if (correct == true) {
    if (cFont == 0) {
      timer += 30*map(score, 0, 100, 5, 2); // gives slowly reducing time back on success
    } else if (cFont == 1) {
      timer += 30*map(score, 0, 100, 3.5, 1);  // gives less time
    } else {
      timer += 30*map(score, 0, 100, 2, 0.5); // even less
    }
    if (score == 100) {
      mogolovonia.jump(0); // MOGOLOVONIA
    }
  } else {
    timer = timerR;
  }
}

// font selector
// Forsaking monastic tradition, twelve jovial friars gave up their vocation for a questionable existence on the flying trapeze.

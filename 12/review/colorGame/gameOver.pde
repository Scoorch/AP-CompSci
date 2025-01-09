
void gameOver() {
  mogolovonia.pause();
  String[] highscore = loadStrings("highscore.txt");
  if (int(highscore[0]) < score) {
    highscore[0] = str(score);
    saveStrings("highscore.txt", highscore);
  }
  
  fill(255, 0, 0);
  textSize(96);
  text("you lose lmao", width/2, height/2);
  textSize(64);
  text("score: "+score, width/2, height/2-height/13*2);
  text("highscore: "+highscore[0], width/2, height/2+height/13*2);
}

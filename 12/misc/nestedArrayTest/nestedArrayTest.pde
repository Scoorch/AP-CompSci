// t
// 23/10/5

int currentQ, score, delay;
boolean answerable;
String[] questions;
int[] qAns;
PFont main;

void setup() {
  size(1200, 500);
  background(0);
  textAlign(CENTER, CENTER);
  main = loadFont("AgencyFB-Bold-48.vlw");
  textFont(main);
  currentQ = 0;
  answerable = false;
  score = 0;
  delay = 100;
  
  //question = new int[5][][]; // sentence
  //for (int i = 0; i < question.length; i++) {
  //  question[i] = new int[(int)random(3, 6)][]; // #words
  //  for (int j = 0; j < question[i].length; j++) {
  //    question[i][j] = new int[(int)random(3, 6)]; // letters in the word 0-25
  //  }
  //}
  //String[] qInitPre = {"0", "0", "0", "0", "0", "1", "0", "0", "1", "0"};
  //String[] qPre = new String[questions.length];
  
  //String[] qName = {"Nicholas ", "Bruce ", "Ethan C. ", "Ethan Y. ", "Brendan ", "Danielle ", "Mia ", "Bill ", "Ben ", "David "};
  String[] qName = {"Bruce ", "Bruce ", "Bruce ", "Bruce ", "Bruce ", "Bruce ", "Bruce ", "Bruce ", "Bruce ", "Bruce "};
  String[] qSkill = {"godly at ", "amazing at ", "great at ", "decent at ", "copeable at ", "subpar at ", "disappointing at ", "bad at ", "terrible at ", "ass at ", "an inter at ", "a player/student of "};
  String[] qActivity = {"league of legends", "genshin impact", "honkai star rail", "terraria", "minecraft", "hades", "minesweeper", "programming", "math", "physics", "chemistry", "biology", "english", "physical activity", "japanese", "french", "programming", "music", "socials"};
  questions = new String[qName.length];
  qAns = new int[qName.length];
  println(qName.length);
  for (int i = 0; i < questions.length; i++) {
    questions[i] = "Is "+qName[i]+qSkill[int(random(0, qSkill.length))]+qActivity[int(random(0, qActivity.length))]+"?";
    qAns[i] = int(random(0, 2));
    println(qAns);
  }
}

void draw() {
  if (delay < 100 && delay > -1) {
    answerable = false;
    delay += 1;
  }
  if (delay >= 100) {
    if (currentQ < questions.length) { //ask question
      background(0);
      fill(255);
      println("-----------------");
      println(questions[currentQ].toString());
      println("question: "+currentQ);
      print("answer: ");
      text(questions[currentQ].toString(), 600, 200);
      text("answer: ", 600, 300);
      answerable = true;
      delay = -1;
    } else {
      println("end trigger");
      if (score >= questions.length - 1) { //win
        background(0);
        fill(0, 255, 0);
        println("all correct");
        text("test win", 600, 200);
        text("score: "+score+"/"+questions.length, 600, 300);
        println("score: "+score);
      }
      if (score < questions.length - 1) { //lose
        background(0);
        fill(255, 0, 0);
        println("ya suck");
        text("test lose", 600, 200);
        text("score: "+score+"/"+questions.length, 600, 300);
        println("score: "+score);
      }
      delay = -1;
    }
  }
}

void keyPressed() {
  if (key == 'y' && answerable == true) {
    println("yes");
    background(0);
    fill(0, 255, 0);
    text("test yes", 600, 250);
    currentQ += 1;
    answerable = false;
    delay = 0;
    if (qAns[currentQ - 1] == 1) score += 1;
    println("score: "+score);
  }
  if (key == 'n' && answerable == true) {
    println("nope");
    background(0);
    fill(255, 0, 0);
    text("test no", 600, 250);
    currentQ += 1;
    answerable = false;
    delay = 0;
    if (qAns[currentQ - 1] == 0) score += 1;
    println("score: "+score);
  }
}
// the quick brown fox jumpesover the lazy dog

// Trevor Chen
// 2-2
// 23/2/8 - 23/2/12

size(800, 600);

// sun+sky
 // sky
 noStroke();
 fill(#7A0CC9);
 circle(400, 350, 1100);
 fill(lerpColor(color(#7A0CC9), color(#B20CC9), .60));
 circle(400, 350, 970);
 fill(color(#B20CC9)); // colors dull when mixing far color with sun
 circle(400, 350, 780);
 fill(lerpColor(#B20CC9, #EDE31A, .10));
 circle(400, 350, 610);
 fill(lerpColor(#B20CC9, #EDE31A, .20));
 circle(400, 350, 460);
 fill(lerpColor(#B20CC9, #EDE31A, .30));
 circle(400, 350, 330);
 fill(lerpColor(#B20CC9, #EDE31A, .40));
 circle(400, 350, 220);
 fill(lerpColor(#B20CC9, #EDE31A, .50));
 circle(400, 350, 130);

 // sun
 fill(#EDE31A);
 circle(400, 350, 80);
 stroke(#EDE31A);           // change to something else :)
 strokeWeight(10);
 line(385, 320, 385, 320);
 line(415, 320, 415, 320);
 noFill();
 arc(400, 330, 30, 30, radians(15), radians(165));
 noStroke();
//mountains #07114B #7C8EF5
 // left
 fill(#0B1D7C);
 triangle(50, 350, 230, 350, 140, 250);   // middle right
 fill(#7C8EF5);
 triangle(240, 350, 230, 350, 140, 250); 
 fill(#0A1A71);
 triangle(-100, 350, 120, 350, -20, 220); // far left
 fill(#7C8EF5);
 triangle(130, 350, 120, 350, -20, 220);
 fill(#051881);
 triangle(-50, 350, 200, 350, 75, 260);   // middle left
 fill(#7C8EF5);
 triangle(210, 350, 200, 350, 75, 260);
 fill(#0E228E);
 triangle(100, 350, 320, 350, 200, 280);  // far right
 fill(#7C8EF5);
 triangle(340, 350, 320, 350, 200, 280);
 
 // right
 fill(#0B1D7C);
 triangle(550, 350, 830, 350, 700, 250); // middle
 fill(#7C8EF5);
 triangle(530, 350, 550, 350, 700, 250);
 fill(#0E228E);
 triangle(470, 350, 670, 350, 600, 270); // left
 fill(#7C8EF5);
 triangle(455, 350, 470, 350, 600, 270);
 fill(#0A1A71);
 triangle(620, 350, 900, 350, 850, 260); // right
 fill(#7C8EF5);
 triangle(610, 350, 620, 350, 850, 260);
 
// ground 
fill(#0CA524);
rect(0, 350, 800, 250);                 // far dark green
fill(lerpColor(#17E036, #0CA524, .60));
circle(250, 1110, 1500);                // back left
fill(lerpColor(#17E036, #0CA524, .40));
circle(650, 800, 900);                  // back right
fill(lerpColor(#17E036, #0CA524, .20));
circle(150, 850, 900);                  // left
fill(#17E036);
circle(700, 950, 900);                  // right

// robot
strokeWeight(5);
stroke(100);

 // body
 
  // antennae + shadow
  line(630, 300, 630, 350);
  line(655, 260, 655, 350);
  fill(200);
  circle(630, 300, 10);
  circle(655, 260, 15);
  fill(#055514, 200);
  noStroke();
  ellipse(650, 533, 200, 50);
  stroke(100);
  
  // top
  fill(120);
  rect(625, 450, 50, 50);
  fill(150);
  rect(600, 360, 100, 70);
  fill(200);
  beginShape();
  vertex(610, 340); // top left
  vertex(690, 340); // top right
  vertex(710, 360); // right top
  vertex(710, 380); // bottom far right
  vertex(685, 380); // bottom middle right
  vertex(665, 360); // middle right
  vertex(635, 360); // middle left
  vertex(615, 380); // bottom middle left
  vertex(590, 380); // bottom far left
  vertex(590, 360); // left top
  vertex(610, 340); // top left
  endShape();
  
  // bottom
  beginShape();
  vertex(590, 410); // top far left
  vertex(615, 410); // top middle left
  vertex(635, 430); // middle left
  vertex(665, 430); // middle right
  vertex(685, 410); // top middle right
  vertex(710, 410); // top far right
  vertex(710, 430); // right bottom
  vertex(690, 450); // bottom right
  vertex(610, 450); // bottom left
  vertex(590, 430); // left bottom
  vertex(590, 410); // top far left
  endShape();
  
  // core
  fill(#00ECFF);
  beginShape();
  vertex(642, 375); // top left
  vertex(658, 375); // top right
  vertex(670, 387); // right top
  vertex(670, 403); // right bottom
  vertex(658, 415); // bottom right
  vertex(642, 415); // bottom left
  vertex(630, 403); // left bottom
  vertex(630, 387); // left top
  vertex(642, 375); // top left
  endShape();
  
 // wheel thingies?
 
  // middle
  fill(150);
  rect(590, 470, 120, 60);
  fill(120);
  rect(590, 485, 120, 30);
  
  // wheels
  fill(200);
  circle(590, 500, 60);
  circle(710, 500, 60);
  fill(150);
  circle(590, 500, 30);
  circle(710, 500, 30);
  
 // arm
 
  // pincer
  fill(200);
  beginShape();
  vertex(428, 445); // top left
  vertex(448, 445); // top right
  vertex(463, 460); // right top
  vertex(463, 480); // right bottom
  vertex(448, 495); // bottom right
  vertex(428, 495); // bottom left
  vertex(448, 475); // middle right
  vertex(433, 460); // middle top
  vertex(413, 480); // left bottom
  vertex(413, 460); // left top
  vertex(428, 445); // top left
  endShape();
  
  // arm
  fill(150);
  rect(560, 388, 40, 14);
  fill(200);
  rect(520, 385, 40, 20);
  pushMatrix();
  pushMatrix();
  translate(520, 405);
  rotate(radians(135));
  rect(0, 0, 40, 20);
  popMatrix();
  fill(150);
  translate(489, 430);
  rotate(radians(135));
  rect(0, 0, 40, 14);
  popMatrix();
  fill(200);
  circle(514, 395, 20);

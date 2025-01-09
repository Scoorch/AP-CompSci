void block(
PImage tex, // texture
float tX,   // x position
float tY,   // y position
float tZ,   // z position
float rX,   // x rotation
float rY,   // y rotation
float rZ,   // z rotation
float s     // scale
) {
  pushMatrix();
  translate(tX, tY, tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  scale(s);

  noStroke();
  beginShape(QUADS);
  texture(tex);
  //top
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  //bottom
  vertex(-1, 1, -1, 0, 0);
  vertex(1, 1, -1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  //front
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  //back
  vertex(1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex(1, 1, -1, 0, 1);
  //left
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  //right
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();
  popMatrix();
}

void block( // bat body
PImage text,  // top   texture
PImage texbt, // bot   texture
PImage texf,  // front texture
PImage texbk, // back  texture
PImage texl,  // left  texture
PImage texr,  // right texture
float tX,     // x position
float tY,     // y position
float tZ,     // z position
float rX,     // x rotation
float rY,     // y rotation
float rZ,     // z rotation
float s       // scale
) {
  pushMatrix();
  translate(tX, tY, tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  scale(s);

  noStroke();
  beginShape(QUADS);
  texture(text);
  //top
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  endShape();
  //bottom
  beginShape(QUADS);
  texture(texbt);
  vertex(-1, 1, -1, 0, 0);
  vertex(1, 1, -1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  endShape();
  //front
  beginShape(QUADS);
  texture(texf);
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  endShape();
  //back
  beginShape(QUADS);
  texture(texbk);
  vertex(1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex(1, 1, -1, 0, 1);
  endShape();
  //left
  beginShape(QUADS);
  texture(texl);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  //right
  beginShape(QUADS);
  texture(texr);
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();
  popMatrix();
}

void block(color c, float tX, float tY, float tZ, float rX, float rY, float rZ, float s) {
  pushMatrix();
  translate(tX, tY, tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  scale(s);

  noStroke();
  beginShape(QUADS);
  fill(c, 50);
  //top
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  //bottom
  vertex(-1, 1, -1, 0, 0);
  vertex(1, 1, -1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  //front
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  //back
  vertex(1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex(1, 1, -1, 0, 1);
  //left
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  //right
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();
  popMatrix();
}

void batB(
float tX,     // x position
float tY,     // y position
float tZ,     // z position
float rX,     // x rotation
float rY,     // y rotation
float rZ,     // z rotation
float s       // scale
) {
  pushMatrix();
  translate(tX, tY, tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  scale(s);

  noStroke();
  beginShape(QUADS);
  //texture(text);
  fill(70);
  //top
  vertex(-0.1875, -0.3125, -0.125, 0, 0); // .1875 for 3 pixels
  vertex(0.1875, -0.3125, -0.125, 1, 0); // .3125 for 5
  vertex(0.1875, -0.3125, 0.125, 1, 1);
  vertex(-0.1875, -0.3125, 0.125, 0, 1);
  //endShape();
  //bottom
  //beginShape(QUADS);
  //texture(texbt);
  vertex(-0.1875, 0.3125, -0.125, 0, 0);
  vertex(0.1875, 0.3125, -0.125, 1, 0);
  vertex(0.1875, 0.3125, 0.125, 1, 1);
  vertex(-0.1875, 0.3125, 0.125, 0, 1);
  //endShape();
  //front
  //beginShape(QUADS);
  //texture(texf);
  vertex(-0.1875, -0.3125, 0.125, 0, 0);
  vertex(0.1875, -0.3125, 0.125, 1, 0);
  vertex(0.1875, 0.3125, 0.125, 1, 1);
  vertex(-0.1875, 0.3125, 0.125, 0, 1);
  //endShape();
  //back
  //beginShape(QUADS);
  //texture(texbk);
  vertex(0.1875, -0.3125, -0.125, 0, 0);
  vertex(-0.1875, -0.3125, -0.125, 1, 0);
  vertex(-0.1875, 0.3125, -0.125, 1, 1);
  vertex(0.1875, 0.3125, -0.125, 0, 1);
  //endShape();
  //left
  //beginShape(QUADS);
  //texture(texl);
  vertex(-0.1875, -0.3125, -0.125, 0, 0);
  vertex(-0.1875, -0.3125, 0.125, 1, 0);
  vertex(-0.1875, 0.3125, 0.125, 1, 1);
  vertex(-0.1875, 0.3125, -0.125, 0, 1);
  //endShape();
  //right
  //beginShape(QUADS);
  //texture(texr);
  vertex(0.1875, -0.3125, 0.125, 0, 0);
  vertex(0.1875, -0.3125, -0.125, 1, 0);
  vertex(0.1875, 0.3125, -0.125, 1, 1);
  vertex(0.1875, 0.3125, 0.125, 0, 1);
  endShape();
  popMatrix();
}

void batH( // bat head
float tX,     // x position
float tY,     // y position
float tZ,     // z position
float rX,     // x rotation
float rY,     // y rotation
float rZ,     // z rotation
float s       // scale
) {
  pushMatrix();
  translate(tX, tY, tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  scale(s);

  noStroke();
  beginShape(QUADS);
  //texture(text);
  fill(70);
  //top
  vertex(-0.25, -0.1875, -0.125, 0, 0); // .125 for 2 pixels
  vertex(0.25, -0.1875, -0.125, 1, 0); // .25 for 4
  vertex(0.25, -0.1875, 0.125, 1, 1); // .1875 for 3
  vertex(-0.25, -0.1875, 0.125, 0, 1);
  //endShape();
  //bottom
  //beginShape(QUADS);
  //texture(texbt);
  vertex(-0.25, 0.1875, -0.125, 0, 0);
  vertex(0.25, 0.1875, -0.125, 1, 0);
  vertex(0.25, 0.1875, 0.125, 1, 1);
  vertex(-0.25, 0.1875  , 0.125, 0, 1);
  //endShape();
  //front (pointed at viewer)
  //beginShape(QUADS);
  //texture(texf);
  vertex(-0.25, -0.1875, 0.125, 0, 0);
  vertex(0.25, -0.1875, 0.125, 1, 0);
  vertex(0.25, 0.1875, 0.125, 1, 1);
  vertex(-0.25, 0.1875, 0.125, 0, 1);
  //endShape();
  //back
  //beginShape(QUADS);
  //texture(texbk);
  vertex(0.25, -0.1875, -0.125, 0, 0);
  vertex(-0.25, -0.1875, -0.125, 1, 0);
  vertex(-0.25, 0.1875, -0.125, 1, 1);
  vertex(0.25, 0.1875, -0.125, 0, 1);
  //endShape();
  //left
  //beginShape(QUADS);
  //texture(texl);
  vertex(-0.25, -0.1875, -0.125, 0, 0);
  vertex(-0.25, -0.1875, 0.125, 1, 0);
  vertex(-0.25, 0.1875, 0.125, 1, 1);
  vertex(-0.25, 0.1875, -0.125, 0, 1);
  //endShape();
  //right
  //beginShape(QUADS);
  //texture(texr);
  vertex(0.25, -0.1875, 0.125, 0, 0);
  vertex(0.25, -0.1875, -0.125, 1, 0);
  vertex(0.25, 0.1875, -0.125, 1, 1);
  vertex(0.25, 0.1875, 0.125, 0, 1);
  endShape();
  popMatrix();
}

void batW( // bat wing
float tX,     // x position
float tY,     // y position
float tZ,     // z position
float rX,     // x rotation
float rY,     // y rotation
float rZ,     // z rotation
float s       // scale
) {
  pushMatrix();
  translate(tX, tY, tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  scale(s);

  noStroke();
  beginShape(QUADS);
  //texture(text);
  fill(70);
  //top
  vertex(-0.3125, -0.1875, -0.0625, 0, 0); // .3125 for 2 pixels
  vertex(0.3125, -0.1875, -0.0625, 1, 0); // .5 for 4
  vertex(0.3125, -0.1875, 0.0625, 1, 1); // .1875 for 3
  vertex(-0.3125, -0.1875, 0.0625, 0, 1);
  //endShape();
  //bottom
  //beginShape(QUADS);
  //texture(texbt);
  vertex(-0.3125, 0.1875, -0.0625, 0, 0);
  vertex(0.3125, 0.1875, -0.0625, 1, 0);
  vertex(0.3125, 0.1875, 0.0625, 1, 1);
  vertex(-0.3125, 0.1875  , 0.0625, 0, 1);
  //endShape();
  //front (pointed at viewer)
  //beginShape(QUADS);
  //texture(texf);
  vertex(-0.3125, -0.1875, 0.0625, 0, 0);
  vertex(0.3125, -0.1875, 0.0625, 1, 0);
  vertex(0.3125, 0.1875, 0.0625, 1, 1);
  vertex(-0.3125, 0.1875, 0.0625, 0, 1);
  //endShape();
  //back
  //beginShape(QUADS);
  //texture(texbk);
  vertex(0.3125, -0.1875, -0.0625, 0, 0);
  vertex(-0.3125, -0.1875, -0.0625, 1, 0);
  vertex(-0.3125, 0.1875, -0.0625, 1, 1);
  vertex(0.3125, 0.1875, -0.0625, 0, 1);
  //endShape();
  //left
  //beginShape(QUADS);
  //texture(texl);
  vertex(-0.3125, -0.1875, -0.0625, 0, 0);
  vertex(-0.3125, -0.1875, 0.0625, 1, 0);
  vertex(-0.3125, 0.1875, 0.0625, 1, 1);
  vertex(-0.3125, 0.1875, -0.0625, 0, 1);
  //endShape();
  //right
  //beginShape(QUADS);
  //texture(texr);
  vertex(0.3125, -0.1875, 0.0625, 0, 0);
  vertex(0.3125, -0.1875, -0.0625, 1, 0);
  vertex(0.3125, 0.1875, -0.0625, 1, 1);
  vertex(0.3125, 0.1875, 0.0625, 0, 1);
  endShape();
  popMatrix();
}

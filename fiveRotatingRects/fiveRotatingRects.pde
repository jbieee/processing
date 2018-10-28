void setup() {
  size(400, 400);
  background(255);
  noStroke();
  fill(0);
  rectMode(CENTER);
}

float r = 0;

void draw() {
  background(255);

  drawRect(100, 100, 80, 80, r);
  drawRect(100, 300, 10, 10, r * 0.3);
  drawRect(300, 100, 30, 30, r * 1.5);
  drawRect(300, 300, 100, 100, r * 1.2);
  drawRect(width/2, height/2, 150, 150, r * 3.5);

  r += 0.02;
}

void drawRect(float x, float y, float rectW, float rectH, float rotSpeed) {
  resetMatrix();
  translate(x, y);
  rotate(rotSpeed);
  rect(0, 0, rectW, rectH);
}

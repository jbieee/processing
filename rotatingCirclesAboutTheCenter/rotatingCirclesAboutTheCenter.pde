void setup() {
  size(400, 400);
  background(10);
  noStroke();
}

float r = 0;
void draw() {
  translate(width/2, height/2);
  fill(255);
  rotate(r);
  float circleSize = random(5, 15);
  ellipse(100 + r, 10, circleSize, circleSize);
  r += 0.2;
}

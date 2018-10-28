int c = 255;

void setup() {
  size(640, 480);
  background(0);
  frameRate(25);
  noStroke();
  rectMode(CENTER);
}
void draw() {
  fill(c, random(100));

  float sz = random(200);

  rect(random(width), random(height), sz, sz);

  if (frameCount % 200 == 0) {
    c = 255 - c;
  }
  saveFrame("frame-####.tif");

  if (frameCount > 500) {
    exit();
  }
}

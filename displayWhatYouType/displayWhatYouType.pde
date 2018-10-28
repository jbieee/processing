void setup() {
  size(400, 400);
  background(0);
  textSize(100);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
}

void keyPressed() {
  fill(random(256), random(256), random(256));
  text(key, random(300), random(100,400));
}

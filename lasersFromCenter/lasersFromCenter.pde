void setup() {
  frameRate(90);
  background(0);
}

void draw() {
  stroke(random(256), random(256), random(256));
  line(50, 50, random(100), random(100));
}

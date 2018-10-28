void setup() {
  fullScreen();
  background(0);
}

void draw() {
  stroke(random(256), random(256),random(256));
  float distance_left = random(displayWidth);
  line(distance_left, 0, distance_left, displayHeight);
}

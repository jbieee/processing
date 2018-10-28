void setup() {
  size(300, 300);
  background(#04B1CE);
  noFill();
  colorMode(HSB);
}

void draw() {
  strokeWeight(random(3, 10));
  stroke(random(256), 255, 255);
  float rainbow_size = random(200, 270);
  ellipse(150, 300, rainbow_size, rainbow_size);
}

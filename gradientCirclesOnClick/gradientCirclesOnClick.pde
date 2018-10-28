PImage back;

void setup() {
  size(500, 400);
  colorMode(HSB, 100);
  noFill();
  strokeWeight(2);
  background(0);
  back = loadImage("puppy.jpg");
  image(back, 0, 0);
}

void draw() {
}

void mousePressed() {
  drawGradientCircle(int(random(height/2)));
}

void drawGradientCircle(int size) {
  color c1 = color(random(100), 100, 100);
  color c2 = color(random(100), 100, 30);
  
  for(int d = 0; d < size; d++) {
    float n = map(d, 0, size, 0, 1);
    color newc = lerpColor(c1, c2, n);
    stroke(newc);
    ellipse(mouseX, mouseY, d, d);
  }
}

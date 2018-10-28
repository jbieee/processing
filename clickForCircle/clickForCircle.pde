void setup() {
  size(500, 400);
  background(255);
  fill(0);
  noStroke();
}

float[] x = {};
float[] y = {};

void draw() {
  for(int i = 0; i < x.length; i++) {
    ellipse(x[i], y[i], 30, 30);
  }
}

void mousePressed() {
  x = append(x, mouseX);
  y = append(y, mouseY);
}

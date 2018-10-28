void setup() {
  size(500, 400);
  for (int i = 0; i < width; i++) {
    for (int k = 0; k < 120; k++) {
      float r = map(noise(i/80.0, k/80.0, 10.0), 0, 1, 0, 255);
      float g = map(noise(i/80.0, k/80.0, 20.0), 0, 1, 0, 255);
      float b = map(noise(i/80.0, k/80.0, 30.0), 0, 1, 0, 255);
      stroke(r, g, b);
      point(i, k);
    }
  }
}

int x = 0;
int y = 0;
color co;

void draw() {
  co = get(x, y);
  fill(co);
  rect(0, 120, width, 280);
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
}

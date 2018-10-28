void setup() {
  size(500, 400);
  background(255);
  colorMode(HSB, 100);
  strokeWeight(3);
}

float a = 0;
float b = 0;
float co = 0;

void draw() {
  float x0 = map(sin(a), -1, 1, 20, width-20);
  float y0 = map(cos(a), -1, 1, 20, height-20);
  float x1 = map(sin(b), -1, 1, 20, width-20);
  float y1 = map(cos(b), -1, 1, 20, height-20);

  stroke(co, 80, 80, 20);
  line(x0, y0, x1, y1);

  a += 0.02;
  b += 0.05;
  co++;

  if (co > 100) {
    co = 0;
  }
}

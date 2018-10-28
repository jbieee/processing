void setup() {
  size(400, 400);
}

float num = 0;
void draw() {
  background(0);
  stroke(255);

  float x = noise(num) * width;
  float y = noise(num + 0.01) * height;

  line(x, 0, x, height);
  line(0, y, width, y);

  num += 0.02;
}

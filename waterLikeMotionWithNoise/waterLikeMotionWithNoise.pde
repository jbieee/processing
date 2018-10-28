void setup() {
  size(400, 400);
  
  stroke(#1AA298);
}

float time = 0;

void draw() {
  background(255, 255, 0);
  float x = 0;
  
  while (x < width) {
    line(x, 200 + 50 * noise(x/100, time), x, height);
    x++;
  }

  time += 0.02;
}

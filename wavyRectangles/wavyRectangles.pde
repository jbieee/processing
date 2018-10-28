void setup() {
  size(400, 400);
  noStroke();
  background(100, 200, 50);
}

float x = 0;
float y = 0;
float rot = 0;
void draw() {
  x = 0;
  background(100, 200, 50);
  while (x < 8) {
    y = 0;
    while (y < 8) {
      draw_rotating_rectangle(50+x*30, 50+y*30, 16, rot+x+y);
      y++;
    }
    x++;
  }
  rot += 0.05;
}

void draw_rotating_rectangle(float x, float y, float rect_size, float r) {
  translate(x, y);
  rotate(r);
  rect(0, 0, rect_size, rect_size);
  resetMatrix();
}

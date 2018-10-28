size(500, 300);
colorMode(HSB, 10);

float x = 0;
float y = 0;

while (x < width) {
  y = 0;
  while (y < height) {
    float v = sin(x/10+y/20)*sin(y/10);
    float co = map(v, -1, 1, 0, 10);
    stroke(co, 8, 8);
    point(x, y);
    y++;
  }
  x++;
}

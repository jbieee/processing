void setup() {
  size(400, 400);
  background(0);
  colorMode(HSB, 100);
  noStroke();
}

float a = 0;
void draw() {
  float x = map(sin(a)*sin(a*0.8), -1, 1, 0, width);
  float y = map(sin(a+1.5)*sin(a*3.1), -1, 1, 0, height);
  float co = map(sin(a*0.03), -1, 1, 0, 100);
  float sz = map(sin(a*1.7)*sin(a*2.3), -1, 1, 5, 30);
  float bri = map(sin(a*1.3)*sin(a*4.1), -1, 1, 10, 90);
  float hue = map(sin(a*1.1)*sin(a*2.2), -1, 1, 10, 90);
  fill(co, hue, bri);
  ellipse(x, y, sz, sz);

  a += 0.03;
}

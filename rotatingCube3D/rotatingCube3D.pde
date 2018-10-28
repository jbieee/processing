void setup() {
  size(400, 400, P3D);
}

float a = 0;
float r = 0;
void draw() {
  background(0);
  translate(mouseX, mouseY, map(noise(a), 0, 1, -400, 400));
  rotateY(r);
  box(50);
  a += 0.01;
  r += 0.1;
}

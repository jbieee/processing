float k = 1.33;

void setup() {
  size(400, 400);
  background(#129575);
  colorMode(HSB);
  strokeWeight(0.01);
}
void draw() {
  translate(width/2, height/2);
  scale(200, 200);
  float t = frameCount / 20.0;
  float x = cos(k*t) * sin(t);
  float y = cos(k*t) * cos(t); 
  stroke(255);
  point(x, y);
}

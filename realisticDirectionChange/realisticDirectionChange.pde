void setup() {
  size(400, 400);
  background(255);
  colorMode(HSB);
  noFill();
  reset();
}

float oldX;
float oldY;
float a;

void draw() {
  float newX = oldX + cos(a) * 5;
  float newY = oldY + sin(a) * 5;
  line(oldX, oldY, newX, newY);
  oldX = newX;
  oldY = newY;
  a += random(-0.4, 0.4);
  
  if(oldX < 0 || oldX > width || oldY < 0 || oldY > height) {
    reset();
  }
}

void reset() {
  oldX = width/2;
  oldY = height/2;
  a = random(TWO_PI);
}

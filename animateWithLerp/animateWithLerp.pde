void setup() {
  size(500,400);
  fill(255);
  noStroke();
}

float x = 0;
float y = 0;

void draw() {
  background(0);
  ellipse(x, y, 20,20);
  
  x = lerp(x, mouseX, 0.1);
  y = lerp(y, mouseY, 0.1);
}

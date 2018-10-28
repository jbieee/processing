PImage back;

void setup() {
  size(500, 400);
  background(#FF760D);
  noFill();
  stroke(255);
  back = copy();
}

float d = 20;

void draw() {
  background(back);
  ellipse(mouseX, mouseY, d, d);
  
  if(mousePressed) {
    d++;
  }
}

void mouseReleased() {
  back = copy();
  d = 20;
}

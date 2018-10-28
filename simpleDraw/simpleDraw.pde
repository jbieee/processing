void setup() {
  strokeWeight(4);
}

void draw() {
  if(mousePressed) {
    point(mouseX, mouseY);
  }
}

void keyPressed() {
  save("simpleDraw.png");
}

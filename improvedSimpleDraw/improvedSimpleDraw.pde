void setup() {
  fullScreen();
  draw_top_line();
}

void draw() {
  if (mousePressed) {
    point(mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == 's') {
    save("improvedSimpleDraw.png");
  }
  if (key == 'b') {
    background(random(256), random(256), random(256));
    draw_top_line();
  }
  if (key == 'c') {
    stroke(random(256), random(256), random(256));
    draw_top_line();
  }
}

void draw_top_line() {
  strokeWeight(35);
  line(0, 0, width, 0);
  strokeWeight(7);
}

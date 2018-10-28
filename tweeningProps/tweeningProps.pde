color bgcolor;

void setup() {
  size(400, 300);
  colorMode(HSB);
  noStroke();
  fill(random(256), 150, 255);
  bgcolor = color(random(256), 150, 255);
}

float x = 100;
float y = 100;
float sz = 100;
float csw = 2;
float tsw = 2;
float csa = 0;
float tsa = 0;

void draw() {
  background(bgcolor);

  if (dist(x, y, mouseX, mouseY) < sz / 2) {
    tsa = 255;
    if(mousePressed) {
      cursor(MOVE);
      tsw = 10;
      x = lerp(x, mouseX, 0.2);
      y = lerp(y, mouseY, 0.2);
    } else {
      cursor(HAND);
      tsw = 5;
    }
  } else {
    tsa = 0;
    cursor(ARROW);
  }
  csa = lerp(csa, tsa, 0.1);
  stroke(255, csa);
  csw = lerp(csw, tsw, 0.1);
  strokeWeight(csw);
  ellipse(x, y, sz, sz);
}

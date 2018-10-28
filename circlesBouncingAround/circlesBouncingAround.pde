float[] x = {};
float[] y = {};
float[] xSpeed = {};
float[] ySpeed = {};
float[] strokeCo = {};

void setup() {
  size(500, 400);
  colorMode(HSB, 100);
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
  fill(0);

  for (int i = 0; i < x.length; i++) {
    stroke(strokeCo[i], 75, 75);
    ellipse(x[i], y[i], random(30,50), random(30,50));
    x[i] += xSpeed[i];
    y[i] += ySpeed[i];
    if (x[i] > width || x[i] < 1) {
      xSpeed[i] *= -1;
    }
    if (y[i] > height || y[i] < 1) {
      ySpeed[i] *= -1;
    }
  }
}

void mousePressed() {
  x = append(x, mouseX);
  y = append(y, mouseY);
  xSpeed = append(xSpeed, random(5));
  ySpeed = append(ySpeed, random(5));
  strokeCo = append(strokeCo, random(101));
}

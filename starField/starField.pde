float[] x = new float[100];
float[] y = new float[100];
float[] speed = new float[100];

void setup() {
  size(500, 400);
  background(0);

  for (int i = 0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
    speed[i] = random(1, 5);
  }
}

void draw() {
  background(0);
  
  triangle(mouseX, mouseY-6, mouseX, mouseY+6, mouseX+30, mouseY);

  for (int i = 0; i < x.length; i++) {
    float co = map(speed[i], 1, 4, 100, 255);
    stroke(co);
    strokeWeight(speed[i]);
    point(x[i], y[i]);
    x[i] = x[i]-speed[i]/2;
    if (x[i] < 0) {
      x[i] = width;
    }
  }
}

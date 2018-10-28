int numPoints = 300;
int[] x = new int[numPoints];
int[] y = new int[numPoints];
int[] z = new int[numPoints];

void setup() {
  size(500, 400, P3D);
  noFill();
  stroke(0, 155, 0);

  for (int i = 0; i < x.length; i++) {
    x[i] = int(random(-150, 150));
    y[i] = int(random(-150, 150));
    z[i] = int(random(-150, 150));
  }
}
void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(frameCount/100.0);
  box(300);

  for (int i = 0; i < x.length; i++) {
    bezier(0, 150, 0, 0, -150, 0, x[i], y[i], z[i], x[i], y[i], z[i]);
  }
}

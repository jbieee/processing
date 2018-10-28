void setup() {
  size(500, 400);
  noFill();
}
void draw() {
  background(255);
  for (int i = 0; i < 30; i++) {
    float a = frameCount/100.0;
    bezier(
      width/2, height, 
      width/2, noise(1,i,a)*height, 
      noise(2,i,a)*width, noise(3,i,a)*height, 
      noise(4,i,a)*width, noise(5,i,a)*height
      );
  }
}

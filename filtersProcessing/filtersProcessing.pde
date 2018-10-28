//void setup() {
//  size(400, 400);
//  background(0);
//  stroke(255);
//  fill(255);
//  textSize(80);
//}
//void draw() {
//  fill(random(255), random(255), random(255));
//  ellipse(random(width), random(height), 40, 40);
//  filter(BLUR, 2);
//}
void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  fill(255);
  textSize(80);
}
void draw() {
  if(mousePressed) {
    if(keyPressed) {
      fill(255);
    } else {
      fill(0);
    }
    text(char(int(random(65, 90))), mouseX-30, mouseY+40);
  }
  filter(BLUR, 3);
  filter(THRESHOLD);
}

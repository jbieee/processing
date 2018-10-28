void setup() {
  size(500, 400);
  frameRate(10);
}
void draw() {
  background(#2D77EA);
  int secs  = millis()/1000;
  if (secs > 10) {
    exit();
  } else if (secs > 6) {
    scene3();
  } else if (secs > 2) {
    scene2();
  } else {
    scene1();
  }
}

void scene1() {
  ellipse(random(width), random(height), 100, 100);
}
void scene2() {
  rect(random(width), random(height), 100, 100);
}
void scene3() {
  line(random(width), random(height), width/2, height/2);
}

float position_x = random(5, 95);
float position_y = random(5, 95);
float speed_x = random(1, 10);
float speed_y = random(1, 10);
void draw() {
  background(0);
  ellipse(position_x, position_y, 10, 10);
  position_x = position_x + speed_x;
  position_y = position_y + speed_y;
  if(position_x > 95 || position_x < 5) {
    speed_x *= -1;
  }
  if(position_y > 95 || position_y < 5) {
    speed_y *= -1;
  }
}

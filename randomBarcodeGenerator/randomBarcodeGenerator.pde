float position_x = 0;
float line_color = 0;

void setup() {
  background(255);
}

void draw() {
  if (random(100) < 30) {
    change_line_color();
  }

  line(position_x, 25, position_x, 75);
  position_x++;
}

void change_line_color() {
  line_color = line_color == 0 ? 255 : 0;
  stroke(line_color);
}

float x;
PImage photo;

void setup() {
  size(400, 400);
  x = width;
  photo = loadImage("puppy.jpg");
}

void draw() {
  image(photo, x, 0);
  if(x > 0) {
    x--;
  }
}

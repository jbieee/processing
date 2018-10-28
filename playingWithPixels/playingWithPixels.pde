void setup() {
  size(500, 400);
  
  PImage img = loadImage("image.jpg");
  background(img);
  
  loadPixels();
  for(int i = 0; i < pixels.length; i++) {
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
    pixels[i] = color(b, r, g);
  }
  updatePixels();
}

void draw() {
  
}

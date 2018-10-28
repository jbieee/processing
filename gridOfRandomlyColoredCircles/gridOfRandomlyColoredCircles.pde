size(400, 400);
noStroke();
background(random(256), random(256), random(256));

float x = 0;
float y = 0;

while (x < width) {
  y = 0;
  while (y < height) {
    fill(random(256), random(256), random(256));
    ellipse(x + 20, y + 20, 38, 38);
    y += 40;
  }
  x += 40;
}

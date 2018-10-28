float backR = random(0, 100);
float backG = random(0, 100);
float backB = random(0, 100);

void setup() {
  size(400, 400);
  background(backR, backG, backB);
  rectMode(CENTER);
  noStroke();
}

float r = 0;

void draw() {
  fill(backR, backG, backB, 50);
  rect(width/2, height/2, width, height);
  
  translate(mouseX, mouseY);
  rotate(r);
  
  fill(255);
  rect(0, 0, 100, 100);
  
  r += 0.05;
}

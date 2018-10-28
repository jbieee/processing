size(400, 300);
background(#1AA298);
noStroke();

float i = 0;
while (i < 100) {
  fill(random(256));
  rect(230, 10, 50, 5);

  fill(random(256), random(256), random(256));
  rect(280, 10, 10, 5);

  rotate(0.05);
  i++;
}

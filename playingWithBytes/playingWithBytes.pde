byte b[] = loadBytes("puppy.jpg");

size(600, 100);
colorMode(HSB);

for(int i=0; i<b.length; i++) {
  int myhue = b[i] & 0xff;
  stroke(myhue, 255, 255);
  line(i,0,i,height);
}

print(127 & 0xff);

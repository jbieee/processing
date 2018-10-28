class Explore implements Scene {
  PImage backgroundImage;
  float sceneScale = 0.25;
  float mainCharacterX = 25;
  float mainCharacterY = 100;
  float mainCharacterSpeed = 20;
  float enemyX = 1600;
  float enemyY = 400;
  float sunX = -25;
  float sunY = -15;
  float sunSpeed = 0.1;
  MainCharacter mainCharacter = new MainCharacter(mainCharacterX, mainCharacterY, sceneScale);
  Enemy enemy = new RivalEnemy(enemyX, enemyY, sceneScale);
  
  Explore(PImage background) {
    backgroundImage = background;
  }
  
  void play() {
    image(walkMask, 0, 0);
    loadPixels();
    image(backgroundImage, 0, 0);
    drawSun();
    mainCharacter.drawCharacter(mainCharacterX/sceneScale, mainCharacterY/sceneScale);
    enemy.drawCharacter();
  }
  
  void drawSun() {
    image(sun, sunX, sunY);
    sunX += sunSpeed;
    if(sunX < -25 || sunX > width - 25) {
      sunSpeed *= -1;
    }
  }
  
  void handleKeyPress() {
    if(key == 'd') {
      float newPosition = mainCharacterX + 5 + mainCharacterSpeed;
      if(newPosition - enemyX*sceneScale >= 0) {
        initiateBattle(new int[]{0});
      }
      if(!(newPosition > width) && !(red(pixels[int((mainCharacterY+50)*width+newPosition)]) < 50)) {
        mainCharacterX += mainCharacterSpeed;
      }
    } else if (key == 'a') {
      float newPosition = mainCharacterX - 5 - mainCharacterSpeed;
      if(!(newPosition < 5) && !(red(pixels[int((mainCharacterY+50)*width+newPosition)]) < 50)) {
        mainCharacterX -= mainCharacterSpeed;
      }
    } else if (key == 'w') {
      float newPosition = mainCharacterY + 50 - mainCharacterSpeed;
      if(!(newPosition < 0) && !(red(pixels[int(newPosition*width+mainCharacterX)]) < 50)) {
        mainCharacterY -= mainCharacterSpeed;
      }
    } else if (key == 's') {
      float newPosition = mainCharacterY + 50 + mainCharacterSpeed;
      if(!(newPosition > height) && !(red(pixels[int(newPosition*width+mainCharacterX)]) < 50)) {
        mainCharacterY += mainCharacterSpeed;
      }
    }
  }
  
  float getSceneScale() {
    return sceneScale;
  }
}

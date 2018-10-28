ArrayList<Scene> scenes = new ArrayList<Scene>();
int currentScene = 0;
float timedActionProximityTuner = 5.5;
int uiTextPadding = 5;
float uiHeightCenter = 40;
float uiTitleCenter = uiHeightCenter-30;
float desiredFrameRate = 60;
float secondsPerFrame = 1/desiredFrameRate;
PFont gameFont;
PImage exploreScene;
PImage walkMask;
PImage sun;
Transitioner transitioner = new Transitioner();

void setup() {
  size(500, 400);
  frameRate(desiredFrameRate);
  rectMode(CENTER);
  gameFont = createFont("Monospaced.bold", 18, true);
  textFont(gameFont);
  textSize(18);
  textAlign(CENTER, CENTER);
  exploreScene = loadImage("exploreScene.png");
  walkMask = loadImage("walkMask.png");
  sun = loadImage("smallSun.png");
  scenes.add(new Explore(exploreScene));
}

void draw() {
  if (!transitioner.transitioning()) {
    scenes.get(currentScene).play();
  } else {
    transitioner.transition();
  }
}

void initiateBattle(int[] opponentIds) {
  scenes.add(new Battle(opponentIds));
  currentScene++;
}

void endBattle() {
  transitioner.startTransition();
  scenes.remove(currentScene);
  currentScene--;
}

void keyPressed() {
  scenes.get(currentScene).handleKeyPress();
}

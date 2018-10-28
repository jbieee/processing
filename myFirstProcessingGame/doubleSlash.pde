class DoubleSlash implements Attack {
  float smallCircleSize = 100;
  int currentAction = 0;
  String attackName = "Double Slash";
  boolean active = false;
  TimedShapeAction[] actions;
  float maxDamage = 100;
  float damageDealt = 0;
  int numActions = 2;
  float successfulHits = 0;

  DoubleSlash() {
    actions = new TimedShapeAction[numActions];
    actions[0] = new TimedShapeAction(2, smallCircleSize+width/2, smallCircleSize);
    actions[1] = new TimedShapeAction(1.5, smallCircleSize+width/2-50, smallCircleSize);
  }

  void startAttack() {
    active = true;
    damageDealt = 0;
  }

  void attack() {
    pushStyle();
    stroke(0);
    fill(0, 0);
    ellipse(width/2, height/2, smallCircleSize, smallCircleSize);
    actions[currentAction].remainingTime -= secondsPerFrame;
    stroke(0, 0, 255);
    actions[currentAction].currentSize -= actions[currentAction].frameDeltaSizeDecrement;
    ellipse(width/2, height/2, actions[currentAction].currentSize, actions[currentAction].currentSize);
    if (actions[currentAction].remainingTime < 0) {
      nextAction();
    }
    popStyle();
  }

  void nextAction() {
    if (currentAction < actions.length-1 && currentAction+1 == successfulHits) {
      currentAction++;
    } else {
      endAttack();
    }
  }

  void endAttack() {
    for (int i = 0; i < actions.length; i++) {
      actions[i].remainingTime = actions[i].actionTime;
      actions[i].currentSize = actions[i].originalSize;
    }
    damageDealt = maxDamage*(successfulHits/numActions);
    active = false;
    currentAction = 0;
    successfulHits = 0;
  }

  String getAttackName() {
    return attackName;
  }

  float getDamageDealt() {
    return damageDealt;
  }

  boolean isActive() {
    return active;
  }

  void handleKeyPress() {
    if (key == 'f') {
      if (actions[currentAction].currentSize - smallCircleSize < actions[currentAction].frameDeltaSizeDecrement*timedActionProximityTuner) {
        successfulHits++;
      } else {
        endAttack();
      }
    }
  }
}

class CounterAttack implements Defence {
  boolean active = false;
  String defenceName = "Counter Attack";
  String[] options = {"Aggressive", "Sneaky", "Magic"};
  int uiIndicatorIndex = 0;
  boolean defenceCancelled = false;

  void startDefence() {
    active = true;
    uiIndicatorIndex = 0;
    defenceCancelled = false;
  }

  void defend() {
    drawUI();
  }

  void drawUI() {
    pushMatrix();
    pushStyle();
    textSize(18);
    textAlign(CENTER, CENTER);
    fill(0);
    String uiTitle = "Predict Attack";
    text(uiTitle, uiTitle.length()*6+uiTextPadding, uiTitleCenter);
    for (int i = 0; i < options.length; i++) {
      String optionName = options[i];
      float optionNameCenter = (i+1)*(width/(options.length+1));
      if (uiIndicatorIndex == i) {
        float triLeft = optionNameCenter-(optionName.length()*6)-uiTextPadding;
        triangle(triLeft, uiHeightCenter+1, triLeft+6, uiHeightCenter+4, triLeft, uiHeightCenter+7);
      }
      text(options[i], (i+1)*(width/(options.length+1)), uiHeightCenter);
    }
    popStyle();
    popMatrix();
  }

  String getDefenceName() {
    return defenceName;
  }
  
  float getDefenceEffectiveness(String attackType) {
    if(options[uiIndicatorIndex] == attackType) {
      return -0.5;
    } else {
      return 0;
    }
  }

  boolean isActive() {
    return active;
  }
  
  boolean cancelledDefence() {
    return defenceCancelled;
  }

  void handleKeyPress() {
    if (key == 'f') {
      active = false;
    } else if (key == 'a') {
      if (uiIndicatorIndex > 0) {
        uiIndicatorIndex--;
      }
    } else if (key == 'd') {
      if (uiIndicatorIndex < options.length-1) {
        uiIndicatorIndex++;
      }
    } else if (key == 'q') {
      defenceCancelled = true;
      active = false;
    }
  }
}

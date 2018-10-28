class Battle implements  Scene {
  float sceneScale = 1;
  MainCharacter mainCharacter = new MainCharacter(100, 150, sceneScale);
  ArrayList<Enemy> opponents = new ArrayList<Enemy>();
  boolean showAttacks = true;
  boolean showDefenses = false;
  boolean attackDefend = true;
  float damageTaken = 0;
  float damageDealt = 0;
  boolean damageTakenDamageDealt = true;
  Transitioner transitioner = new Transitioner();
  int selectedOpponent = 0;
  int uiIndicatorIndex = 0;

  Battle(int[] opponentIds) {
    opponents.add(new RivalEnemy(400, 150, sceneScale/opponentIds.length));
  }

  void play() {
    background(255);
    drawCharacters();
    if (!transitioner.transitioning()) {
      drawUI();
    } else {
      transitionAttackDefend();
    }
  }

  void drawCharacters() {
    mainCharacter.drawCharacter();
    mainCharacter.drawHealthBar();
    for (int i = 0; i < opponents.size(); i++) {
      opponents.get(i).drawCharacter();
      opponents.get(i).drawHealthBar();
    }
  }

  void drawUI() {
    pushMatrix();
    pushStyle();
    scale(sceneScale);
    fill(0);
    if (showAttacks) {
      String uiTitle = "Select Attack";
      text(uiTitle, uiTitle.length()*6+uiTextPadding, uiTitleCenter);
      for (int i = 0; i < mainCharacter.attacks.length; i++) {
        String attackName = mainCharacter.attacks[i].getAttackName();
        float attackNameCenter = (i+1)*(width/(mainCharacter.attacks.length+1));
        if (uiIndicatorIndex == i) {
          float triLeft = attackNameCenter-(attackName.length()*6)-uiTextPadding;
          triangle(triLeft, uiHeightCenter+1, triLeft+6, uiHeightCenter+4, triLeft, uiHeightCenter+7);
        }
        text(attackName, attackNameCenter, uiHeightCenter);
      }
    } else if (showDefenses) {
      String uiTitle = "Select Defence";
      text(uiTitle, uiTitle.length()*6+uiTextPadding, uiTitleCenter);
      for (int i = 0; i < mainCharacter.defenses.length; i++) {
        String defenceName = mainCharacter.defenses[i].getDefenceName();
        float defenceNameCenter = (i+1)*(width/(mainCharacter.defenses.length+1));
        if (uiIndicatorIndex == i) {
          float triLeft = defenceNameCenter-(defenceName.length()*6)-uiTextPadding;
          triangle(triLeft, uiHeightCenter+1, triLeft+6, uiHeightCenter+4, triLeft, uiHeightCenter+7);
        }
        text(defenceName, defenceNameCenter, uiHeightCenter);
      }
    } else if (mainCharacter.isAttacking()) {
      mainCharacter.attack();
    } else if (mainCharacter.isDefending()) {
      mainCharacter.defend();
    } else {
      toggleAttackDefend();
    }
    popStyle();
    popMatrix();
  }

  void toggleAttackDefend() {
    if (!mainCharacter.cancelledDefence()) {
      if (attackDefend) {
        showAttacks = true;
        Enemy attackingEnemy = opponents.get(selectedOpponent);
        float defenceEffectiveness = 1 - mainCharacter.getDefenceEffectiveness(attackingEnemy.getLastAttackType());
        if (defenceEffectiveness <= 1) {
          damageTaken = attackingEnemy.getDamageDealt() * defenceEffectiveness;
          mainCharacter.takeDamage(damageTaken);
          damageTakenDamageDealt = true;
        } else {
          damageDealt = attackingEnemy.getDamageDealt() * (defenceEffectiveness - 1);
          opponents.get(selectedOpponent).takeDamage(damageDealt);
          damageTakenDamageDealt = false;
        }
      } else {
        showDefenses = true;
        damageDealt = mainCharacter.getDamageDealt();
        opponents.get(selectedOpponent).takeDamage(damageDealt);
        damageTakenDamageDealt = false;
      }
      transitioner.startTransition();
    } else {
      attackDefend = !attackDefend;
      showDefenses = true;
    }
  }

  void transitionAttackDefend() {
    transitioner.transition();
    drawDamageDisplay();
  }

  void drawDamageDisplay() {
    pushMatrix();
    pushStyle();
    if (damageTakenDamageDealt) {
      if (int(damageTaken) != 0) {
        fill(255, 0, 0);
      } else { 
        fill(0);
      }
      if (mainCharacter.isDead()) {
        background(255);
        textSize(32);
        text("YOU LOSE", width/2, height/2-15);
        endBattle();
      } else {
        textSize(24);
        text(int(damageTaken), width/2, height/2+transitioner.transitionCountdown*5-15);
      }
    } else {
      if (int(damageDealt) != 0) {
        fill(0, 255, 0);
      } else { 
        fill(0);
      }
      if (opponents.get(selectedOpponent).isDead()) {
        background(255);
        textSize(32);
        text("YOU WIN", width/2, height/2-15);
        endBattle();
      } else {
        textSize(24);
        text(int(damageDealt), width/2, height/2+transitioner.transitionCountdown*5-15);
      }
    }
    popStyle();
    popMatrix();
  }

  float getSceneScale() {
    return sceneScale;
  }

  void handleKeyPress() {
    if (transitioner.transitioning()) {
      // ignore key press
    } else if (mainCharacter.isAttacking() || mainCharacter.isDefending()) {
      mainCharacter.handleKeyPress();
    } else {
      if (key == 'f') {
        if (attackDefend) {
          mainCharacter.startAttack(uiIndicatorIndex);
          showAttacks = false;
          attackDefend = !attackDefend;
        } else {
          mainCharacter.startDefence(uiIndicatorIndex);
          showDefenses = false;
          attackDefend = !attackDefend;
        }
        uiIndicatorIndex = 0;
      } else if (key == 'a') {
        if (uiIndicatorIndex > 0) {
          uiIndicatorIndex--;
        }
      } else if (key == 'd') {
        if (attackDefend) {
          if (uiIndicatorIndex < mainCharacter.attacks.length-1) {
            uiIndicatorIndex++;
          }
        } else {
          if (uiIndicatorIndex < mainCharacter.defenses.length-1) {
            uiIndicatorIndex++;
          }
        }
      }
    }
  }
}

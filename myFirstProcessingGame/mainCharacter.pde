class MainCharacter implements Character {
  float x;
  float y;
  float sceneScale;
  Attack[] attacks = {new DoubleSlash(), new Whirlwind()};
  int selectedAttack = 0;
  Defence[] defenses = {new Block(), new CounterAttack()};
  int selectedDefence = 0;
  float maxHp = 500;
  float currentHp = maxHp;
  boolean isDead = false;
  
  MainCharacter(float x, float y, float scale) {
    this.x = x;
    this.y = y;
    this.sceneScale = scale;
  }
  
  void drawCharacter() {
    pushMatrix();
    pushStyle();
    scale(sceneScale);
    stroke(0, 0);
    // head
    fill(#ffcd94);
    rect(x, y-20, 50, 50);
    // eyes
    fill(0);
    ellipse(x-12.5, y-10.5-20, 10, 10);
    ellipse(x+12.5, y-10.5-20, 10, 10);
    // mouth
    stroke(0);
    bezier(x-12.5, y+12.5-20, x-12.5, y+20.5-20, x+12.5, y+20.5-20, x+12.5, y+12.5-20);
    stroke(0, 0);
    //torso
    fill(#2C528E);
    rect(x, y+75-20, 60, 90);
    //legs
    fill(#152E55);
    rect(x-17, y+170-20, 22, 90);
    rect(x+17, y+170-20, 22, 90);
    //arms shirt
    fill(#2C528E);
    rect(x-42, y+65-20, 15, 48);
    rect(x+42, y+65-20, 15, 48);
    //arms bare
    fill(#ffcd94);
    rect(x-42, y+112-20, 15, 48);
    rect(x+42, y+112-20, 15, 48);
    popStyle();
    popMatrix();
  }
  
  void drawCharacter(float x, float y) {
    pushMatrix();
    pushStyle();
    scale(sceneScale);
    stroke(0, 0);
    // head
    fill(#ffcd94);
    rect(x, y-20, 50, 50);
    // eyes
    fill(0);
    ellipse(x-12.5, y-10.5-20, 10, 10);
    ellipse(x+12.5, y-10.5-20, 10, 10);
    // mouth
    stroke(0);
    bezier(x-12.5, y+12.5-20, x-12.5, y+20.5-20, x+12.5, y+20.5-20, x+12.5, y+12.5-20);
    stroke(0, 0);
    //torso
    fill(#2C528E);
    rect(x, y+75-20, 60, 90);
    //legs
    fill(#152E55);
    rect(x-17, y+170-20, 22, 90);
    rect(x+17, y+170-20, 22, 90);
    //arms shirt
    fill(#2C528E);
    rect(x-42, y+65-20, 15, 48);
    rect(x+42, y+65-20, 15, 48);
    //arms bare
    fill(#ffcd94);
    rect(x-42, y+112-20, 15, 48);
    rect(x+42, y+112-20, 15, 48);
    popStyle();
    popMatrix();
  }
  
  void drawHealthBar() {
    pushMatrix();
    pushStyle();
    scale(sceneScale);
    stroke(0, 0);
    fill(255, 0, 0);
    float fullHpWidth = 100;
    rect(x, y-50-20, fullHpWidth, 5);
    fill(0, 255, 0);
    float currentHpWidth = fullHpWidth*(currentHp/maxHp);
    float currentHpWidthOffset = (fullHpWidth-currentHpWidth)/2;
    rect(x-currentHpWidthOffset, y-50-20, currentHpWidth, 5);
    popStyle();
    popMatrix();
  }
  
  void startAttack(int attackIndex) {
    selectedAttack = attackIndex;
    attacks[selectedAttack].startAttack();
  }
  
  void attack() {
    attacks[selectedAttack].attack();
  }
  
  boolean isAttacking() {
    return attacks[selectedAttack].isActive();
  }
  
  void startDefence(int defenceIndex) {
    selectedDefence = defenceIndex;
    defenses[selectedDefence].startDefence();
  }
  
  void defend() {
    defenses[selectedDefence].defend();
  }
  
  boolean isDefending() {
    return defenses[selectedDefence].isActive();
  }
  
  void takeDamage(float dmgAmount) {
    currentHp -= dmgAmount;
    if(currentHp <= 0) {
      isDead = true;
    }
  }
  
  float getDamageDealt() {
    return attacks[selectedAttack].getDamageDealt();
  }
  
  float getDefenceEffectiveness(String attackType) {
    return defenses[selectedDefence].getDefenceEffectiveness(attackType);
  }
  
  boolean cancelledDefence() {
    return defenses[selectedDefence].cancelledDefence();
  }
  
  boolean isDead() {
    return isDead;
  }
  
  void handleKeyPress() {
    if(isAttacking()) {
      attacks[selectedAttack].handleKeyPress();
    } else if(isDefending()) {
      defenses[selectedDefence].handleKeyPress();
    }
  }
}

interface Character {
  void drawCharacter();
  void drawHealthBar();
  void takeDamage(float dmgAmount);
  void attack();
  boolean cancelledDefence();
  float getDamageDealt();
  float getDefenceEffectiveness(String attackType);
  boolean isDead();
}

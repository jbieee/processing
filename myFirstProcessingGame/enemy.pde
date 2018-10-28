interface Enemy {
  void drawCharacter();
  void drawHealthBar();
  void takeDamage(float dmgAmount);
  float getDamageDealt();
  String getLastAttackType();
  boolean isDead();
}

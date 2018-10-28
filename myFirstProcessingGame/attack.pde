interface Attack {
  void startAttack();
  String getAttackName();
  void handleKeyPress();
  boolean isActive();
  void attack();
  void endAttack();
  float getDamageDealt();
}

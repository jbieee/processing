interface Defence {
  void startDefence();
  void defend();
  void handleKeyPress();
  String getDefenceName();
  float getDefenceEffectiveness(String attackType);
  boolean isActive();
  boolean cancelledDefence();
}

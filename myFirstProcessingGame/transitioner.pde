class Transitioner {
  float transitionCountdownSeconds = 1.5;
  boolean transitioning = false;
  float transitionCountdown = transitionCountdownSeconds;
  
  Transitioner() {  }
  
  Transitioner(float transitionSeconds) {
    transitionCountdownSeconds = transitionSeconds;
    transitionCountdown = transitionSeconds;
  }
  
  void startTransition() {
    transitioning = true;
  }
  
  void transition() {
    transitionCountdown -= secondsPerFrame;
    if (transitionCountdown < 0) {
      transitioning = false;
      transitionCountdown = transitionCountdownSeconds;
    }
  }
  
  boolean transitioning() {
    return transitioning;
  }
}

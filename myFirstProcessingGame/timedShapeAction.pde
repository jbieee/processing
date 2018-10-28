class TimedShapeAction {
  float actionTime;
  float remainingTime;
  float originalSize;
  float currentSize;
  float frameDeltaSizeDecrement;
  
  TimedShapeAction(float time, float size, float referenceShapeSize) {
    actionTime = time;
    remainingTime = time;
    originalSize = size;
    currentSize = size;
    
    frameDeltaSizeDecrement = ((size-referenceShapeSize)/time)/desiredFrameRate;
  }
}

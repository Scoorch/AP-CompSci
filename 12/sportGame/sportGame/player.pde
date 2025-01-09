class FPlayer extends FGameCircle {

  FPlayer(boolean p) {
    super(50);
    if (p) {
      setPosition(width*.2-width*.525, height*.6-100-height/2);
    } else {
      setPosition(width*.8+width*.025-width/2, height*.6-100-height/2);
    }

    setStroke(0);
    setFill(255);

    setRestitution(.5);
    setRotatable(false);
    setDensity(0.1);
  }
}

class FGameBox extends FBox {

  FGameBox(float tempX, float tempY) {
    super(tempX, tempY);
  }
  
  void act() {
    
  }

  String isTouching(String ground) {
    ArrayList<FContact> contactList = getContacts();
    for (int i = 0; i < contactList.size(); i ++) {
      FContact fc = contactList.get(i);
      if (fc.contains(ground)) return "ground";
    }
    return "ground";
  }
}

class FGameCircle extends FCircle {

  FGameCircle(float temp) {
    super(temp);
  }

  boolean isTouching(String type) {
    ArrayList<FContact> contactList = getContacts();
    for (int i = 0; i < contactList.size(); i ++) {
      FContact fc = contactList.get(i);
      if (fc.contains(type)) {
        return true;
      }
    }
    return false;
  }
}

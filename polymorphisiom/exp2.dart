class Event {
  void clickEvent() {}
}

class mouse extends Event {
  void clickEvent() {
    print("mouse event clicked ");
  }
}

class keyboard extends Event {
  void clickEvent() {
    print("keyboard event clicked ");
  }
}

void main() {
  var mouseobj = mouse();
  var keyboardobj = keyboard();

  mouseobj.clickEvent();
  keyboardobj.clickEvent();
}

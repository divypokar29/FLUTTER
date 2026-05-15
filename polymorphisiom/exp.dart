class parent {
  void display() {
    print("this is a parent class !! ");
  }
}

class child extends parent {
  void display() {
    super.display();
    print("this is a child class !! ");
  }
}

void main() {
  var obj = child();
  obj.display();
}

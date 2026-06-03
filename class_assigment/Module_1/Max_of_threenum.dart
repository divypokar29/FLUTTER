import 'dart:io';

void main() {
  int A = 100;
  int B = 105;
  int C = 60;

  if (A > B) {
    if (A > C) {
      print("$A is greter");
    } else {
      print("$C is greter");
    }
  } else {
    if (B > C) {
      print("$B is greter");
    } else {
      print("$C is greter");
    }
  }
}

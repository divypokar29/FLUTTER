import 'dart:io';

void main() {
  int? marks;

  print("Enter your marks : ");
  marks = int.parse(stdin.readLineSync()!);

  if (marks >= 0 && marks <= 100) {
    if (marks >= 70) {
      print("grade = A");
    } else if (marks >= 60 && marks < 70) {
      print("grade = B");
    } else if (marks >= 50 && marks < 60) {
      print("grade = C");
    } else if (marks >= 40 && marks < 50) {
      print("grade = A");
    } else {
      print("grade = fail!");
    }
  } else {
    print("Invalid marks!");
  }
}

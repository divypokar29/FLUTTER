import 'dart:io';

void main() {
  List<int> numberList = [];

  int num;

  for (int i = 1; i <= 5; i++) {
    print("Enter a number : ");
    num = int.parse(stdin.readLineSync()!);

    numberList.add(num);
  }

  for (var num in numberList) {
    print(num);
  }
}

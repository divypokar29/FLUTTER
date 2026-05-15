import 'dart:io';

void main() {
  List<int> numberList = [];

  int num, i = 0;
  int chois = 0;

  while (chois != 1) {
    print("Enter a number : ");
    num = int.parse(stdin.readLineSync()!);
    numberList.add(num);
    i++;

    print("Do you want to add more numbers ? Enter 1 for no and 0 for yes");
    chois = int.parse(stdin.readLineSync()!);
  }

  print(numberList);
}

import 'dart:io';

void main() {
  List<int> arr = [];
  int i, max;
  int temp;

  for (i = 0; i < 10; i++) {
    stdout.write("Enter element ${i + 1}: ");
    temp = int.parse(stdin.readLineSync()!);
    arr.add(temp);
  }

  max = arr[0];
  for (i = 1; i < 10; i++) {
    if (arr[i] > max) {
      max = arr[i];
    }
  }

  print("Max number is: $max");
}

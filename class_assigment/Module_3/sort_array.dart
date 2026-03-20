import 'dart:io';

void main() {
  List<int> arr = [];
  int i, j, temp, num;

  for (i = 0; i < 5; i++) {
    stdout.write("Enter element ${i + 1}: ");
    num = int.parse(stdin.readLineSync()!);
    arr.add(num);
  }

  for (i = 0; i < 5; i++) {
    for (j = i + 1; j < 5; j++) {
      if (arr[i] > arr[j]) {
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }

  print("Sorted array: ");
  for (i = 0; i < 5; i++) {
    stdout.write("${arr[i]} ");
  }
}

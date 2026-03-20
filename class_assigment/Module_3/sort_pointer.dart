import 'dart:io';

void sortArray(List<int> arr) {
  int i, j, temp;
  for (i = 0; i < 5; i++) {
    for (j = i + 1; j < 5; j++) {
      if (arr[i] > arr[j]) {
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
}

void main() {
  List<int> arr = List.filled(5, 0);
  int i;

  for (i = 0; i < 5; i++) {
    stdout.write("Enter element ${i + 1}: ");
    arr[i] = int.parse(stdin.readLineSync()!);
  }

  // Passing array acts like passing pointer in logic
  sortArray(arr);

  print("Sorted array: ");
  for (i = 0; i < 5; i++) {
    stdout.write("${arr[i]} ");
  }
}

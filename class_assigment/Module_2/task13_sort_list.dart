import 'dart:io';

List<int> sortAscending(List<int> list) {
  List<int> arr = List.from(list);
  int n = arr.length;

  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp   = arr[j];
        arr[j]     = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

List<int> sortDescending(List<int> list) {
  List<int> arr = List.from(list);
  int n = arr.length;

  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] < arr[j + 1]) {
        int temp   = arr[j];
        arr[j]     = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

void main() {
  print('========================================');
  print('     List Sorter (No Built-in Sort)     ');
  print('========================================\n');

  stdout.write('How many integers do you want to enter? ');
  int? count = int.tryParse(stdin.readLineSync() ?? '');

  if (count == null || count <= 0) {
    print('Error: Please enter a valid positive integer!');
    return;
  }

  List<int> numbers = [];
  print('\nEnter $count integer(s) one by one:\n');

  for (int i = 1; i <= count; i++) {
    stdout.write('  Number $i: ');
    int? num = int.tryParse(stdin.readLineSync() ?? '');
    if (num == null) {
      print('  Error: Invalid integer. Retrying...');
      i--;
      continue;
    }
    numbers.add(num);
  }

  List<int> ascending  = sortAscending(numbers);
  List<int> descending = sortDescending(numbers);

  print('\n========================================');
  print('  Original   : ${numbers.join(', ')}');
  print('  Ascending  : ${ascending.join(', ')}');
  print('  Descending : ${descending.join(', ')}');
  print('  (Using Bubble Sort algorithm)');
  print('========================================');
}

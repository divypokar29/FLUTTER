import 'dart:io';

Map<String, double> findMinMax(List<double> numbers) {
  double min = numbers[0];
  double max = numbers[0];

  for (double num in numbers) {
    if (num < min) min = num;
    if (num > max) max = num;
  }

  return {'min': min, 'max': max};
}

void main() {
  print('========================================');
  print('       Min & Max Finder Program         ');
  print('========================================\n');

  stdout.write('How many numbers do you want to enter? ');
  String? countInput = stdin.readLineSync();
  int? count = int.tryParse(countInput ?? '');

  if (count == null || count <= 0) {
    print('Error: Please enter a valid positive integer!');
    return;
  }

  List<double> numbers = [];

  print('\nEnter $count number(s) one by one:\n');

  for (int i = 1; i <= count; i++) {
    stdout.write('  Number $i: ');
    String? input = stdin.readLineSync();
    double? num = double.tryParse(input ?? '');

    if (num == null) {
      print('  Error: "$input" is not a valid number. Retrying...');
      i--;
      continue;
    }

    numbers.add(num);
  }

  Map<String, double> result = findMinMax(numbers);

  print('\n========================================');
  print('  Numbers Entered : ${numbers.join(', ')}');
  print('  Largest Number  : ${result['max']}');
  print('  Smallest Number : ${result['min']}');
  print('========================================');
}

import 'dart:io';

const double pi = 3.141592653589793;

double calculateArea(double radius) {
  return pi * radius * radius;
}

double calculateCircumference(double radius) {
  return 2 * pi * radius;
}

void main() {
  print('========================================');
  print('     Circle Calculator Program          ');
  print('========================================\n');
  print('Using Pi = $pi\n');

  stdout.write('Enter the radius of the circle: ');
  String? input = stdin.readLineSync();

  double? radius = double.tryParse(input ?? '');

  if (radius == null || radius <= 0) {
    print('Error: Please enter a valid positive number for radius!');
    return;
  }

  double area          = calculateArea(radius);
  double circumference = calculateCircumference(radius);

  print('\n========================================');
  print('  Radius        : $radius units');
  print('  Area          : ${area.toStringAsFixed(4)} square units');
  print('  Circumference : ${circumference.toStringAsFixed(4)} units');
  print('========================================');
}

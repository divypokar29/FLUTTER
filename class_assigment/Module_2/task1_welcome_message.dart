import 'dart:io';

void main() {
  print('========================================');
  print('       Welcome Message Program          ');
  print('========================================\n');

  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();

  if (name == null || name.trim().isEmpty) {
    print('Error: Name cannot be empty!');
    return;
  }

  stdout.write('Enter your age: ');
  String? ageInput = stdin.readLineSync();

  int? age = int.tryParse(ageInput ?? '');
  if (age == null || age <= 0) {
    print('Error: Please enter a valid age!');
    return;
  }

  if (age >= 100) {
    print('\nWelcome, ${name.trim()}!');
    print('Wow! You are $age years old — you have already reached or surpassed 100!');
    return;
  }

  int yearsLeft = 100 - age;

  print('\n========================================');
  print('  Welcome, ${name.trim()}!');
  print('  You are $age years old.');
  print('  You have $yearsLeft year(s) left until you turn 100!');
  print('========================================');
}

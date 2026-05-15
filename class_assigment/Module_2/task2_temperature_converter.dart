import 'dart:io';

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

void main() {
  print('========================================');
  print('       Temperature Converter            ');
  print('========================================\n');

  bool continueProgram = true;

  while (continueProgram) {
    print('Select conversion type:');
    print('  1. Celsius  → Fahrenheit');
    print('  2. Fahrenheit → Celsius');
    print('  3. Exit');
    stdout.write('\nEnter your choice (1/2/3): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('\nEnter temperature in Celsius: ');
        String? input = stdin.readLineSync();
        double? celsius = double.tryParse(input ?? '');

        if (celsius == null) {
          print('Error: Please enter a valid number!\n');
        } else {
          double fahrenheit = celsiusToFahrenheit(celsius);
          print('\n  $celsius °C  =  ${fahrenheit.toStringAsFixed(2)} °F\n');
        }
        break;

      case '2':
        stdout.write('\nEnter temperature in Fahrenheit: ');
        String? input = stdin.readLineSync();
        double? fahrenheit = double.tryParse(input ?? '');

        if (fahrenheit == null) {
          print('Error: Please enter a valid number!\n');
        } else {
          double celsius = fahrenheitToCelsius(fahrenheit);
          print('\n  $fahrenheit °F  =  ${celsius.toStringAsFixed(2)} °C\n');
        }
        break;

      case '3':
        print('\nThank you for using the Temperature Converter. Goodbye!');
        continueProgram = false;
        break;

      default:
        print('Invalid choice! Please enter 1, 2, or 3.\n');
    }

    if (continueProgram && choice != '3') {
      print('----------------------------------------');
    }
  }
}

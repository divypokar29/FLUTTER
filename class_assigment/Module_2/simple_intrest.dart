import 'dart:math';
import 'dart:io';

void main() {
  double P, R, T, SI, CI;

  stdout.write("Enter Principal: ");
  P = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Rate: ");
  R = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Time: ");
  T = double.parse(stdin.readLineSync()!);

  // Simple Interest
  SI = (P * R * T) / 100;

  // Compound Interest
  CI = P * pow((1 + R / 100), T) - P;

  print("\nSimple Interest = ${SI.toStringAsFixed(2)}");
  print("Compound Interest = ${CI.toStringAsFixed(2)}");
}

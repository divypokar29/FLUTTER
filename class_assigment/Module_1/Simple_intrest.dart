import 'dart:io';

void main() {
  double p = 1000, r = 10, t = 1;
  print("Principal : $p");
  print("Rate      : $r");
  print("Time      : $t");
  print("Interest  : ${(p * r * t) / 100}");
}
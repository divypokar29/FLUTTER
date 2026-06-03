import 'dart:io';

void main() {
  int a = 10, b = 20;
  print("Before: a=$a, b=$b");
  a = a + b;
  b = a - b;
  a = a - b;
  print("After : a=$a, b=$b");
}

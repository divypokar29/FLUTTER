import 'dart:io';

void concatenate(String s1, String s2) {
  print("Concatenated String: $s1$s2");
}

void main() {
  String str1, str2;
  stdout.write("Enter first string: ");
  str1 = stdin.readLineSync()!;
  
  stdout.write("Enter second string: ");
  str2 = stdin.readLineSync()!;

  // Dart doesn't have pointers, using normal concatenation
  concatenate(str1, str2);
}

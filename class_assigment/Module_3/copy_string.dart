import 'dart:io';

void copyString(String str1) {
  String str2 = str1;
  print("Original String: $str1");
  print("Copied String: $str2");
}

void main() {
  String str1;
  stdout.write("Enter a string: ");
  str1 = stdin.readLineSync()!;
  
  copyString(str1);
}

import 'dart:async';
import 'dart:io';

void main() {
  Map<String, dynamic> user = {};
  String key;
  String value;
  for (int i = 0; i <= 3; i++) {
    print("Enter a fieldname :");
    key = stdin.readLineSync()!;
    print("Enter a value :");
    value = stdin.readLineSync()!;

    user[key] = value;
  }
  print(user);
}

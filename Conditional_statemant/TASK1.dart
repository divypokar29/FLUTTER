/*
TV PRice : 25000/-
ac price : 56000/-
mobile price : 15000/-

*/

import 'dart:io';

void main() {
  int mobile = 15000;
  int ac = 56000;
  int tv = 25000;

  int qt_tv, qt_ac, qt_mobile;
  String pro_name;

  print("Enter product name : ");
  pro_name = stdin.readLineSync()!;

  if (pro_name == "TV") {
    print("Product = TV");
    print("Enter quantity : ");
    qt_tv = int.parse(stdin.readLineSync()!);
    if (qt_tv != 0) {
      print("Total amount = ${qt_tv * tv}");
    }
  } else if (pro_name == "AC") {
    print("Product = AC");
    print("Enter quantity : ");
    qt_ac = int.parse(stdin.readLineSync()!);
    if (qt_ac != 0) {
      print("Total amount = ${qt_ac * ac} ");
    }
  } else if (pro_name == "mobile") {
    print("Product = mobile");
    print("Enter quantity : ");
    qt_mobile = int.parse(stdin.readLineSync()!);
    if (qt_mobile != 0) {
      print("Total amount = ${qt_mobile * mobile}");
    }
  }
}

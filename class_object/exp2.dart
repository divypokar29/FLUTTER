import 'dart:async';
import 'dart:io';

class BankAccount {
  String? userName;
  int? amount = 0;

  void openaccount() {
    print("Enterr your name : ");
    userName = stdin.readLineSync()!;
    print("Enter amount : ");
    amount = int.parse(stdin.readLineSync()!);
    print("Account open successfully");
  }

  void withDraw(int withDrawamount) {
    amount = amount! - withDrawamount;

    print(
      "Successfuly withdraw Rs. ${withDrawamount} and your account balance is Rs. ${amount}",
    );
  }

  void deposit(int depositamount) {
    amount = amount! + depositamount;

    print(
      "Successfuly deposit Rs. ${depositamount} and your account balance is Rs. ${amount}",
    );
  }
}

void main() {
  BankAccount bobj = BankAccount();

  bobj.openaccount();
  int choice = 0;

  print("Chose a option");

  print("Enter 1 for withdraw");
  print("Enter 2 for deposite");
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      print("Enter withdraw amount :");
      int amt = int.parse(stdin.readLineSync()!);
      bobj.withDraw(amt);
      break;

    case 2:
      print("Enter deposite amount :");
      int amat = int.parse(stdin.readLineSync()!);
      bobj.deposit(amat);
      break;
  }
}

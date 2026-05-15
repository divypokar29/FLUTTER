import 'dart:io';

class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount) {
    if (amount <= 0) {
      print('  Error: Deposit amount must be greater than zero!');
      return;
    }
    balance += amount;
    print('  ✔ Deposited: \$${amount.toStringAsFixed(2)}');
    print('  New Balance: \$${balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('  Error: Withdrawal amount must be greater than zero!');
      return;
    }
    if (amount > balance) {
      print('  ✘ Insufficient funds! Overdraft not allowed.');
      print('  Available Balance: \$${balance.toStringAsFixed(2)}');
      return;
    }
    balance -= amount;
    print('  ✔ Withdrawn: \$${amount.toStringAsFixed(2)}');
    print('  New Balance: \$${balance.toStringAsFixed(2)}');
  }

  void checkBalance() {
    print('\n  ┌─────────────────────────────────────┐');
    print('  │         Account Summary             │');
    print('  ├─────────────────────────────────────┤');
    print('  │  Account No. : $accountNumber');
    print('  │  Holder      : $accountHolder');
    print('  │  Balance     : \$${balance.toStringAsFixed(2)}');
    print('  └─────────────────────────────────────┘\n');
  }
}

void main() {
  print('========================================');
  print('          Bank Account System           ');
  print('========================================\n');

  BankAccount account = BankAccount('ACC-20240001', 'Divy Patel', 5000.00);

  print('  Account created with initial balance: \$5000.00\n');

  bool running = true;

  while (running) {
    print('Select an option:');
    print('  1. Check Balance');
    print('  2. Deposit');
    print('  3. Withdraw');
    print('  4. Exit');
    stdout.write('\nEnter choice (1-4): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        account.checkBalance();
        break;

      case '2':
        stdout.write('\n  Enter deposit amount: \$');
        double? amount = double.tryParse(stdin.readLineSync() ?? '');
        if (amount == null) {
          print('  Error: Invalid amount!\n');
        } else {
          account.deposit(amount);
        }
        print('');
        break;

      case '3':
        stdout.write('\n  Enter withdrawal amount: \$');
        double? amount = double.tryParse(stdin.readLineSync() ?? '');
        if (amount == null) {
          print('  Error: Invalid amount!\n');
        } else {
          account.withdraw(amount);
        }
        print('');
        break;

      case '4':
        print('\nThank you for using the Bank System. Goodbye!');
        running = false;
        break;

      default:
        print('  Invalid choice! Please enter 1 to 4.\n');
    }

    if (running) print('----------------------------------------');
  }
}

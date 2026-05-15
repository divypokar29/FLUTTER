class Bank {
  //data members
  double _balance = 5000;

  double get viewbalance {
    return _balance;
  }

  set Balance(double amt) {
    if (amt > 0) {
      _balance = amt;
    } else {
      print("Invalid amount");
    }
  }
}

void main() {
  Bank bobj = Bank();
  print("your balance is : ${bobj.viewbalance}");
  bobj.Balance = 10000;
  print("your balance is : ${bobj.viewbalance}");
}

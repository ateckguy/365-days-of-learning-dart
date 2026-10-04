class BankAccount {
  String _owner = "";
  double _balance = 0;

  BankAccount(String owner, double balance) {
    this.owner = owner;
    this.balance = balance;
  }

  String get owner => _owner;

  set owner(String name) {
    if (name.isEmpty) {
      print("Name must be provided.");
    } else {
      _owner = name;
    }
  }

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      print("Balance can not be negative.");
    } else {
      _balance = value;
    }
  }

  double payIn(double value) {
    if (value <= 0) {
      print("Amount must be greater than 0.");
      return _balance;
    }

    _balance += value;
    print("Payed in $value Euros.");
    return _balance;
  }

  double withdraw(double value) {
    if (value > _balance) {
      print("Insufficient funds.");
      return _balance;
    }

    _balance -= value;
    print("Withdrawn $value Euros.");
    return _balance;
  }
}

void main() {
  final bankAccount1 = BankAccount("", -5.0);

  bankAccount1.payIn(500);
  bankAccount1.withdraw(250.64);

  print(bankAccount1.owner);
  print(bankAccount1.balance.toStringAsFixed(2));
}

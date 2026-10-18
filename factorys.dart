class Account {
  String status;

  Account(this.status);

  // Named Constructor
  Account.active() : status = "Active";
  Account.blocked() : status = "Blocked";
  Account.suspended() : status = "Suspended";

  // Factory Constructor
  factory Account.fromStatus(String status) {
    String newStatus = status.toLowerCase();

    if (newStatus == "active") {
      return Account.active();
    } else if (newStatus == "blocked") {
      return Account.blocked();
    } else if (newStatus == "suspended") {
      return Account.suspended();
    } else {
      return Account(status);
    }
  }
}

void main() {
  var a1 = Account.active();
  var a2 = Account.blocked();

  var a3 = Account.fromStatus("active");
  var a4 = Account.fromStatus("blocked");
  var a5 = Account.fromStatus("pending");

  var a6 = Account.fromStatus("ACTIVE");
  var a7 = Account.fromStatus("Active");
  var a8 = Account.fromStatus("aCtIvE");

  print(a1.status);
  print(a2.status);
  print(a3.status);
  print(a4.status);
  print(a5.status);

  print(a6.status);
  print(a7.status);
  print(a8.status);
}

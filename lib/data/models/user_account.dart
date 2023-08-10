import 'package:flutter/material.dart';

import 'user.dart';

class UserAccount extends ChangeNotifier {
  double acctBalance;
  String acctNumber;
  bool cardActivated;
  User user;
  UserAccount(
      {required this.acctBalance,
      required this.acctNumber,
      required this.cardActivated,
      required this.user});
}

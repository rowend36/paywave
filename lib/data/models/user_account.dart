import 'package:flutter/material.dart';

import 'user.dart';

class UserAccount extends ChangeNotifier {
  String acctNumber;
  User? user;
  UserAccount({required this.acctNumber, this.user});
}

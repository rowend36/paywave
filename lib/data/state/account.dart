import 'package:flutter/material.dart';
import '../models/account_details.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel? _accountModel;

  AccountModel? get accountModel => _accountModel;

  void setAccountModel(AccountModel model) {
    _accountModel = model;
    notifyListeners();
  }
}

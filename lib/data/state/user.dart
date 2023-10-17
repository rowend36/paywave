import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _userModel;

  User? get userModel => _userModel;

  void setUserModel(User model) {
    _userModel = model;

    notifyListeners();
  }
}

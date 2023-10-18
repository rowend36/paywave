import 'package:flutter/material.dart';

class User {
  final String? name;
  final String? id;
  final String? email;
  final String? phoneNumber;
  final String? photoURL;
  const User(
      {required this.email,
      required this.id,
      this.name,
      this.phoneNumber,
      this.photoURL});

  getInitials() {
    if (name == null) {
      return "";
    } else {
      var parts = name!.split(" ");
      return parts.first[0].toUpperCase() + parts.last[0].toUpperCase();
    }
  }
}

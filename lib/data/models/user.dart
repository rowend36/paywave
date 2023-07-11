import 'package:flutter/material.dart';

class User {
  final String name;
  final String displayName;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String photoURL;
  const User(
      {required this.name,
      required this.displayName,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.photoURL});
  get initials {
    return firstName[0] + lastName[0];
  }
}

typedef CurrentUser = ValueNotifier<User?>;

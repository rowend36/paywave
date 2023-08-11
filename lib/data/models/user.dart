import 'package:flutter/material.dart';

class User {
  final String firstName;
  final String id;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? photoURL;
  const User(
      {required this.email,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      this.photoURL});
  get initials {
    return firstName[0] + lastName[0];
  }

  get name {
    return "$firstName $lastName";
  }

  get displayName => name;
}

typedef CurrentUser = ValueNotifier<User?>;

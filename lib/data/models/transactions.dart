import 'package:flutter/material.dart';

class TransactionItem {
  final DateTime timestamp;
  final String title;
  final String description;
  final bool isDebit;
  const TransactionItem(
      {required this.title,
      required this.description,
      required this.timestamp,
      this.isDebit = true});
}

class TransactionList extends ChangeNotifier {
  final List<TransactionItem> transactions = [];
  final bool isLoading = false;
}

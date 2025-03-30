import 'package:flutter/material.dart';

class Transaction {
  final Icon icon;
  final TransactionType type;
  final double amount;
  final String description;

  Transaction({
  required this.icon,
  required this.type,
  required this.amount,
  required this.description,
  });
}

enum TransactionType {
  expense,
  income,
}
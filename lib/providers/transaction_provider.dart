import 'package:flutter/material.dart';
import 'package:smart_business_hub/mobile/screens/balance/model/transaction.dart';

class TransactionProvider extends ChangeNotifier {
 final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;
  double getTotalIncomes(){
    return _transactions
    .where((transaction) => transaction.type == TransactionType.income)
    .map((transactions) => transactions.amount)
    .fold(0,(a, b) => a + b);
  }
  double getTotalExpenses(){
    return _transactions
    .where((transaction) => transaction.type == TransactionType.expense)
    .map((transactions) => transactions.amount)
    .fold(0,(a, b) => a - b);
  }
  double getBalance(){
    return getTotalIncomes() + getTotalExpenses();
  }
  void addTranscation( Transaction transaction ) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
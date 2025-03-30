import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_business_hub/providers/transaction_provider.dart';
import 'package:smart_business_hub/mobile/screens/balance/model/transaction.dart';

class TransaccionList extends StatelessWidget {
  const TransaccionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;
    
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface
        ),
        child: ListView.builder(
          itemCount: transactions.length, 
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          
          final icon = transaction.type == TransactionType.income
          ? Icon(
            FontAwesomeIcons.moneyBill1,
            color: Theme.of(context).colorScheme.onSecondary,
            )
          : Icon(
            FontAwesomeIcons.moneyBill1,
            color: Theme.of(context).colorScheme.secondary,
            );
          final type = transaction.type == TransactionType.income
           ? 'Income' 
           : 'Expense';
          final value = transaction.type == TransactionType.expense
           ? '-\$${transaction.amount.toStringAsFixed(2)}'
           : '\$${transaction.amount.toStringAsFixed(2)}';
          final color = transaction.type == TransactionType.expense
           ? Theme.of(context).colorScheme.secondary
           : Theme.of(context).colorScheme.onSecondary;
          
          return ListTile(
            leading: icon,
            title: Text(transaction.description),
            subtitle: Text(type),
            trailing: Text(value, style: TextStyle(fontSize: 14, color: color),),
            
          );
        },
        ),
      ),
    );
  }
}
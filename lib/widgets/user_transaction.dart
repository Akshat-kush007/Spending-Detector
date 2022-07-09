import 'package:flutter/material.dart';
import 'package:spending_detector/widgets/new_transaction.dart';
import 'package:spending_detector/widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'Doodh', amount: 30.00, date: DateTime.now()),
    Transaction(id: 't1', title: 'Doodh', amount: 30.00, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    Transaction tx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          NewTransaction(_addTransaction),
          TransactionList(_userTransaction),
        ],
      );
  }
}

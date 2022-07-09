import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/user_transaction.dart';
import 'models/transaction.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context,
    builder: (builderContext){
      return NewTransaction(_addTransaction);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Spending Detector'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: ()=> _startAddNewTransaction(context),
                icon: const Icon((Icons.add)),
              )
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> _startAddNewTransaction(context),
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Card(
                color: Colors.blue,
                child: Text("Chart"),
              ),
              TransactionList(_userTransaction),
            ],
          ),
        ),
      );
  }
}

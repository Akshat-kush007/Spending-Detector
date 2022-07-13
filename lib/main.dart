import 'package:flutter/material.dart';
import '../widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          buttonColor: Colors.green,
          primarySwatch: Colors.purple,
          fontFamily: 'Opensans',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'QuickSand',
              // // fontWeight: FontWeight.bold,
              // fontSize: 16,
            ),
          ),
        ),
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransaction = [];

  void _addTransaction(String txTitle, double txAmount, DateTime date) {
    Transaction tx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: date,
    );
    setState(() {
      _userTransaction.add(tx);
    });
  }
  void _deleteTransaction(String id){
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id==id);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  List<Transaction> get _thisWeekTransactions{
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
          ),
        );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    // Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Spending Detector',
          ),
          // centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: const Icon((Icons.add)),
            )
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_thisWeekTransactions),
            // const Card(
            //   color: Colors.blue,
            //   child: Text("Chart"),
            // ),
            TransactionList(_userTransaction,_deleteTransaction),
          ],
        ),
      ),
    );
  }
}

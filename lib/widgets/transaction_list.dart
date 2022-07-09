import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  TransactionList(this._userTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 270,
      child: ListView.builder(
        itemCount: _userTransaction.length,
        itemBuilder: (context,index){
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Text(
                    '\u{20B9} ${_userTransaction[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userTransaction[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('yMMMMd').format(_userTransaction[index].date),
                          style: TextStyle(
                              // overflow: TextOverflow.ellipsis,
                              color: Colors.grey),
                        )
                      ]),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

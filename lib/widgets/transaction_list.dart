import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function _delete;
  TransactionList(this._userTransaction,this._delete);

  // double height=size.height;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          // color: Colors.grey[400],
          height: height*(0.65),
          child: _userTransaction.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text(
                      'No Transactions Found!',
                      style: TextStyle(fontSize: 20),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.grey[400],
                      height: 250,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: _userTransaction.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\u{20B9}${_userTransaction[index].amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          _userTransaction[index].title,
                          style: TextStyle(
                            // fontFamily: 'OpenSans'
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('yMMMMd')
                              .format(_userTransaction[index].date),
                          style: TextStyle(
                              // overflow: TextOverflow.ellipsis,
                              color: Colors.grey),
                        ),
                        trailing: IconButton(
                          onPressed: ()=> _delete(_userTransaction[index].id as String),
                          icon: Icon(Icons.delete)),
                      ),

                      // child: Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      //       padding: EdgeInsets.all(10),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(5),
                      //         border: Border.all(
                      //           color: Theme.of(context).primaryColor),
                      //       ),
                      //       child: Text(
                      //         '\u{20B9} ${_userTransaction[index].amount.toStringAsFixed(2)}',
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Theme.of(context).primaryColor,
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               _userTransaction[index].title,
                      //               style: TextStyle(
                      //                 // fontFamily: 'OpenSans'
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),
                      //             Text(
                      //               DateFormat('yMMMMd').format(_userTransaction[index].date),
                      //               style: TextStyle(
                      //                   // overflow: TextOverflow.ellipsis,
                      //                   color: Colors.grey),
                      //             )
                      //           ]),
                      //     ),
                      //   ],
                      // ),
                    );
                  }),
        ),
      ],
    );
  }
}

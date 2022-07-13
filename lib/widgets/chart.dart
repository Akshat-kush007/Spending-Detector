import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';
import 'package:spending_detector/widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> currentTransactions;
  Chart(this.currentTransactions);

  List<Map<String, Object>> get groupListTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;
      for (int i = 0; i < currentTransactions.length; i++) {
        if (currentTransactions[i].date.day == weekday.day &&
            currentTransactions[i].date.month == weekday.month &&
            currentTransactions[i].date.year == weekday.year) {
          totalSum += currentTransactions[i].amount;
        }
      }
      print(' Weekday : ${DateFormat.E().format(weekday)}');
      print(' Total : $totalSum \n');
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get spendingThisWeek {
    return groupListTransactions.fold(0.0, (value, item) {
      return value += item['amount'] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Card(
      elevation: 6,
      child: Container(
        height: height*(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupListTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                title: data['day'] as String,
                amount: data['amount'] as double,
                persentage: spendingThisWeek == 0.0
                    ? 0.0
                    : (data['amount'] as double) / spendingThisWeek,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

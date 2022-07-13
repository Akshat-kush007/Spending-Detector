import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String title;
  final double amount;
  final double persentage;
  ChartBar({required this.title, required this.amount,required this.persentage});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
        height : height*(0.03),
        child: FittedBox(child: Text('\u{20B9} ${amount}',style: TextStyle(fontSize: 5),)),),
      SizedBox(
        height: height*(0.01),
      ),
      Container(
        height: height*(0.1),
        width: 10,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
            ),
            FractionallySizedBox(
              heightFactor: persentage,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: height*(0.02),
      ),
      Container(
        height: height*(0.03),
        child: FittedBox(child: Text(title)))
    ]);
  }
}

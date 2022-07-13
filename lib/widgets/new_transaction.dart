import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  var _selectedDate = DateTime.now();

  void addTx() {
    String title = titleControler.text;
    if(double.tryParse(amountControler.text) == null ){
      return;
    }
    double amount = double.parse(amountControler.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    print(title);
    print(amount);
    print(_selectedDate);
    widget.addTransaction(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            SizedBox(height: 40,),
          TextField(
            decoration: InputDecoration(label: Text("Title")),
            controller: titleControler,
            onSubmitted: (_) => addTx(),
          ),
          TextField(
            decoration: InputDecoration(label: Text("Amount")),
            keyboardType: TextInputType.number,
            controller: amountControler,
            onSubmitted: (_) => addTx(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? 'No Selected date yet!'
                    : DateFormat.yMd().format(_selectedDate),
                    style: TextStyle(fontSize: 16),
              ),
              FlatButton(
                onPressed: _openDatePicker,
                child: Text(
                  "Chooes a Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {Navigator.of(context).pop();},
                    child: Text("Cancle",style: TextStyle(fontSize: 16),),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        primary: Colors.grey[700]),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: addTx,
                  child: Text("Add"),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

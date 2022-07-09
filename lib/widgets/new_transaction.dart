import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  void addTx() {
  String title=titleControler.text;
  double amount=double.parse(amountControler.text);
  if(title.isEmpty || amount <=0 ){
    return;
  }
  print(title);
  print(amount);
  widget.addTransaction(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
         
          TextField(
            decoration: InputDecoration(label: Text("Amount")),
            keyboardType: TextInputType.number,
            controller: amountControler,
            onSubmitted: (_)=> addTx(),
          ),
           TextField(
            decoration: InputDecoration(label: Text("Title")),
            controller: titleControler,
            // onSubmitted: (_)=> addTx(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: addTx,
              child: Text("Add"),
              style: ElevatedButton.styleFrom(primary: Colors.purple),
            ),
          ),
        ]),
      ),
    );
  }
}

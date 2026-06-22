import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Models/Transaction_model.dart';
import 'package:flutter/material.dart';

class TrangectionCard extends StatefulWidget {
  String? title;
  double? amount;
  String? category;
  String? date;
  String? payment_method;
  String? note;

   TrangectionCard({
    super.key,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.note,
    required this.payment_method,
  });

  @override
  State<TrangectionCard> createState() => _TrangectionCardState();
}

class _TrangectionCardState extends State<TrangectionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xffffffff),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.green[100],
                child: Icon(Icons.shopping_bag_outlined, size: 40),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.title}", style: TextStyle(fontSize: 15)),
                  Text("${widget.date}", style: TextStyle(fontSize: 12)),
                ],
              ),
              Text("+${widget.amount}", style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}

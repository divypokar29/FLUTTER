import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Screens/Update_Transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  String? title;
  double? amount;
  String? type;
  String? category;
  String? date;
  String? payment_method;
  String? note;

  TransactionCard({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    required this.note,
    required this.payment_method,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateTransaction()),
            ),
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor:
                      widget.type == "Income"
                          ? Colors.green.shade100
                          : Colors.red.shade100,
                  child: Icon(
                    widget.type == "Income"
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: widget.type == "Income" ? Colors.green : Colors.red,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title ?? "",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.date ?? "",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                Text(
                  "${widget.type == "Income" ? "+" : "-"}${widget.amount}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.type == "Income" ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

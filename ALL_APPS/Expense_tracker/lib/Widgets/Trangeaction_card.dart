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
          shadowColor: Colors.black26,
          color: Theme.of(context).cardColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          child: Container(
            height: 95,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor:
                      widget.type == "Income"
                          ? const Color(0xffDCFCE7)
                          : const Color(0xffFEE2E2),
                  child: Icon(
                    widget.type == "Income"
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color:
                        widget.type == "Income"
                            ? const Color(0xff10B981)
                            : Colors.redAccent,
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
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.date ?? "",
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  "${widget.type == "Income" ? "+" : "-"}${widget.amount}",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color:
                        widget.type == "Income"
                            ? const Color(0xff10B981)
                            : Colors.redAccent,
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

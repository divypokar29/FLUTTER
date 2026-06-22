class TransactionModel {
  int? id;
  String? title;
  double? amount;
  String? category;
  String? date;
  String? payment_method;
  String? note;

  TransactionModel({
    this.id,
    this.title,
    this.amount,
    this.category,
    this.date,
    this.payment_method,
    this.note,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'amount': amount,
      'category': category,
      'date': date,
      'payment_method': payment_method,
      'note': note,
    };
    return map;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
        id: map['id'] as int?,
      title: map['title']?.toString(),
      amount: (map['amount'] as num?)?.toDouble(), // <-- Fix
      category: map['category']?.toString(),
      date: map['date']?.toString(),
      payment_method: map['payment_method']?.toString(),
      note: map['note']?.toString(),
    );
  }
}

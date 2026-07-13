class TrangeactionModel {
  int? id;
  String? title;
  double? amount;
  String? type;
  String? category;
  String? date;
  String? payment_method;
  String? note;

  TrangeactionModel({
    this.id,
    this.title,
    this.amount,
    this.type,
    this.category,
    this.date,
    this.payment_method,
    this.note,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'amount': amount,
      'type': type,
      'category': category,
      'date': date,
      'payment_method': payment_method,
      'note': note,
    };
    return map;
  }

  factory TrangeactionModel.fromJson(Map<String, dynamic> map) {
    return TrangeactionModel(
      id: map['id'] as int?,
      title: map['title']?.toString(),
      amount: (map['amount'] as num?)?.toDouble(), // <-- Fix
      type: map["type"],
      category: map['category']?.toString(),
      date: map['date']?.toString(),
      payment_method: map['payment_method']?.toString(),
      note: map['note']?.toString(),
    );
  }
}

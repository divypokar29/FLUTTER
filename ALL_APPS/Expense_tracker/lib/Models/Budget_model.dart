class BudgetModel {
  int? id;
  double budget;

  BudgetModel({
    this.id,
    required this.budget,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'budget': budget,
    };
  }
}
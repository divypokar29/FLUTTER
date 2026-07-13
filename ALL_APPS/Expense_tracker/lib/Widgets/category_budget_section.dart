import 'package:flutter/material.dart';
import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Constants/categories.dart';

class CategoryBudget {
  final String category;
  final double spent;
  final double budget;

  CategoryBudget({
    required this.category,
    required this.spent,
    required this.budget,
  });

  double get progress => budget > 0 ? (spent / budget).clamp(0, 1) : 0;
  double get remaining => budget - spent;
  bool get hasBudget => budget > 0;
}

class CategoryBudgetSection extends StatefulWidget {
  const CategoryBudgetSection({super.key});

  @override
  State<CategoryBudgetSection> createState() => CategoryBudgetSectionState();
}

class CategoryBudgetSectionState extends State<CategoryBudgetSection> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<CategoryBudget> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    reload();
  }

  Future<void> reload() async {
    setState(() => _loading = true);

    final budgetRows = await _dbHelper.getAllCategoryBudgets();
    final expenses = await _dbHelper.getExpenseByCategory();

    // Map of category -> budget, from whatever is saved in DB
    final Map<String, double> budgetMap = {
      for (var row in budgetRows)
        row['category'] as String: (row['budget'] as num).toDouble(),
    };

    // ✅ Loop over ALL expense categories, not just ones with a saved budget
    List<CategoryBudget> list =
        AppCategories.expenseCategories.map((category) {
          final budget = budgetMap[category] ?? 0.0;
          final spent = expenses[category] ?? 0.0;
          return CategoryBudget(
            category: category,
            spent: spent,
            budget: budget,
          );
        }).toList();

    if (mounted) {
      setState(() {
        _items = list;
        _loading = false;
      });
    }
  }

  Color _progressColor(double progress) {
    if (progress < 0.7) return const Color(0xff10b981);
    if (progress < 0.9) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Budget by Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._items.map((item) {
              final color = _progressColor(item.progress);
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.category,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          item.hasBudget
                              ? "₹ ${item.spent.toStringAsFixed(0)} / ₹ ${item.budget.toStringAsFixed(0)}"
                              : "₹ ${item.spent.toStringAsFixed(0)} spent",
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: item.progress,
                        minHeight: 10,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation(
                          item.hasBudget ? color : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.hasBudget
                          ? (item.remaining >= 0
                              ? "Remaining: ₹ ${item.remaining.toStringAsFixed(0)}"
                              : "Over by: ₹ ${(-item.remaining).toStringAsFixed(0)}")
                          : "No budget set",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:
                            item.hasBudget
                                ? (item.remaining >= 0
                                    ? const Color(0xff10b981)
                                    : Colors.red)
                                : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

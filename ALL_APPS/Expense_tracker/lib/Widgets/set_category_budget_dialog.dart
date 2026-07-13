import 'package:expense_tracker/Constants/categories.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Database/Database_helper.dart';

class SetCategoryBudgetDialog extends StatefulWidget {
  final VoidCallback onSaved;

  const SetCategoryBudgetDialog({super.key, required this.onSaved});

  @override
  State<SetCategoryBudgetDialog> createState() =>
      _SetCategoryBudgetDialogState();
}

class _SetCategoryBudgetDialogState extends State<SetCategoryBudgetDialog> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final TextEditingController _amountController = TextEditingController();

  final List<String> _categories = AppCategories.expenseCategories;

  String? _selectedCategory;
  bool _saving = false;

  Future<void> _loadExistingBudget(String category) async {
    final budget = await _dbHelper.getBudget(category);
    _amountController.text = budget > 0 ? budget.toStringAsFixed(0) : '';
  }

  Future<void> _save() async {
    if (_selectedCategory == null || _amountController.text.trim().isEmpty) {
      return;
    }

    setState(() => _saving = true);

    final amount = double.tryParse(_amountController.text.trim()) ?? 0.0;
    await _dbHelper.insertBudget(_selectedCategory!, amount);

    setState(() => _saving = false);

    if (mounted) {
      Navigator.of(context).pop();
      widget.onSaved();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xfff8fafc),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Set Category Budget",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items:
                    _categories
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                onChanged: (value) async {
                  setState(() => _selectedCategory = value);
                  if (value != null) await _loadExistingBudget(value);
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter amount",
                  labelText: "Budget",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saving ? null : _save,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xff10b981),
                  ),
                  child:
                      _saving
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                          : const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

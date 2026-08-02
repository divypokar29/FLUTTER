import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker/Database/Database_helper.dart';

class MonthlyData {
  final String label;
  double income;
  double expense;

  MonthlyData({required this.label, this.income = 0, this.expense = 0});
}

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Map<String, double> _expenseByCategory = {};
  List<MonthlyData> _monthlyData = [];
  bool _loading = true;

  final List<Color> _categoryColors = [
    const Color(0xff10b981),
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.redAccent,
    Colors.teal,
    Colors.indigo,
    Colors.brown,
  ];

  final List<String> _monthNames = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);

    final expenseMap = await _dbHelper.getExpenseByCategory();
    final rawMonthly = await _dbHelper.getMonthlyIncomeExpenseRaw();

    // Build monthly income/expense map
    final Map<String, MonthlyData> monthMap = {};
    for (var row in rawMonthly) {
      final month = int.tryParse(row['month'].toString()) ?? 1;
      final year = row['year'].toString();
      final type = row['type'].toString();
      final total = (row['total'] as num).toDouble();

      final key = "$year-$month";
      final label = "${_monthNames[month]} $year";

      monthMap.putIfAbsent(key, () => MonthlyData(label: label));

      if (type == "Income") {
        monthMap[key]!.income += total;
      } else {
        monthMap[key]!.expense += total;
      }
    }

    final sortedKeys = monthMap.keys.toList()..sort();

    if (mounted) {
      setState(() {
        _expenseByCategory = expenseMap;
        _monthlyData = sortedKeys.map((k) => monthMap[k]!).toList();

        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Reports",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff10b981),
      ),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                onRefresh: _loadData,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      "Expense by Category",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    _buildPieChartCard(),
                    const SizedBox(height: 28),
                    Text(
                      "Income vs Expense (Monthly)",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    _buildBarChartCard(),
                  ],
                ),
              ),
    );
  }

  Widget _buildPieChartCard() {
    if (_expenseByCategory.isEmpty) {
      return Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Text(
              "No expense data yet.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      );
    }

    final categories = _expenseByCategory.keys.toList();
    final total = _expenseByCategory.values.fold(0.0, (a, b) => a + b);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  centerSpaceColor: Theme.of(context).cardColor,
                  sections: List.generate(categories.length, (i) {
                    final value = _expenseByCategory[categories[i]]!;
                    final percent = total > 0 ? (value / total * 100) : 0;
                    return PieChartSectionData(
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                        width: 1,
                      ),
                      color: _categoryColors[i % _categoryColors.length],
                      value: value,
                      title: "${percent.toStringAsFixed(0)}%",
                      radius: 70,
                      titleStyle: Theme.of(context).textTheme.bodySmall,
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: List.generate(categories.length, (i) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _categoryColors[i % _categoryColors.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(categories[i], style: const TextStyle(fontSize: 12)),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChartCard() {
    final now = DateTime.now();
    final currentLabel = "${_monthNames[now.month]} ${now.year}";

    
    final selected = _monthlyData.firstWhere(
      (m) => m.label == currentLabel,
      orElse: () => MonthlyData(label: currentLabel),
    );

    final rawMax =
        [selected.income, selected.expense].reduce((a, b) => a > b ? a : b) *
        1.3;
    final double chartMaxY = rawMax == 0 ? 100.0 : rawMax;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text(currentLabel, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),

            SizedBox(
              height: 260,
              child: BarChart(
                BarChartData(
                  maxY: chartMaxY,
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 45,
                        interval: chartMaxY / 3,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            _formatAxisValue(value),
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).hintColor,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final label =
                              value.toInt() == 0 ? "Income" : "Expense";
                          final amount =
                              value.toInt() == 0
                                  ? selected.income
                                  : selected.expense;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  label,
                                  style: (Theme.of(
                                        context,
                                      ).textTheme.bodyMedium)
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "₹ ${amount.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        reservedSize: 56,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: chartMaxY / 3,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Theme.of(context).dividerColor,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: selected.income,
                          color: const Color(0xff10b981),
                          width: 55,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: selected.expense,
                          color: Colors.redAccent,
                          width: 55,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatAxisValue(double value) {
    if (value >= 100000) {
      return "${(value / 100000).toStringAsFixed(1)}L";
    } else if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(0)}k";
    }
    return value.toStringAsFixed(0);
  }
}

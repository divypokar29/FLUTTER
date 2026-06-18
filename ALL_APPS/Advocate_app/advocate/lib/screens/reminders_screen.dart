import 'package:advocate/utils/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../utils/app_provider.dart';
import '../utils/app_strings.dart';

import '../models/models.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (_, provider, __) {
      final all = <Map<String, dynamic>>[];
      for (final c in provider.clients)
        for (final r in c.reminders)
          all.add({'r': r, 'c': c});
      all.sort((a, b) => (a['r'] as ReminderEntry).date.compareTo((b['r'] as ReminderEntry).date));
      final upcoming = all.where((m) => !(m['r'] as ReminderEntry).isDone).toList();
      final done = all.where((m) => (m['r'] as ReminderEntry).isDone).toList();

      return Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(title: Text(AppStrings.get('reminders'))),
        body: all.isEmpty
            ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.alarm_off_rounded, color: AppTheme.textHint, size: 64),
                const SizedBox(height: 12),
                Text(AppStrings.get('no_reminders'), style: const TextStyle(color: AppTheme.textHint)),
              ]))
            : ListView(padding: const EdgeInsets.fromLTRB(16, 16, 16, 30), children: [
                if (upcoming.isNotEmpty) ...[
                  _Header(label: 'Upcoming / आने वाले', color: AppTheme.gold),
                  const SizedBox(height: 10),
                  ...upcoming.map((m) => _RCard(r: m['r'], c: m['c'], provider: provider)),
                  const SizedBox(height: 20),
                ],
                if (done.isNotEmpty) ...[
                  _Header(label: 'Done / पूरे हुए', color: AppTheme.textHint),
                  const SizedBox(height: 10),
                  ...done.map((m) => _RCard(r: m['r'], c: m['c'], provider: provider)),
                ],
              ]),
      );
    });
  }
}

class _Header extends StatelessWidget {
  final String label; final Color color;
  const _Header({required this.label, required this.color});
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 3, height: 16, color: color, margin: const EdgeInsets.only(right: 8)),
    Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: 0.3)),
  ]);
}

class _RCard extends StatelessWidget {
  final ReminderEntry r; final Client c; final AppProvider provider;
  const _RCard({required this.r, required this.c, required this.provider});
  @override
  Widget build(BuildContext context) {
    final overdue = !r.isDone && r.date.isBefore(DateTime.now().subtract(const Duration(days: 1)));
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: overdue ? AppTheme.red.withOpacity(0.3) : AppTheme.divider),
      ),
      child: Row(children: [
        Container(width: 42, height: 42,
          decoration: BoxDecoration(
            color: r.isDone ? AppTheme.textHint.withOpacity(0.1) : overdue ? AppTheme.red.withOpacity(0.12) : AppTheme.goldFade,
            borderRadius: BorderRadius.circular(10)),
          child: Icon(r.isDone ? Icons.check_rounded : Icons.alarm_rounded,
            color: r.isDone ? AppTheme.textHint : overdue ? AppTheme.red : AppTheme.gold, size: 20)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(r.message, style: TextStyle(color: r.isDone ? AppTheme.textHint : AppTheme.textPrimary,
            decoration: r.isDone ? TextDecoration.lineThrough : null, fontSize: 14)),
          const SizedBox(height: 2),
          Row(children: [
            const Icon(Icons.person_rounded, size: 12, color: AppTheme.textHint),
            const SizedBox(width: 4),
            Text(c.name, style: const TextStyle(color: AppTheme.textSecond, fontSize: 12)),
          ]),
          Text(DateFormat('dd MMM yyyy').format(r.date),
            style: TextStyle(color: overdue ? AppTheme.red : AppTheme.textHint, fontSize: 11)),
          if (overdue) const Text('⚠ Overdue', style: TextStyle(color: AppTheme.red, fontSize: 11, fontWeight: FontWeight.w600)),
        ])),
        Checkbox(value: r.isDone, onChanged: (v) { r.isDone = v ?? false; provider.updateClient(c); }),
      ]),
    );
  }
}

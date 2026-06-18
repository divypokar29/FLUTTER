import 'package:advocate/utils/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_provider.dart';
import '../utils/app_strings.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (_, provider, __) {
      return Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(title: Text(AppStrings.get('settings'))),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          // Language card
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _CardHeader(icon: Icons.language_rounded, label: AppStrings.get('language')),
            const SizedBox(height: 16),
            _LangTile(flag: '🇮🇳', title: 'हिंदी', subtitle: 'Hindi', selected: provider.language == AppLanguage.hindi,
              onTap: () => provider.setLanguage(AppLanguage.hindi)),
            const Divider(color: AppTheme.divider, height: 1),
            _LangTile(flag: '🇬🇧', title: 'English', subtitle: 'English', selected: provider.language == AppLanguage.english,
              onTap: () => provider.setLanguage(AppLanguage.english)),
            const Divider(color: AppTheme.divider, height: 1),
            _LangTile(flag: '🇮🇳', title: 'ગુજરાતી', subtitle: 'Gujarati', selected: provider.language == AppLanguage.gujarati,
              onTap: () => provider.setLanguage(AppLanguage.gujarati)),
          ])),

          const SizedBox(height: 16),

          // Stats card
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _CardHeader(icon: Icons.bar_chart_rounded, label: 'App Info'),
            const SizedBox(height: 16),
            _InfoRow(label: 'Total Clients', value: '${provider.clients.length}'),
            _InfoRow(label: 'Active Cases', value: '${provider.clients.where((c) => c.caseStatus == "active").length}'),
            _InfoRow(label: 'Total Documents', value: '${provider.clients.fold(0, (s, c) => s + c.documents.length)}'),
            _InfoRow(label: 'Pending Reminders', value: '${provider.allUpcomingReminders.length}'),
          ])),

          const SizedBox(height: 16),

          // About card
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _CardHeader(icon: Icons.balance_rounded, label: 'About'),
            const SizedBox(height: 14),
            const Text('Advocate Client Manager', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 16)),
            const SizedBox(height: 4),
            const Text('Real Estate Lawyer App', style: TextStyle(color: AppTheme.gold, fontSize: 13)),
            const SizedBox(height: 4),
            const Text('Version 1.0.0  •  All data saved locally on your device.', style: TextStyle(color: AppTheme.textHint, fontSize: 12)),
          ])),
        ]),
      );
    });
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.divider)),
    child: child,
  );
}

class _CardHeader extends StatelessWidget {
  final IconData icon; final String label;
  const _CardHeader({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 34, height: 34, decoration: BoxDecoration(color: AppTheme.goldFade, borderRadius: BorderRadius.circular(9)),
      child: Icon(icon, color: AppTheme.gold, size: 17)),
    const SizedBox(width: 10),
    Text(label, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 15)),
  ]);
}

class _LangTile extends StatelessWidget {
  final String flag, title, subtitle; final bool selected; final VoidCallback onTap;
  const _LangTile({required this.flag, required this.title, required this.subtitle, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8),
    child: Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Row(children: [
      Text(flag, style: const TextStyle(fontSize: 22)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(color: selected ? AppTheme.gold : AppTheme.textPrimary, fontWeight: FontWeight.w600, fontSize: 15)),
        Text(subtitle, style: const TextStyle(color: AppTheme.textHint, fontSize: 12)),
      ])),
      if (selected) Container(width: 22, height: 22,
        decoration: BoxDecoration(color: AppTheme.goldFade, borderRadius: BorderRadius.circular(11), border: Border.all(color: AppTheme.gold)),
        child: const Icon(Icons.check_rounded, color: AppTheme.gold, size: 14)),
    ])),
  );
}

class _InfoRow extends StatelessWidget {
  final String label, value;
  const _InfoRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: const TextStyle(color: AppTheme.textSecond, fontSize: 13)),
      Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(color: AppTheme.goldFade, borderRadius: BorderRadius.circular(6)),
        child: Text(value, style: const TextStyle(color: AppTheme.gold, fontWeight: FontWeight.w700, fontSize: 13))),
    ]),
  );
}

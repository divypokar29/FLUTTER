import 'package:expense_tracker/Services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Database/Database_helper.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "More",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff10b981),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          _sectionTitle("Preferences"),
          _menuTile(context, Icons.category_outlined, "Manage Categories", () {
            _comingSoon(context, "Manage Categories");
          }),
          _menuTile(context, Icons.currency_rupee, "Currency", () {
            _comingSoon(context, "Currency");
          }),
          _darkModeTile(),

          _sectionTitle("Data"),
          _menuTile(
            context,
            Icons.file_download_outlined,
            "Export Data (CSV/PDF)",
            () {
              _comingSoon(context, "Export Data");
            },
          ),
          _menuTile(context, Icons.backup_outlined, "Backup & Restore", () {
            _comingSoon(context, "Backup & Restore");
          }),
          _menuTile(context, Icons.repeat, "Recurring Transactions", () {
            _comingSoon(context, "Recurring Transactions");
          }),
          _menuTile(
            context,
            Icons.delete_outline,
            "Clear All Data",
            () => _confirmClearData(context),
            color: Colors.red,
          ),

          _sectionTitle("Security"),
          _menuTile(context, Icons.lock_outline, "App Lock", () {
            _comingSoon(context, "App Lock");
          }),
          _menuTile(context, Icons.notifications_outlined, "Budget Alerts", () {
            _comingSoon(context, "Budget Alerts");
          }),

          _sectionTitle("About"),
          _menuTile(context, Icons.star_outline, "Rate the App", () {
            _comingSoon(context, "Rate the App");
          }),
          _menuTile(context, Icons.share_outlined, "Share App", () {
            _comingSoon(context, "Share App");
          }),
          _menuTile(
            context,
            Icons.info_outline,
            "About",
            () => _showAbout(context),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _menuTile(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color color = Colors.black87,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _comingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("$feature — coming soon")));
  }

  void _confirmClearData(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Clear All Data?"),
            content: const Text(
              "This will permanently delete all your transactions and budgets. This action cannot be undone.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  final db = await DatabaseHelper.instance.database;
                  await db.delete('transaction_tbl');
                  await db.delete('budget');
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("All data cleared.")),
                    );
                  }
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "Expense Tracker",
      applicationVersion: "1.0.0",
      applicationIcon: const Icon(
        Icons.account_balance_wallet,
        color: Color(0xff10b981),
        size: 40,
      ),
      children: const [
        Text("A simple app to track your income, expenses, and budgets."),
      ],
    );
  }

  Widget _darkModeTile() {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeService.themeNotifier,
      builder: (context, mode, _) {
        final isDark = mode == ThemeMode.dark;
        return Card(
          color: Theme.of(context).cardColor,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text(
              "Dark Mode",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            value: isDark,
            activeColor: const Color(0xff10b981),
            onChanged: (value) {
              ThemeService.toggleTheme(value);
            },
          ),
        );
      },
    );
  }
}

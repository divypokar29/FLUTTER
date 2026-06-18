import 'package:advocate/utils/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../utils/app_provider.dart';
import '../utils/app_strings.dart';

import 'client_list_screen.dart';
import 'reminders_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const _DashboardHome(),
      const ClientListScreen(),
      const RemindersScreen(),
      const SettingsScreen(),
    ];
    return Consumer<AppProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          body: screens[_currentIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppTheme.divider, width: 1),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.dashboard_rounded),
                  label: AppStrings.get('dashboard'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.people_rounded),
                  label: AppStrings.get('clients'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.alarm_rounded),
                  label: AppStrings.get('reminders'),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings_rounded),
                  label: AppStrings.get('settings'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DashboardHome extends StatelessWidget {
  const _DashboardHome();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, provider, __) {
        final fmt = NumberFormat('#,##,###', 'en_IN');
        final pending = provider.pendingPaymentClients;
        final reminders = provider.allUpcomingReminders;

        return Scaffold(
          backgroundColor: AppTheme.black,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 160,
                pinned: true,
                backgroundColor: AppTheme.darkGrey,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppTheme.darkGrey, Color(0xFF111111)],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppTheme.goldFade,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppTheme.gold,
                                      width: 1,
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/Logos/Advocate_gold.png",
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      AppStrings.get('app_title'),
                                      style: const TextStyle(
                                        color: AppTheme.textPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      'Real Estate Advocate',
                                      style: const TextStyle(
                                        color: AppTheme.gold,
                                        fontSize: 12,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              DateFormat(
                                'EEEE, dd MMMM yyyy',
                              ).format(DateTime.now()),
                              style: const TextStyle(
                                color: AppTheme.textHint,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Stat grid
                      Row(
                        children: [
                          _StatTile(
                            label: AppStrings.get('total_clients'),
                            value: '${provider.clients.length}',
                            icon: Icons.people_rounded,
                            color: AppTheme.blue,
                          ),
                          const SizedBox(width: 10),
                          _StatTile(
                            label: AppStrings.get('pending_clients'),
                            value: '${pending.length}',
                            icon: Icons.warning_amber_rounded,
                            color: AppTheme.orange,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _StatTile(
                            label: AppStrings.get('total_received'),
                            value:
                                '₹${fmt.format(provider.totalReceived.toInt())}',
                            icon: Icons.check_circle_rounded,
                            color: AppTheme.green,
                          ),
                          const SizedBox(width: 10),
                          _StatTile(
                            label: AppStrings.get('total_pending'),
                            value:
                                '₹${fmt.format(provider.totalPending.toInt())}',
                            icon: Icons.pending_actions_rounded,
                            color: AppTheme.red,
                          ),
                        ],
                      ),

                      if (pending.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _SectionHeader(
                          title: AppStrings.get('payment_pending'),
                          icon: Icons.warning_amber_rounded,
                          color: AppTheme.red,
                        ),
                        const SizedBox(height: 10),
                        ...pending
                            .take(5)
                            .map((c) => _PendingCard(client: c, fmt: fmt)),
                      ],

                      if (reminders.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _SectionHeader(
                          title: AppStrings.get('reminders'),
                          icon: Icons.alarm_on_rounded,
                          color: AppTheme.gold,
                        ),
                        const SizedBox(height: 10),
                        ...reminders
                            .take(3)
                            .map(
                              (r) => Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  color: AppTheme.cardDark,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppTheme.divider),
                                ),
                                child: ListTile(
                                  leading: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppTheme.goldFade,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.alarm_rounded,
                                      color: AppTheme.gold,
                                      size: 20,
                                    ),
                                  ),
                                  title: Text(
                                    r.message,
                                    style: const TextStyle(
                                      color: AppTheme.textPrimary,
                                      fontSize: 14,
                                    ),
                                  ),
                                  subtitle: Text(
                                    DateFormat('dd MMM yyyy').format(r.date),
                                    style: const TextStyle(
                                      color: AppTheme.textHint,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.color,
  });
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: color, size: 18),
      const SizedBox(width: 8),
      Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
      const Spacer(),
      Container(height: 1, width: 60, color: AppTheme.divider),
    ],
  );
}

class _StatTile extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _StatTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });
  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: AppTheme.textHint, fontSize: 11),
          ),
        ],
      ),
    ),
  );
}

class _PendingCard extends StatelessWidget {
  final dynamic client;
  final NumberFormat fmt;
  const _PendingCard({required this.client, required this.fmt});
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: AppTheme.cardDark,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppTheme.divider),
    ),
    child: Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppTheme.red.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              client.name[0].toUpperCase(),
              style: const TextStyle(
                color: AppTheme.red,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                client.name,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                client.caseType,
                style: const TextStyle(color: AppTheme.textHint, fontSize: 12),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '₹${fmt.format(client.pendingAmount.toInt())}',
              style: const TextStyle(
                color: AppTheme.red,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
            const Text(
              'બાકી / बकाया',
              style: TextStyle(color: AppTheme.textHint, fontSize: 10),
            ),
          ],
        ),
      ],
    ),
  );
}

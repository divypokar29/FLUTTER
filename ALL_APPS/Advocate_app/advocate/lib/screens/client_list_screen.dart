import 'package:advocate/utils/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../utils/app_provider.dart';
import '../utils/app_strings.dart';

import '../models/models.dart';
import 'client_detail_screen.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});
  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (_, provider, __) {
      final filtered = provider.clients
          .where((c) =>
              c.name.toLowerCase().contains(_search.toLowerCase()) ||
              c.phone.contains(_search))
          .toList();

      return Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(
          title: Text(AppStrings.get('clients')),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: TextField(
                onChanged: (v) => setState(() => _search = v),
                style: const TextStyle(color: AppTheme.textPrimary),
                decoration: InputDecoration(
                  hintText: AppStrings.get('search_client'),
                  prefixIcon: const Icon(Icons.search_rounded),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
          ),
        ),
        body: filtered.isEmpty
            ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.people_outline, color: AppTheme.textHint, size: 64),
                const SizedBox(height: 12),
                Text(AppStrings.get('no_clients'), style: const TextStyle(color: AppTheme.textHint)),
              ]))
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
                itemCount: filtered.length,
                itemBuilder: (_, i) => _ClientCard(client: filtered[i]),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddClient(context, provider),
          icon: const Icon(Icons.person_add_rounded),
          label: Text(AppStrings.get('add_client')),
        ),
      );
    });
  }

  void _showAddClient(BuildContext context, AppProvider provider) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final caseCtrl = TextEditingController();
    final feesCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 4, height: 20, decoration: BoxDecoration(color: AppTheme.gold, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 10),
            Text(AppStrings.get('add_client'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          ]),
          const SizedBox(height: 20),
          _Field(ctrl: nameCtrl, label: AppStrings.get('client_name'), icon: Icons.person_rounded),
          _Field(ctrl: phoneCtrl, label: AppStrings.get('phone'), icon: Icons.phone_rounded, type: TextInputType.phone),
          _Field(ctrl: addressCtrl, label: AppStrings.get('address'), icon: Icons.location_on_rounded),
          _Field(ctrl: caseCtrl, label: AppStrings.get('case_type'), icon: Icons.work_rounded),
          _Field(ctrl: feesCtrl, label: AppStrings.get('total_fees'), icon: Icons.currency_rupee_rounded, type: TextInputType.number),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: OutlinedButton(onPressed: () => Navigator.pop(ctx), child: Text(AppStrings.get('cancel')))),
            const SizedBox(width: 12),
            Expanded(child: ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty || phoneCtrl.text.isEmpty) return;
                provider.addClient(Client(
                  id: const Uuid().v4(),
                  name: nameCtrl.text.trim(),
                  phone: phoneCtrl.text.trim(),
                  address: addressCtrl.text.trim(),
                  caseType: caseCtrl.text.trim(),
                  caseStartDate: DateTime.now(),
                  totalFees: double.tryParse(feesCtrl.text) ?? 0,
                ));
                Navigator.pop(ctx);
              },
              child: Text(AppStrings.get('save')),
            )),
          ]),
        ])),
      ),
    );
  }
}

class _ClientCard extends StatelessWidget {
  final Client client;
  const _ClientCard({required this.client});
  @override
  Widget build(BuildContext context) {
    final progress = client.totalFees > 0 ? (client.paidAmount / client.totalFees).clamp(0.0, 1.0) : 0.0;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ClientDetailScreen(clientId: client.id))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.divider),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: client.isFullyPaid
                      ? [AppTheme.green.withOpacity(0.3), AppTheme.green.withOpacity(0.1)]
                      : [AppTheme.gold.withOpacity(0.3), AppTheme.gold.withOpacity(0.05)],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: client.isFullyPaid ? AppTheme.green.withOpacity(0.4) : AppTheme.gold.withOpacity(0.4)),
              ),
              child: Center(child: Text(client.name[0].toUpperCase(),
                style: TextStyle(color: client.isFullyPaid ? AppTheme.green : AppTheme.gold, fontWeight: FontWeight.w800, fontSize: 20))),
            ),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(client.name, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 15)),
              const SizedBox(height: 2),
              Text(client.phone, style: const TextStyle(color: AppTheme.textSecond, fontSize: 12)),
              Text(client.caseType, style: const TextStyle(color: AppTheme.textHint, fontSize: 11)),
            ])),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: client.caseStatus == 'active' ? AppTheme.blue.withOpacity(0.15) : AppTheme.textHint.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: client.caseStatus == 'active' ? AppTheme.blue.withOpacity(0.3) : AppTheme.divider),
                ),
                child: Text(client.caseStatus == 'active' ? AppStrings.get('active') : AppStrings.get('closed'),
                  style: TextStyle(color: client.caseStatus == 'active' ? AppTheme.blue : AppTheme.textHint, fontSize: 11, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 6),
              if (!client.isFullyPaid)
                Text('₹${client.pendingAmount.toStringAsFixed(0)} ${AppStrings.get('pending_amount')}',
                  style: const TextStyle(color: AppTheme.red, fontSize: 12, fontWeight: FontWeight.w600))
              else
                const Text('✓ Paid', style: TextStyle(color: AppTheme.green, fontSize: 12, fontWeight: FontWeight.w600)),
            ]),
          ]),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('₹${client.paidAmount.toStringAsFixed(0)} / ₹${client.totalFees.toStringAsFixed(0)}',
              style: const TextStyle(color: AppTheme.textHint, fontSize: 11)),
            Text('${(progress * 100).toStringAsFixed(0)}%',
              style: TextStyle(color: progress >= 1 ? AppTheme.green : AppTheme.gold, fontSize: 11, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppTheme.divider,
              valueColor: AlwaysStoppedAnimation(progress >= 1 ? AppTheme.green : AppTheme.gold),
            ),
          ),
        ]),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController ctrl;
  final String label; final IconData icon;
  final TextInputType type;
  const _Field({required this.ctrl, required this.label, required this.icon, this.type = TextInputType.text});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(controller: ctrl, keyboardType: type, style: const TextStyle(color: AppTheme.textPrimary),
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon))),
  );
}

import 'package:advocate/utils/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../utils/app_provider.dart';
import '../utils/app_strings.dart';
import '../models/models.dart';

class ClientDetailScreen extends StatefulWidget {
  final String clientId;
  const ClientDetailScreen({super.key, required this.clientId});
  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tab;
  @override
  void initState() { super.initState(); _tab = TabController(length: 3, vsync: this); }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (_, provider, __) {
      final client = provider.clients.firstWhere((c) => c.id == widget.clientId);
      final fmt = NumberFormat('#,##,###', 'en_IN');
      final progress = client.totalFees > 0 ? (client.paidAmount / client.totalFees).clamp(0.0, 1.0) : 0.0;

      return Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(
          title: Text(client.name),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded, size: 20), onPressed: () => Navigator.pop(context)),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert_rounded),
              itemBuilder: (_) => [
                PopupMenuItem(value: 'status', child: Row(children: [
                  Icon(client.caseStatus == 'active' ? Icons.lock_rounded : Icons.lock_open_rounded, size: 16, color: AppTheme.gold),
                  const SizedBox(width: 8),
                  Text(client.caseStatus == 'active' ? AppStrings.get('closed') : AppStrings.get('active')),
                ])),
                PopupMenuItem(value: 'delete', child: Row(children: [
                  const Icon(Icons.delete_rounded, size: 16, color: AppTheme.red),
                  const SizedBox(width: 8),
                  Text(AppStrings.get('delete'), style: const TextStyle(color: AppTheme.red)),
                ])),
              ],
              onSelected: (val) {
                if (val == 'status') {
                  provider.updateClient(Client(id: client.id, name: client.name, phone: client.phone,
                    address: client.address, caseType: client.caseType,
                    caseStatus: client.caseStatus == 'active' ? 'closed' : 'active',
                    caseStartDate: client.caseStartDate, totalFees: client.totalFees,
                    payments: client.payments, documents: client.documents, reminders: client.reminders));
                } else {
                  showDialog(context: context, builder: (_) => AlertDialog(
                    title: Text(AppStrings.get('confirm_delete')),
                    content: Text(AppStrings.get('delete_confirm_msg')),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: Text(AppStrings.get('cancel'))),
                      TextButton(onPressed: () { provider.deleteClient(client.id); Navigator.pop(context); Navigator.pop(context); },
                        child: Text(AppStrings.get('delete'), style: const TextStyle(color: AppTheme.red))),
                    ],
                  ));
                }
              },
            ),
          ],
          bottom: TabBar(
            controller: _tab,
            tabs: [Tab(text: AppStrings.get('payments')), Tab(text: AppStrings.get('documents')), Tab(text: AppStrings.get('reminders'))],
          ),
        ),
        body: Column(children: [
          // Summary header
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.cardDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.divider),
            ),
            child: Column(children: [
              Row(children: [
                Container(
                  width: 52, height: 52,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppTheme.gold.withOpacity(0.3), AppTheme.gold.withOpacity(0.05)]),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.gold.withOpacity(0.4)),
                  ),
                  child: Center(child: Text(client.name[0].toUpperCase(),
                    style: const TextStyle(color: AppTheme.gold, fontWeight: FontWeight.w800, fontSize: 24))),
                ),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(client.name, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 17)),
                  const SizedBox(height: 2),
                  Row(children: [
                    const Icon(Icons.phone_rounded, size: 12, color: AppTheme.textHint),
                    const SizedBox(width: 4),
                    Text(client.phone, style: const TextStyle(color: AppTheme.textSecond, fontSize: 13)),
                  ]),
                  Row(children: [
                    const Icon(Icons.work_rounded, size: 12, color: AppTheme.textHint),
                    const SizedBox(width: 4),
                    Text(client.caseType, style: const TextStyle(color: AppTheme.textHint, fontSize: 12)),
                  ]),
                ])),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: client.caseStatus == 'active' ? AppTheme.blue.withOpacity(0.15) : AppTheme.textHint.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: client.caseStatus == 'active' ? AppTheme.blue.withOpacity(0.3) : AppTheme.divider),
                  ),
                  child: Text(client.caseStatus == 'active' ? AppStrings.get('active') : AppStrings.get('closed'),
                    style: TextStyle(color: client.caseStatus == 'active' ? AppTheme.blue : AppTheme.textHint, fontSize: 12, fontWeight: FontWeight.w600)),
                ),
              ]),
              const SizedBox(height: 16),
              const Divider(color: AppTheme.divider, height: 1),
              const SizedBox(height: 14),
              Row(children: [
                _FeeBox(label: AppStrings.get('total_fees'), value: '₹${fmt.format(client.totalFees.toInt())}', color: AppTheme.blue),
                _Vdivider(),
                _FeeBox(label: AppStrings.get('paid_amount'), value: '₹${fmt.format(client.paidAmount.toInt())}', color: AppTheme.green),
                _Vdivider(),
                _FeeBox(label: AppStrings.get('pending_amount'), value: '₹${fmt.format(client.pendingAmount.toInt())}', color: client.pendingAmount > 0 ? AppTheme.red : AppTheme.green),
              ]),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Payment Progress', style: TextStyle(color: AppTheme.textHint, fontSize: 11)),
                Text('${(progress * 100).toStringAsFixed(0)}%', style: TextStyle(color: progress >= 1 ? AppTheme.green : AppTheme.gold, fontSize: 11, fontWeight: FontWeight.w700)),
              ]),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress, minHeight: 8,
                  backgroundColor: AppTheme.divider,
                  valueColor: AlwaysStoppedAnimation(progress >= 1 ? AppTheme.green : AppTheme.gold),
                ),
              ),
            ]),
          ),
          Expanded(child: TabBarView(controller: _tab, children: [
            _PaymentsTab(client: client, provider: provider, fmt: fmt),
            _DocumentsTab(client: client, provider: provider),
            _RemindersTab(client: client, provider: provider),
          ])),
        ]),
      );
    });
  }
}

class _Vdivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(width: 1, height: 36, color: AppTheme.divider);
}

class _FeeBox extends StatelessWidget {
  final String label, value; final Color color;
  const _FeeBox({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) => Expanded(child: Column(children: [
    Text(value, style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 15)),
    const SizedBox(height: 2),
    Text(label, style: const TextStyle(color: AppTheme.textHint, fontSize: 10), textAlign: TextAlign.center),
  ]));
}

// ─── Payments Tab ─────────────────────────────────────────────────────────────
class _PaymentsTab extends StatelessWidget {
  final Client client; final AppProvider provider; final NumberFormat fmt;
  const _PaymentsTab({required this.client, required this.provider, required this.fmt});

  @override
  Widget build(BuildContext context) => Column(children: [
    Expanded(
      child: client.payments.isEmpty
          ? _Empty(icon: Icons.receipt_long_rounded, text: AppStrings.get('no_payments'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
              itemCount: client.payments.length,
              itemBuilder: (_, i) {
                final p = client.payments[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.divider)),
                  child: Row(children: [
                    Container(width: 44, height: 44, decoration: BoxDecoration(color: AppTheme.green.withOpacity(0.12), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.currency_rupee_rounded, color: AppTheme.green, size: 22)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('₹${fmt.format(p.amount.toInt())}', style: const TextStyle(color: AppTheme.green, fontWeight: FontWeight.w800, fontSize: 16)),
                      Text(DateFormat('dd MMM yyyy').format(p.date), style: const TextStyle(color: AppTheme.textHint, fontSize: 12)),
                      if (p.note.isNotEmpty) Text(p.note, style: const TextStyle(color: AppTheme.textSecond, fontSize: 12)),
                    ])),
                    IconButton(icon: const Icon(Icons.delete_outline_rounded, color: AppTheme.red, size: 20),
                      onPressed: () { client.payments.removeWhere((x) => x.id == p.id); provider.updateClient(client); }),
                  ]),
                );
              }),
    ),
    _BottomBtn(label: AppStrings.get('add_payment'), icon: Icons.add_rounded, onTap: () => _addPayment(context)),
  ]);

  void _addPayment(BuildContext context) {
    final amtCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _SheetTitle(AppStrings.get('add_payment')),
          const SizedBox(height: 16),
          _DarkField(ctrl: amtCtrl, label: AppStrings.get('amount'), icon: Icons.currency_rupee_rounded, type: TextInputType.number),
          _DarkField(ctrl: noteCtrl, label: AppStrings.get('note'), icon: Icons.note_rounded),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            onPressed: () {
              final amt = double.tryParse(amtCtrl.text);
              if (amt == null || amt <= 0) return;
              client.payments.add(PaymentEntry(id: const Uuid().v4(), amount: amt, date: DateTime.now(), note: noteCtrl.text.trim()));
              provider.updateClient(client);
              Navigator.pop(ctx);
            },
            child: Text(AppStrings.get('save')),
          ),
        ]),
      ));
  }
}

// ─── Documents Tab ─────────────────────────────────────────────────────────────
class _DocumentsTab extends StatelessWidget {
  final Client client; final AppProvider provider;
  const _DocumentsTab({required this.client, required this.provider});

  @override
  Widget build(BuildContext context) => Column(children: [
    Expanded(
      child: client.documents.isEmpty
          ? _Empty(icon: Icons.folder_open_rounded, text: AppStrings.get('no_documents'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
              itemCount: client.documents.length,
              itemBuilder: (_, i) {
                final doc = client.documents[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: doc.takenByClient ? AppTheme.orange.withOpacity(0.3) : AppTheme.divider),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Container(
                        width: 42, height: 42,
                        decoration: BoxDecoration(
                          color: doc.takenByClient ? AppTheme.orange.withOpacity(0.12) : AppTheme.blue.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(doc.takenByClient ? Icons.person_rounded : Icons.description_rounded,
                          color: doc.takenByClient ? AppTheme.orange : AppTheme.blue, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(doc.name, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w600, fontSize: 14)),
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: doc.type == 'original' ? AppTheme.gold.withOpacity(0.12) : AppTheme.blue.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(doc.type == 'original' ? AppStrings.get('original') : AppStrings.get('copy'),
                              style: TextStyle(color: doc.type == 'original' ? AppTheme.gold : AppTheme.blue, fontSize: 10, fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: doc.takenByClient ? AppTheme.orange.withOpacity(0.12) : AppTheme.green.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(doc.takenByClient ? AppStrings.get('taken_by_client') : AppStrings.get('with_advocate'),
                              style: TextStyle(color: doc.takenByClient ? AppTheme.orange : AppTheme.green, fontSize: 10, fontWeight: FontWeight.w600)),
                          ),
                        ]),
                      ])),
                    ]),
                    if (doc.takenByClient) ...[
                      const SizedBox(height: 10),
                      const Divider(color: AppTheme.divider, height: 1),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Icon(Icons.how_to_reg_rounded, color: AppTheme.orange, size: 14),
                        const SizedBox(width: 6),
                        Text('${AppStrings.get('signature_taken')}: ${doc.takenByName}',
                          style: const TextStyle(color: AppTheme.orange, fontSize: 12)),
                        const Spacer(),
                        if (doc.takenDate != null)
                          Text(DateFormat('dd MMM yyyy').format(doc.takenDate!), style: const TextStyle(color: AppTheme.textHint, fontSize: 11)),
                      ]),
                    ] else ...[
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => _markTaken(context, doc),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppTheme.gold.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.gold.withOpacity(0.3)),
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            const Icon(Icons.how_to_reg_rounded, color: AppTheme.gold, size: 15),
                            const SizedBox(width: 6),
                            Text(AppStrings.get('mark_taken'), style: const TextStyle(color: AppTheme.gold, fontSize: 12, fontWeight: FontWeight.w600)),
                          ]),
                        ),
                      ),
                    ],
                  ]),
                );
              }),
    ),
    _BottomBtn(label: AppStrings.get('add_document'), icon: Icons.add_rounded, onTap: () => _addDocument(context)),
  ]);

  void _markTaken(BuildContext context, DocumentEntry doc) {
    final nameCtrl = TextEditingController();
    showDialog(context: context, builder: (_) => AlertDialog(
      title: Row(children: [
        const Icon(Icons.how_to_reg_rounded, color: AppTheme.gold, size: 20),
        const SizedBox(width: 8),
        Text(AppStrings.get('mark_taken')),
      ]),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('दस्तावेज़ लेने वाले का नाम:', style: const TextStyle(color: AppTheme.textSecond, fontSize: 13)),
        const SizedBox(height: 10),
        TextField(controller: nameCtrl, style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(labelText: AppStrings.get('client_name'), prefixIcon: const Icon(Icons.person_rounded))),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: AppTheme.goldFade, borderRadius: BorderRadius.circular(8)),
          child: Row(children: [
            const Icon(Icons.calendar_today_rounded, color: AppTheme.gold, size: 14),
            const SizedBox(width: 8),
            Text(DateFormat('dd MMM yyyy').format(DateTime.now()), style: const TextStyle(color: AppTheme.gold, fontSize: 13)),
          ]),
        ),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(AppStrings.get('cancel'))),
        ElevatedButton(
          onPressed: () {
            doc.takenByClient = true;
            doc.takenDate = DateTime.now();
            doc.takenByName = nameCtrl.text.trim().isNotEmpty ? nameCtrl.text.trim() : client.name;
            provider.updateClient(client);
            Navigator.pop(context);
          },
          child: Text(AppStrings.get('save')),
        ),
      ],
    ));
  }

  void _addDocument(BuildContext context) {
    final nameCtrl = TextEditingController();
    String type = 'original';
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(builder: (ctx, set) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          _SheetTitle(AppStrings.get('add_document')),
          const SizedBox(height: 16),
          _DarkField(ctrl: nameCtrl, label: AppStrings.get('doc_name'), icon: Icons.description_rounded),
          const SizedBox(height: 4),
          Text(AppStrings.get('doc_type'), style: const TextStyle(color: AppTheme.textSecond, fontSize: 13)),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(child: _TypeChip(label: AppStrings.get('original'), selected: type == 'original', color: AppTheme.gold, onTap: () => set(() => type = 'original'))),
            const SizedBox(width: 10),
            Expanded(child: _TypeChip(label: AppStrings.get('copy'), selected: type == 'copy', color: AppTheme.blue, onTap: () => set(() => type = 'copy'))),
          ]),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            onPressed: () {
              if (nameCtrl.text.isEmpty) return;
              client.documents.add(DocumentEntry(id: const Uuid().v4(), name: nameCtrl.text.trim(), type: type));
              provider.updateClient(client);
              Navigator.pop(ctx);
            },
            child: Text(AppStrings.get('save')),
          ),
        ]),
      )));
  }
}

class _TypeChip extends StatelessWidget {
  final String label; final bool selected; final Color color; final VoidCallback onTap;
  const _TypeChip({required this.label, required this.selected, required this.color, required this.onTap});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: selected ? color.withOpacity(0.15) : AppTheme.darkGrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: selected ? color : AppTheme.divider, width: selected ? 1.5 : 1),
      ),
      child: Center(child: Text(label, style: TextStyle(color: selected ? color : AppTheme.textHint, fontWeight: FontWeight.w600))),
    ),
  );
}

// ─── Reminders Tab ─────────────────────────────────────────────────────────────
class _RemindersTab extends StatelessWidget {
  final Client client; final AppProvider provider;
  const _RemindersTab({required this.client, required this.provider});

  @override
  Widget build(BuildContext context) => Column(children: [
    Expanded(
      child: client.reminders.isEmpty
          ? _Empty(icon: Icons.alarm_off_rounded, text: AppStrings.get('no_reminders'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
              itemCount: client.reminders.length,
              itemBuilder: (_, i) {
                final r = client.reminders[i];
                final overdue = !r.isDone && r.date.isBefore(DateTime.now().subtract(const Duration(days: 1)));
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: overdue ? AppTheme.red.withOpacity(0.3) : AppTheme.divider),
                  ),
                  child: Row(children: [
                    Container(width: 42, height: 42, decoration: BoxDecoration(
                      color: r.isDone ? AppTheme.textHint.withOpacity(0.1) : overdue ? AppTheme.red.withOpacity(0.12) : AppTheme.goldFade,
                      borderRadius: BorderRadius.circular(10)),
                      child: Icon(r.isDone ? Icons.check_rounded : Icons.alarm_rounded,
                        color: r.isDone ? AppTheme.textHint : overdue ? AppTheme.red : AppTheme.gold, size: 20)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(r.message, style: TextStyle(color: r.isDone ? AppTheme.textHint : AppTheme.textPrimary,
                        decoration: r.isDone ? TextDecoration.lineThrough : null, fontSize: 14)),
                      const SizedBox(height: 2),
                      Text(DateFormat('dd MMM yyyy').format(r.date),
                        style: TextStyle(color: overdue ? AppTheme.red : AppTheme.textHint, fontSize: 12)),
                      if (overdue) const Text('⚠ Overdue', style: TextStyle(color: AppTheme.red, fontSize: 11, fontWeight: FontWeight.w600)),
                    ])),
                    Checkbox(value: r.isDone, onChanged: (v) { r.isDone = v ?? false; provider.updateClient(client); }),
                  ]),
                );
              }),
    ),
    _BottomBtn(label: AppStrings.get('add_reminder'), icon: Icons.add_alarm_rounded, onTap: () => _addReminder(context)),
  ]);

  void _addReminder(BuildContext context) {
    final msgCtrl = TextEditingController();
    DateTime date = DateTime.now().add(const Duration(days: 1));
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(builder: (ctx, set) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _SheetTitle(AppStrings.get('add_reminder')),
          const SizedBox(height: 16),
          _DarkField(ctrl: msgCtrl, label: AppStrings.get('reminder_msg'), icon: Icons.message_rounded),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(context: ctx, initialDate: date, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
              if (picked != null) set(() => date = picked);
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppTheme.darkGrey, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.divider)),
              child: Row(children: [
                const Icon(Icons.calendar_today_rounded, color: AppTheme.gold, size: 18),
                const SizedBox(width: 12),
                Text(DateFormat('dd MMM yyyy').format(date), style: const TextStyle(color: AppTheme.textPrimary)),
                const Spacer(),
                const Icon(Icons.chevron_right_rounded, color: AppTheme.textHint),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            onPressed: () {
              if (msgCtrl.text.isEmpty) return;
              client.reminders.add(ReminderEntry(id: const Uuid().v4(), date: date, message: msgCtrl.text.trim()));
              provider.updateClient(client);
              Navigator.pop(ctx);
            },
            child: Text(AppStrings.get('save')),
          ),
        ]),
      )));
  }
}

// ─── Shared Widgets ─────────────────────────────────────────────────────────────
class _Empty extends StatelessWidget {
  final IconData icon; final String text;
  const _Empty({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Icon(icon, color: AppTheme.textHint, size: 60),
    const SizedBox(height: 12),
    Text(text, style: const TextStyle(color: AppTheme.textHint)),
  ]));
}

class _BottomBtn extends StatelessWidget {
  final String label; final IconData icon; final VoidCallback onTap;
  const _BottomBtn({required this.label, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
    decoration: const BoxDecoration(color: AppTheme.black, border: Border(top: BorderSide(color: AppTheme.divider))),
    child: ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
      onPressed: onTap, icon: Icon(icon), label: Text(label)),
  );
}

class _SheetTitle extends StatelessWidget {
  final String title;
  const _SheetTitle(this.title);
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 4, height: 20, decoration: BoxDecoration(color: AppTheme.gold, borderRadius: BorderRadius.circular(2))),
    const SizedBox(width: 10),
    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
  ]);
}

class _DarkField extends StatelessWidget {
  final TextEditingController ctrl; final String label; final IconData icon; final TextInputType type;
  const _DarkField({required this.ctrl, required this.label, required this.icon, this.type = TextInputType.text});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(controller: ctrl, keyboardType: type, style: const TextStyle(color: AppTheme.textPrimary),
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon))),
  );
}

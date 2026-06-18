import 'dart:convert';

class PaymentEntry {
  String id;
  double amount;
  DateTime date;
  String note;

  PaymentEntry({
    required this.id,
    required this.amount,
    required this.date,
    this.note = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'date': date.toIso8601String(),
    'note': note,
  };

  factory PaymentEntry.fromJson(Map<String, dynamic> j) => PaymentEntry(
    id: j['id'],
    amount: (j['amount'] as num).toDouble(),
    date: DateTime.parse(j['date']),
    note: j['note'] ?? '',
  );
}

class DocumentEntry {
  String id;
  String name;
  String type; // 'original' or 'copy'
  bool takenByClient;
  DateTime? takenDate;
  String takenByName;

  DocumentEntry({
    required this.id,
    required this.name,
    required this.type,
    this.takenByClient = false,
    this.takenDate,
    this.takenByName = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'takenByClient': takenByClient,
    'takenDate': takenDate?.toIso8601String(),
    'takenByName': takenByName,
  };

  factory DocumentEntry.fromJson(Map<String, dynamic> j) => DocumentEntry(
    id: j['id'],
    name: j['name'],
    type: j['type'],
    takenByClient: j['takenByClient'] ?? false,
    takenDate: j['takenDate'] != null ? DateTime.parse(j['takenDate']) : null,
    takenByName: j['takenByName'] ?? '',
  );
}

class ReminderEntry {
  String id;
  DateTime date;
  String message;
  bool isDone;

  ReminderEntry({
    required this.id,
    required this.date,
    required this.message,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'message': message,
    'isDone': isDone,
  };

  factory ReminderEntry.fromJson(Map<String, dynamic> j) => ReminderEntry(
    id: j['id'],
    date: DateTime.parse(j['date']),
    message: j['message'],
    isDone: j['isDone'] ?? false,
  );
}

class Client {
  String id;
  String name;
  String phone;
  String address;
  String caseType;
  String caseStatus; // 'active' or 'closed'
  DateTime caseStartDate;
  double totalFees;
  List<PaymentEntry> payments;
  List<DocumentEntry> documents;
  List<ReminderEntry> reminders;

  Client({
    required this.id,
    required this.name,
    required this.phone,
    this.address = '',
    required this.caseType,
    this.caseStatus = 'active',
    required this.caseStartDate,
    required this.totalFees,
    List<PaymentEntry>? payments,
    List<DocumentEntry>? documents,
    List<ReminderEntry>? reminders,
  })  : payments = payments ?? [],
        documents = documents ?? [],
        reminders = reminders ?? [];

  double get paidAmount => payments.fold(0, (sum, p) => sum + p.amount);
  double get pendingAmount => totalFees - paidAmount;
  bool get isFullyPaid => pendingAmount <= 0;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'address': address,
    'caseType': caseType,
    'caseStatus': caseStatus,
    'caseStartDate': caseStartDate.toIso8601String(),
    'totalFees': totalFees,
    'payments': payments.map((p) => p.toJson()).toList(),
    'documents': documents.map((d) => d.toJson()).toList(),
    'reminders': reminders.map((r) => r.toJson()).toList(),
  };

  factory Client.fromJson(Map<String, dynamic> j) => Client(
    id: j['id'],
    name: j['name'],
    phone: j['phone'],
    address: j['address'] ?? '',
    caseType: j['caseType'],
    caseStatus: j['caseStatus'] ?? 'active',
    caseStartDate: DateTime.parse(j['caseStartDate']),
    totalFees: (j['totalFees'] as num).toDouble(),
    payments: (j['payments'] as List? ?? []).map((p) => PaymentEntry.fromJson(p)).toList(),
    documents: (j['documents'] as List? ?? []).map((d) => DocumentEntry.fromJson(d)).toList(),
    reminders: (j['reminders'] as List? ?? []).map((r) => ReminderEntry.fromJson(r)).toList(),
  );
}

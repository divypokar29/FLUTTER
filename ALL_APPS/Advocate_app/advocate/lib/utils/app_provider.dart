import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import '../utils/app_strings.dart';

class AppProvider extends ChangeNotifier {
  List<Client> _clients = [];
  AppLanguage _language = AppLanguage.hindi;

  List<Client> get clients => _clients;
  AppLanguage get language => _language;

  AppProvider() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final clientsJson = prefs.getString('clients');
    if (clientsJson != null) {
      final List decoded = jsonDecode(clientsJson);
      _clients = decoded.map((e) => Client.fromJson(e)).toList();
    }
    final lang = prefs.getString('language') ?? 'hindi';
    _language = lang == 'english'
        ? AppLanguage.english
        : lang == 'gujarati'
            ? AppLanguage.gujarati
            : AppLanguage.hindi;
    AppStrings.currentLanguage = _language;
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('clients', jsonEncode(_clients.map((c) => c.toJson()).toList()));
  }

  Future<void> setLanguage(AppLanguage lang) async {
    _language = lang;
    AppStrings.currentLanguage = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'language',
        lang == AppLanguage.english
            ? 'english'
            : lang == AppLanguage.gujarati
                ? 'gujarati'
                : 'hindi');
    notifyListeners();
  }

  void addClient(Client client) {
    _clients.add(client);
    _save();
    notifyListeners();
  }

  void updateClient(Client client) {
    final idx = _clients.indexWhere((c) => c.id == client.id);
    if (idx != -1) _clients[idx] = client;
    _save();
    notifyListeners();
  }

  void deleteClient(String id) {
    _clients.removeWhere((c) => c.id == id);
    _save();
    notifyListeners();
  }

  List<Client> get pendingPaymentClients =>
      _clients.where((c) => !c.isFullyPaid && c.caseStatus == 'active').toList();

  List<ReminderEntry> get allUpcomingReminders {
    final now = DateTime.now();
    List<ReminderEntry> all = [];
    for (var c in _clients) {
      for (var r in c.reminders) {
        if (!r.isDone && r.date.isAfter(now.subtract(const Duration(days: 1)))) {
          all.add(r);
        }
      }
    }
    all.sort((a, b) => a.date.compareTo(b.date));
    return all;
  }

  double get totalPending => _clients.fold(0, (sum, c) => sum + c.pendingAmount);
  double get totalReceived => _clients.fold(0, (sum, c) => sum + c.paidAmount);
}

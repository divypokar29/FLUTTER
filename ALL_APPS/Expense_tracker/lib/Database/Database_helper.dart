import 'package:expense_tracker/Models/Transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init(); // private constructor wehich is only acces by this file only

  Database?
  _database; // crete object of databse - wehich is inherit from sqflite library

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      //db create
      _database = await _initDb("expense.db");
      return _database!;
    }
  }

  Future<Database> _initDb(String filename) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filename); // c:/myofflinedb/todo.db

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tran_tbl (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      amount REAL NOT NULL,
      category TEXT NOT NULL,
      date TEXT NOT NULL,
      payment_method TEXT NOT NULL,
      note TEXT
     
    ) ''');
  }

  Future<int> insertTransaction(TransactionModel transactionModel) async {
    final db = await database;
    return db.insert("tran_tbl", transactionModel.toMap());
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    final db = await database;
    final result = await db.query("tran_tbl", orderBy: "date DESC");

    return result.map((element) => TransactionModel.fromJson(element)).toList();
  }
}

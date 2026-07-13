import 'package:expense_tracker/Models/Trangeaction_model.dart';
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
      CREATE TABLE transaction_tbl(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  amount REAL NOT NULL,
  type TEXT NOT NULL,
  category TEXT NOT NULL,
  date TEXT NOT NULL,
  payment_method TEXT NOT NULL,
  note TEXT
); ''');

    await db.execute('''
    CREATE TABLE budget(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      category TEXT UNIQUE NOT NULL,
      budget REAL NOT NULL
    )
  ''');
  }

  Future<int> insertBudget(String category, double budget) async {
    final db = await database;

    return await db.insert('budget', {
      'category': category,
      'budget': budget,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<double> getBudget(String category) async {
    final db = await database;

    final result = await db.query(
      'budget',
      where: 'category = ?',
      whereArgs: [category],
    );

    if (result.isNotEmpty) {
      return (result.first['budget'] as num).toDouble();
    }

    return 0.0;
  }

  Future<Map<String, double>> getExpenseByCategory() async {
    final db = await database;
    final result = await db.rawQuery(
      '''
      SELECT category, SUM(amount) as total
      FROM transaction_tbl
      WHERE type = ?
      GROUP BY category
    ''',
      ['Expense'],
    );

    Map<String, double> map = {};
    for (var row in result) {
      map[row['category'] as String] = (row['total'] as num).toDouble();
    }
    return map;
  }

  Future<int> updateBudget(double budget) async {
    final db = await database;

    return await db.update(
      'budget',
      {'budget': budget},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<List<Map<String, dynamic>>> getAllCategoryBudgets() async {
    final db = await database;
    return await db.query(
      'budget',
      where: 'category != ?',
      whereArgs: ['Total'],
    );
  }

  Future<int> insertTransaction(TrangeactionModel transaction) async {
    final db = await database;
    return await db.insert("transaction_tbl", transaction.toMap());
  }

  Future<List<TrangeactionModel>> getAllTransaction() async {
    final db = await database;

    final result = await db.query("transaction_tbl", orderBy: "date DESC");

    return result.map((e) => TrangeactionModel.fromJson(e)).toList();
  }

  Future<List<Map<String, dynamic>>> getMonthlyIncomeExpenseRaw() async {
    final db = await database;
    return await db.rawQuery('''
    SELECT substr(date,4,2) as month, substr(date,7,4) as year, type, SUM(amount) as total
    FROM transaction_tbl
    GROUP BY year, month, type
    ORDER BY year, month
  ''');
  }

  Future<List<TrangeactionModel>> getIncome() async {
    final db = await database;

    final result = await db.query(
      "transaction_tbl",
      where: "type = ?",
      whereArgs: ["Income"],
    );

    return result.map((e) => TrangeactionModel.fromJson(e)).toList();
  }

  Future<double> getTotalIncome() async {
    final db = await database;

    final result = await db.rawQuery(
      '''
      SELECT SUM(amount) as totalIncome
      FROM transaction_tbl
      WHERE type = ?
''',
      ['Income'],
    );

    return (result.first['totalIncome'] as num?)?.toDouble() ?? 0.0;
  }

  Future<double> getTotalExpense() async {
    final db = await database;

    final result = await db.rawQuery(
      '''
      SELECT SUM(amount) as totalexpens
      FROM transaction_tbl
      WHERE type = ?
''',
      ['Expense'],
    );

    return (result.first['totalexpens'] as num?)?.toDouble() ?? 0.0;
  }

  Future<List<TrangeactionModel>> getExpense() async {
    final db = await database;

    final result = await db.query(
      "transaction_tbl",
      where: "type = ?",
      whereArgs: ["Expense"],
    );

    return result.map((e) => TrangeactionModel.fromJson(e)).toList();
  }

  Future<int> deleteTransaction(int id) async {
    final db = await database;

    return await db.delete(
      "tran_tbl", // Use your actual table name
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateTransaction(TrangeactionModel transaction) async {
    final db = await database;

    return await db.update(
      "tran_tbl",
      transaction.toMap(),
      where: "id = ?",
      whereArgs: [transaction.id],
    );
  }
}

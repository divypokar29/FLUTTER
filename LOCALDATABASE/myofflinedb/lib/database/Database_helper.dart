import 'package:flutter/material.dart';
import 'package:myofflinedb/Models/Todo_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  /* 
  heart of our  application which is contain all configuration regarding databse tables
  and all.

  we have to create one singleton class

  singletone class means one class - one databse for multiple screen.

    without singletone

    screen1 -> db1    x
    screen2 -> db2    x
    screen3 -> db3    x

    with singletone

    screen1
    screen2
    screen3 
            -----> db1 

      static : which is access by own class no need to crete seprate object.
      final : which cannot modify later - we cant change it value 
  */

  static final DatabaseHelper instance =
      DatabaseHelper._init(); // private constructure

  DatabaseHelper._init(); // private constructor wehich is only acces by this file only

  Database?
  _database; // crete object of databse - wehich is inherit from sqflite library

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      //db create
      _database = await _initDb("todo.db");
      return _database!;
    }
  }

  Future<Database> _initDb(String filename) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filename); // c:/myofflinedb/todo.db

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  //-------------- table creation ----------------
  Future<void> _createTable(Database db, int version) async {
    return await db.execute('''
            create table todo_tbl
            (
            id integer primary key auto_increment,
            title text not null,
            description text,
            category text,
            priority text ,
            status text,
            duedate text,
            createdAt text,
            )

''');
  }

  //------------- insert method -----------------
  Future<int> insertTodo(TodoModels todomodel) async {
    final db = await database;
    return db.insert("todo_tbl", todomodel.toMap());
  }

  // ------------------ read method----------------

  Future<List<TodoModels>> getAllTodos() async {
    final db = await database;
    final result = await db.query("todo_tbl", orderBy: "createdAt DESC");

    return result.map((element) => TodoModels.fromJson(element)).toList();
  }

  // ------------------ read method Statuswise----------------

  Future<List<TodoModels>> getAllTodosStatuswise(String status) async {
    final db = await database;
    final result = await db.query(
      "todo_tbl",
      where: "status = ?",
      whereArgs: [status],
      orderBy: "createdAt DESC",
    );

    return result.map((element) => TodoModels.fromJson(element)).toList();
  }

  // ------------------ read method priority----------------

  Future<List<TodoModels>> getAllTodosPrioritywise(String priority) async {
    final db = await database;
    final result = await db.query(
      "todo_tbl",
      where: "priority = ?",
      whereArgs: [priority],
      orderBy: "createdAt DESC",
    );

    return result.map((element) => TodoModels.fromJson(element)).toList();
  }

  // ------------------ read method categorywise----------------

  Future<List<TodoModels>> getAllTodosCategorywise(String category) async {
    final db = await database;
    final result = await db.query(
      "todo_tbl",
      where: "category = ?",
      whereArgs: [category],
      orderBy: "createdAt DESC",
    );

    return result.map((element) => TodoModels.fromJson(element)).toList();
  }
}

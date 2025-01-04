// Step 1 => create database helper class and make it singleton
// Step 2 => initialize a db for notes
// Step 3 => Retrieve notes from db as list

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    // This Line made the class lazy singleton
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(join(dbPath, "notes.db"), onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)");
    }, version: 1);
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return db.query("notes", orderBy: 'id DESC');
  }

  // Step 4 => write add , delete , edit functions
  Future<int> addNote(String title, String content) async {
    final db = await database;
    return db.insert(
        "notes",
        {
          'title': title,
          'content': content,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateNote(int id, String title, String content) async {
    final db = await database;
    return db.update(
      "notes",
      {
        'title': title,
        'content': content,
      },
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<int> deleteNote(int id, String title, String content) async {
    final db = await database;
    return db.delete(
      "notes",
      where: 'id=?',
      whereArgs: [id],
    );
  }
}

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_task1/domain/entities/categories.dart';

class StorageService {
//to create one instance of the database
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    //open connection to the database

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  deleteDataBaseI() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');
    return await deleteDatabase(path);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE category(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            color INTEGER,
            icon INTEGER
          )
          ''');
    await db.execute('''
      CREATE TABLE task(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        date TEXT,
        time TEXT,
        isCompleted INTEGER NOT NULL DEFAULT 0,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        categoryId INTEGER,
        FOREIGN KEY (categoryId) REFERENCES category(id)
      )
    ''');
  }
}

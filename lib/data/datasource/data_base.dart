import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_task1/domain/entities/categories.dart';
import 'package:training_task1/domain/entities/task.dart';

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

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        "task",
        task.toMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<void> createCategories(List<Category> categories) async {
    // get a reference to the database.
    final db = await database;
    final categories0 = categories.map((category) => category.toMap).toList();

    for (int i = 0; i < categories0.length; ++i) {
      await db.insert(
        "category",
        categories0[i],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('category $i is inserted');
    }
  }

  Future<int> toggleTaskCompletion(int taskId) async {
    final db = await database;
    return await db.rawUpdate(
        'UPDATE task SET isCompleted = 1 - isCompleted WHERE id = ?', [taskId]);
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "task",
      orderBy: "id DESC",
    );
    print('all tasks maps: $maps');
    return maps;
  }

  Future<Map<String, dynamic>> getSingleTask(int id) async {
    final db = await database;
    List<Map<String, dynamic>> maps =
        await db.query('task', where: "id = ?", whereArgs: [id], limit: 1);
    return maps.first;
  }

  Future<Map<String, dynamic>> findCategory(int categoryId) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query('category',
        where: "id = ?", whereArgs: [categoryId], limit: 1);
    return maps.first;
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "category",
      orderBy: "id DESC",
    );
    print('all categories maps: $maps');
    return maps;
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        "task",
        task.toMap,
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          "task",
          where: 'id = ?',
          whereArgs: [task.id],
        );
      },
    );
  }
}

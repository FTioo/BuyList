import 'package:buylist/Models/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database?> get database async {
    _database ??= await _initilizeDb();
    return _database;
  }

  final String _tableName = 'task';

  Future<Database> _initilizeDb() async {
    var db = openDatabase(join(await getDatabasesPath(), 'task_db.db'),
        onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY, 
          itemName TEXT, 
          quantity INTEGER, 
          price REAL, 
          date TEXT
        )''',
      );
    }, version: 1);
    return db;
  }

  Future<void> insertTask(TaskModel taskModel) async {
    final Database? db = await database;
    await db!.insert(_tableName, taskModel.toMap());
    print('Data has saved');
  }

  Future<List<TaskModel>> getTasks() async {
    final Database? db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tableName);
    return results.map((res) => TaskModel.fromMap(res)).toList();
  }

  Future<TaskModel> getTaskById(int id) async {
    final Database? db = await database;
    List<Map<String, dynamic>> results = await db!.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => TaskModel.fromMap(e)).first;
  }

  Future<void> updateTask(TaskModel taskModel) async {
    final db = await database;
    await db!.update(
      _tableName,
      taskModel.toMap(),
      where: 'id = ?',
      whereArgs: [taskModel.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

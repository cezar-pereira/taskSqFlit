import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDB {
  SqfliteDB._();
  static final SqfliteDB instance = SqfliteDB._();

  static Database? _database;

  Future<Database> get database async {
    return _database ?? await _initDatabase();
  }

  _initDatabase() async {
    String dbName = 'task.db';
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(db, version) async {
    await db.execute(_task);
  }

  String get _task => '''
    CREATE TABLE tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      isDone INTEGER NOT NULL,
      date INTEGER NOT NULL
    );
  ''';
}

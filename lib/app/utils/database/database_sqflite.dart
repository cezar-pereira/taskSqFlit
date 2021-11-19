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
    return openDatabase(path, version: 1, onCreate: _onCreate, onOpen: teste);
  }

  _onCreate(db, version) async {
    await db.execute(_task);
  }

  teste(db) async {
    db.insert('tasks', {'name': 'cezar', 'isDone': 1, 'date': 1637297290});
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

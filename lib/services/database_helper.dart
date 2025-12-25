import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'junco_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE checkups(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        disease_name TEXT,
        risk_level TEXT,
        confidence REAL
      )
    ''');
  }

  Future<int> insertCheckup(Map<String, dynamic> checkup) async {
    Database db = await database;
    return await db.insert('checkups', checkup);
  }

  Future<List<Map<String, dynamic>>> getCheckups() async {
    Database db = await database;
    return await db.query('checkups', orderBy: 'date DESC');
  }

  Future<int> getCheckupCount() async {
    Database db = await database;
    final count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM checkups'));
    return count ?? 0;
  }

  Future<Map<String, dynamic>?> getLastCheckup() async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('checkups', orderBy: 'id DESC', limit: 1);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<void> deleteAllCheckups() async {
    Database db = await database;
    await db.delete('checkups');
  }

  Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), 'junco_database.db');
    await deleteDatabase(path);
    _database = null;
  }
}

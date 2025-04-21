import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'student.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE student (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        stdname TEXT,
        stdphone TEXT,
        stdaddress TEXT,
        squran INTEGER,
        sarabic INTEGER,
        sbilogy INTEGER,
        schimastry INTEGER,
        senglish INTEGER,
        smathss INTEGER
      )
    ''');
  }

  Future<int> insertStudent(Student student) async {
    final db = await instance.database;
    return await db.insert('student', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    final db = await instance.database;
    final result = await db.query('student');
    return result.map((json) => Student.fromMap(json)).toList();
  }

  Future<int> getStudentCount() async {
    final db = await instance.database;
    final x = await db.rawQuery('SELECT COUNT(*) FROM student');
    int? count = Sqflite.firstIntValue(x);
    return count ?? 0;
  }
}

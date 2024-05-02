import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDB();
    return _database!;
  }

  static Future<Database> initializeDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'parking.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE ParkingPass(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            campusLocation TEXT,
            parkingLocation TEXT,
            parkingSpotNo TEXT,
            numberPlate TEXT,
            duration TEXT,
            amountPaid REAL,
            date TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertParkingPass(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('ParkingPass', data);
  }
  Future<int> updateParkingPass(int id, Map<String, dynamic> newData) async {
  final db = await database;
  return await db.update(
    'ParkingPass',
    newData,
    where: 'id = ?',
    whereArgs: [id],
  );
}
Future<int> deleteParkingPass(int id) async {
  final db = await database;
  return await db.delete(
    'ParkingPass',
    where: 'id = ?',
    whereArgs: [id],
  );
}


  Future<List<Map<String, dynamic>>> getParkingPassHistory() async {
    final db = await database;
    return await db.query('ParkingPass');
  }
}

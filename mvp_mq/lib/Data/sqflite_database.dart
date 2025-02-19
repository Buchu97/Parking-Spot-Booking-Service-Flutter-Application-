import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;
  static String? customDatabasePath;
  DatabaseHelper._();
  static DatabaseHelper get instance {
    _instance ??= DatabaseHelper._();
    return _instance!;
  }

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDB();
    return _database!;
  }

  static Future<Database> initializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'parking.db');
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
            startTime TEXT,
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

  Future<Map<String, dynamic>?> getParkingPassById(int id) async {
    final db = await database;
    List<Map<String, dynamic>?> maps = await db.query('ParkingPass',
        where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getParkingPassHistory() async {
    final db = await database;
    return await db.query('ParkingPass');
  }

  Future<void> deleteCustomDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'parking.db');
    await deleteDatabase(path);
    _database = null;
  }
}

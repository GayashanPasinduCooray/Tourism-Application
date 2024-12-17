import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/hotel.dart';

class DBHelper {
  static const String _dbName = 'hotels.db';
  static const String _tableName = 'favorites';
  static const int _dbVersion = 1;

  static Future<Database> _getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, _dbName),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $_tableName(
            name TEXT PRIMARY KEY,
            description TEXT,
            location TEXT,
            imageAssetPath TEXT
          )
          ''',
        );
      },
      version: _dbVersion,
    );
  }

  static Future<void> addFavorite(Hotel hotel) async {
    final db = await _getDatabase();
    await db.insert(
      _tableName,
      hotel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> removeFavorite(String hotelName) async {
    final db = await _getDatabase();
    await db.delete(
      _tableName,
      where: 'name = ?',
      whereArgs: [hotelName],
    );
  }

  static Future<List<Hotel>> getFavorites() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(
      maps.length,
          (i) => Hotel.fromMap(maps[i]),
    );
  }
}

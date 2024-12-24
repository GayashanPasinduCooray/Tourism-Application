import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/place.dart';

class DBHelperPlaces { // Updated to match the correct name
  static Database? _database;

  static Future<Database> _getDatabase() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    _database = await openDatabase(
      join(dbPath, 'favorites_places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites_places(name TEXT PRIMARY KEY)',
        );
      },
      version: 1,
    );
    return _database!;
  }

  static Future<void> addFavorite(Place place) async {
    final db = await _getDatabase();
    await db.insert(
      'favorites_places',
      {'name': place.name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> removeFavorite(String name) async {
    final db = await _getDatabase();
    await db.delete(
      'favorites_places',
      where: 'name = ?',
      whereArgs: [name],
    );
  }

  static Future<List<String>> getFavorites() async {
    final db = await _getDatabase();
    final result = await db.query('favorites_places');
    return result.map((row) => row['name'] as String).toList();
  }
}

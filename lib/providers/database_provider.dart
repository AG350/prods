import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database? _database;

  static final DatabaseProvider db = DatabaseProvider._();
  DatabaseProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Productos(
          id INTEGER PRIMARY KEY,
          codigo TEXT,
          precio FLOAT,
          descripcion TEXT,
          imagen TEXT,
        );
        CREATE TABLE Usuarios(
          id INTEGER PRIMARY KEY,
          user TEXT,
          pass FLOAT,
        );
      ''');
      },
    );
  }

  
}

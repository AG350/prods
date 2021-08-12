import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_crud/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductoProvider {
  static Database? _database;

  static final ProductoProvider db = ProductoProvider._();
  ProductoProvider._();

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
        )
      ''');
      },
    );
  }

  newScanRaw(Product producto) async {
    final codigo = producto.codigo;
    final descripcion = producto.descripcion;
    final imagen = producto.imagen;
    final precio = producto.precio;
    final db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Productos( codigo, descripcion, imagen, precio) VALUES ( $codigo,'$descripcion', '$imagen', '$precio')
    ''');
    print(res);
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    List<dynamic> list = res.isNotEmpty
        ? res.map((scans) => ScanModel.fromJson(scans)).toList()
        : [];
    return List.castFrom<dynamic, ScanModel>(list);
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'
    ''');
    List<dynamic> list = res.isNotEmpty
        ? res.map((scans) => ScanModel.fromJson(scans)).toList()
        : [];
    return List.castFrom<dynamic, ScanModel>(list);
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = db.delete('Scans');
    return res;
  }
}

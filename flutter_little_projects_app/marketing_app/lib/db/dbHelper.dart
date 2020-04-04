import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:marketing_app/models/product.dart';

class DbHelper {
  String tblProduct = "Products";

  String colId = "Id";

  String colDescription = "Description";

  String colPrice = "Price";

  String colName = "Name";

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();
  

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      // database yoksa oluşturuyoruz.
      _db = await initializeDb();
    }

    return _db;
  }

  //Database imizi oluşturuyoruz.

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + "marketing";

    var  dbMarketing = await openDatabase(path, version: 1, onCreate: _createDb);

    return dbMarketing;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "Create table $tblProduct($colId integer primary key, $colName text," +
            "$colDescription text, $colPrice int)");
  }

  //İnsert Operasyonu
  Future<int> insert(Product product) async {
    Database db = await this.db;
    var result = await db.insert(tblProduct, product.toMap());

    return result;
  }

  //Update Operasyonu

  Future<int> update(Product product) async {
    Database db = await this.db;
    var result = await db.update(tblProduct, product.toMap(),
        where: "$colId =?", whereArgs: [product.id]);

    return result;
  }

//Delete Operasyonu
  Future<int> delete(Product id) async {
    Database db = await this.db;

    // var result = await db.delete(tblProduct);
    var result =await db.rawDelete("Delete from $tblProduct where $colId = $id");

    return result;
  }

// Select Operasyonu
  Future<List> getProducts() async {
    Database db = await this.db;

    var result = await db.rawQuery("Select * from $tblProduct");

    return result;
  }
}

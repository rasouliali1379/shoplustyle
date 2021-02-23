import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const String TABLE_NAME = 'basket';
const String PRODUCT_ID = 'id';
const String PRODUCT_QUANTITY = 'quantity';

class BasketDB {
  static Database _database;
  static BasketDB _basketDB;

  BasketDB._createInstance();

  factory BasketDB() {
    if (_basketDB == null) {
      _basketDB = BasketDB._createInstance();
    }
    return _basketDB;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    final dir = await getDatabasesPath();
    final path = dir + "basket.db";

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $TABLE_NAME ( 
          $PRODUCT_ID integer primary key, 
          $PRODUCT_QUANTITY integer not null)
        ''');
      },
    );
    return database;
  }

  Future<void> insertProduct(Map<String, String> product) async {
    final db = await this.database;
    await db.insert(TABLE_NAME, product);
  }

  Future<void> updateProduct(Map<String, int> product) async {
    print(product["id"]);
    final db = await this.database;
    final response = await db.update(TABLE_NAME, product,
        where: '$PRODUCT_ID = ?', whereArgs: [product["id"]]);
    print(response);
  }

  Future<List<Map<String, dynamic>>> getBasketContent() async {
    final db = await this.database;
    final result = await db.query(TABLE_NAME);
    return result;
  }

  Future<int> delete(int id) async {
    final db = await this.database;
    print('$PRODUCT_ID = ?' + id.toString());
    return await db
        .delete(TABLE_NAME, where: '$PRODUCT_ID = ?', whereArgs: [id]);
  }
}

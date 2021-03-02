import 'package:envanto/constants.dart';
import 'package:envanto/models/cart_model.dart';
import 'package:envanto/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OfflineDatabaseHelper {
  OfflineDatabaseHelper._();

  static final OfflineDatabaseHelper db = OfflineDatabaseHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
      CREATE TABLE $tableCartProduct(
        $colName TEXT NOT NULL,
        $colImage TEXT NOT NULL,
        $colQuantity INTEGER NOT NULL,
        $colPrice TEXT NOT NULL,
        $colProductId TEXT NOT NULL)
        ''',
        );
      },
    );
  }

  insertToDb(CartModel cartModel) async {
    var dbClient = await database;

    await dbClient.insert(
      tableCartProduct,
      cartModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartModel>> getAllProductFromDb() async {
    var dbClient = await database;
    List<Map> data = await dbClient.query(tableCartProduct);

    List<CartModel> listCartModel = data.isNotEmpty
        ? data.map((product) => CartModel.fromJson(product)).toList()
        : [];

    return listCartModel;
  }

  updateProduct(CartModel model) async {
    var dbClient = await database;
    return dbClient.update(tableCartProduct, model.toJson(),
        where: '$colProductId = ?', whereArgs: [model.productId]);
  }
}

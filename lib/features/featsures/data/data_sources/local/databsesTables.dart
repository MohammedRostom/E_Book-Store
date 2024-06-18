import 'dart:async';
import 'package:flutter_application_2/features/featsures/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/book_model.dart';
import '../../models/single_booktModel.dart';

final CartTable = "CartTable1";
final FavoriteTable = "FavoriteTable1";
final UserTable = "UserTable";

class DataBasesHelper {
  DataBasesHelper._();
  static final DataBasesHelper db = DataBasesHelper._();

  static Database? _dataBases;
  Future<Database?> get dataBases async {
    if (_dataBases == null) {
      _dataBases = await initializeDatabaseMethod();
    }
    return _dataBases;
  }

  Future<Database> initializeDatabaseMethod() async {
    String path = join(await getDatabasesPath(), "database.db");
    Database myData = await openDatabase(path, version: 3, onCreate: onCereate);
    return myData;
  }

  Future<void> onCereate(Database db, int version) async {
    await db.execute('''CREATE TABLE $FavoriteTable 
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
         title TEXT,
         subtitle TEXT ,
         isbn13 TEXT,
         price TEXT,
         image TEXT,
         url TEXT)''');
    print("+++++++++++++++++ Ceate FavoriteTable +++++++++++++++++");

    await db.execute('''
  CREATE TABLE $CartTable ( 
    id INTEGER PRIMARY KEY ,
    error TEXT,
    title TEXT,
    subtitle TEXT,
    authors TEXT,
    publisher TEXT,
    language TEXT,
    isbn10 TEXT,
    isbn13 TEXT,
    pages TEXT,
    year TEXT,
    rating TEXT,
    desc TEXT,
    price TEXT,
    image TEXT,
    url TEXT
  )

''');

    print("+++++++++++++++++ Ceate CartTable +++++++++++++++++");
  }

//insert CartTable
  Future<bool?> insertIntoCart({required single_booktModel model}) async {
    try {
      var dbClient = await dataBases;

      await dbClient!.insert("${CartTable}", model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print("+++++++++++++++++${model.toJson()}+++++++++++++++++");
      return true;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

//insert FavoriteTable
  Future<bool?> insertIntoFav({required BookItem model}) async {
    try {
      var dbClient = await dataBases;

      await dbClient!.insert("${FavoriteTable}", model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print("+++++++++++++++++${model.toJson()["id"]}+++++++++++++++++");
      return true;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<List<single_booktModel?>> GetDataAllfromCartTable() async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(CartTable);

    List<single_booktModel> list = maps.isNotEmpty
        ? maps.map((Book) => single_booktModel.fromJson(Book)).toList()
        : [];

    return list;
  }

  Future<List<UserModel?>> GetDataAllfromUSerTable() async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(UserTable);

    List<UserModel> list = maps.isNotEmpty
        ? maps.map((user) => UserModel.fromJson(user)).toList()
        : [];

    return list;
  }

  Future<List<BookItem?>> GetDataAllfromFavoriteTable() async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(FavoriteTable);
    List<BookItem> list = maps.isNotEmpty
        ? maps.map((Book) => BookItem.fromJson(Book)).toList()
        : [];

    return list;
  }

  Future<void> DeleteFromFavoriteTable(int id) async {
    var dbClient = await dataBases;
    await dbClient!.delete(
      "$FavoriteTable",
      where: "id = ?",
      whereArgs: [id],
    );
    print("+++++++++++++++++ Hello deleted Iteam  +++++++++++++++++");
  }

  Future<void> DeleteFromCartTable(
    int id,
  ) async {
    var dbClient = await dataBases;
    await dbClient!.delete(
      "$CartTable",
      where: "id = ?",
      whereArgs: [id],
    );
    print("+++++++++++++++++ Hello deleted Iteam  +++++++++++++++++");
  }
}


//   Future<void> DeleteDataOnlyOneRowFromFav(int id) async {
//     var dbClient = await dataBases;
//     await dbClient!.delete(
//       "${constant.FavoriteTable}",
//       where: "id = ?",
//       whereArgs: [id],
//     );
//     print(
//         "+++++++++++++++++ Hello deleted one FavoriteTable +++++++++++++++++");
//   }
// }
// / static int amounn = 1;
// Future<ProductModel?> UpdattDataInUserModel(
//     ProductModel product, int amountfromi) async {
//   amounn = amountfromi;
//   emit(Change_Valuefrom_Action());
//   var dbClient = await dataBases;
//   await dbClient!.update(
//     "${constant.CartTable}",
//     product.toMap(),
//     where: "id=?",
//     whereArgs: [product.id],
//   );
//   emit(Change_Valuefrom_Action());
//   print("+++++++++++++++++ Hello Updated +++++++++++++++++");
// }


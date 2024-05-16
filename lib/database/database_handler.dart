import "dart:ffi";
import "package:flutter/material.dart";
import 'package:shopping_app/components/list.dart';
import "package:shopping_app/login_page.dart";
import "package:shopping_app/screens/HomeScreen.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
import "dart:async";

import 'tables_classes.dart';

class DataBaseHandler{
  static Database? _db;
  static const String DATABASE = 'ShoppingApp.db';
  static const int VERSION = 1;

  // Future<Database>get_db() async{
  //   print("db is null");
  //   String path = join(await getDatabasesPath(), DATABASE);
  //   final _db = await openDatabase(path , version: VERSION ,  onCreate: _onCreate , onUpgrade: _onUpgrade);
  //   if(_db != null)print("db is not null");
  //   return _db;
  // }
  

  Future<Database> get db async{
    if(_db == null){
      String path = join(await getDatabasesPath(), DATABASE);
      _db = await openDatabase(path , version: VERSION ,onCreate: _onCreate , onUpgrade: _onUpgrade);
    }
    return _db!;
  }

  _onCreate(Database db, int version)async {
    print("in oncreate");
    await db.execute('PRAGMA foreign_keys = ON');
    print("foreign keys");
    //Create tables
    await createTables(db);
    print("Created tables");
    //insert all product and types
    await insertAllProducts(products , db);
    print("inserted products");
    await insertAllTypes(types , db);
    print("inserted types");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion)async {
    await db.execute('drop table product');
    await db.execute('drop table type');
    await _onCreate(db , newVersion);
  }


  //create tables function
  static Future<void> createTables(Database db) async{

    //creating type table
    await db.execute("CREATE TABLE type(id INTEGER PRIMARY KEY, name varchar(20))");

    //creating product table
    await db.execute('''
      CREATE TABLE product(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        typeID INTEGER,
        name TEXT,
        desc TEXT,
        price INTEGER,
        image TEXT,
        FOREIGN KEY (typeID) REFERENCES type(id)
      )
    ''');

    //creating user
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        mail TEXT,
        pass TEXT
      )
    ''');

    //creating cart table
    await db.execute('''
      CREATE TABLE cart(
        userID INTEGER,
        productID INTEGER,
        FOREIGN KEY (userID) REFERENCES user(id),
        FOREIGN KEY (productID) REFERENCES product(id)
      )
    ''');
  }


  //Manipulating product table

  //insert All products
  Future<void> insertAllProducts(List<Map<String , dynamic>> products , Database db) async {
    for(Map<String , dynamic> i in products){
      product p = product(id: i['id'] , typeID: i['typeID'],name: i['name'], desc: i['desc'] , price: i['price'] , image: i['image'] );
      int id = await db.insert(
        'product',
        p.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      p.id = id;
    }
  }

  //insert one product
  Future<void> insertProduct(product p) async {
    Database dbClient = await db;
      int id = await dbClient.insert(
        'product',
        p.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      p.id = id;
  }

  //get All products
  Future<List<product>> getAllProducts() async{
    print("aloo");
    Database dbClient = await db;
    print("aloo2");
    final List<Map<String , dynamic>>productsn = await dbClient.query('product');
    print(productsn);
    return List.generate(productsn.length, (i){
      return product(
        id: productsn[i]['id'],
        typeID: productsn[i]['typeID'],
        name: productsn[i]['name'],
        desc: productsn[i]['desc'],
        price: productsn[i]['price'],
        image: productsn[i]['image'],
      );
    });
  }


  Future<List<product>> getProductsById(List<int>ids) async{
    print("aloo");
    Database dbClient = await db;
    print("aloo2");
    List<List<Map<String , dynamic>>>?productsn;
    for(int id in ids)productsn!.add(await dbClient.query('product' , where: 'id = ?' , whereArgs: [id]));
    //print(productsn);
    return List.generate(productsn!.length, (i){
      return product(
        id: productsn[i][0]['id'],
        typeID: productsn[i][0]['typeID'],
        name: productsn[i][0]['name'],
        desc: productsn[i][0]['desc'],
        price: productsn[i][0]['price'],
        image: productsn[i][0]['image'],
      );
    });
  }


  //Manipulating types table


  //insert All Types
  Future<void> insertAllTypes(List<Map<String , dynamic>> types , Database db) async {
    for(Map<String , dynamic> i in types){
      type t = type(id:i['id'], name: i['name']);
      await db.insert(
        'type',
        t.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  //insert one type
  Future<void> insertType(type t) async {
    Database dbClient = await db;
      await dbClient.insert(
        'type',
        t.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }
  

  //get All types
  Future<List<type>> getAllTypes() async{
    Database dbClient = await db;
    final List<Map<String , dynamic>>types = await dbClient.query('type');

    return List.generate(types.length, (i){
      return type(
        id: types[i]['id'],
        name: types[i]['name'],
      );
    });
  }


  //Manipulating user table

  //insert user

  Future<void> insertUser(user u) async {
    Database dbClient = await db;
      int id = await dbClient.insert(
        'user',
        u.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      u.id = id;
  }


  //get user
  Future<user?> getUserByID(int id)async {
    Database dbClient = await db;
    final List<Map<String , dynamic>>mp = await dbClient.query(
      'user',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if(mp.isNotEmpty)return user(id: mp[0]['id'] , name: mp[0]['name'] , mail: mp[0]['mail'] , pass: mp[0]['pass']);
    return null;
  }

  Future<user?> getUserByMail(String Mail)async {
    Database dbClient = await db;
    final List<Map<String , dynamic>>mp = await dbClient.query(
      'user',
      where: 'mail = ?',
      whereArgs: [Mail],
      limit: 1,
    );
    if(mp.isEmpty)return null;
    return user(id: mp[0]['id'] , name: mp[0]['name'] , mail: mp[0]['mail'] , pass: mp[0]['pass']);
  }

  //Manipulating the cart table
  //insert in cart
  Future<void> insertCart(int user_ID , int product_ID) async {
    Database dbClient = await db;
      cart c = new cart(userID: user_ID , productID: product_ID);
      await dbClient.insert(
        'cart',
        c.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }


  //get All from cart
  Future<List<cart>> getAllcart(int user_ID) async{
    Database dbClient = await db;
    final List<Map<String , dynamic>>products = await dbClient.query(
      'cart',
      where: 'id = ?',
      whereArgs: [user_ID], 
    );

    return List.generate(products.length, (i){
      return cart(
        userID: products[i]['userID'],
        productID: products[i]['productID'],
      );
    });
  }
}
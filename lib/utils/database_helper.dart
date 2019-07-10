import 'dart:io';

import 'package:database_intro/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper().internal();

  factory DatabaseHelper() => _instance;

  final String tableUser = "userTable";
  final String columnId = "id";
  final String columnUserName = "username";
  final String columnPassword = "password";
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper internal() {}

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  /*
    id| username| password
    ------------------------
    1 | wilson  | wilson
    2 | juan    | juan
   */
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY, $columnUserName TEXT, $columnPassword TEXT)");
  }

  //CRUD -CREATE - READ-UPDATE -DELETE

//insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableUser", user.toMap());

    return res;
  }
}

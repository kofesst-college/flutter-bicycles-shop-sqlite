// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bicycles_shop/common/crypt_helper.dart';
import 'package:bicycles_shop/common/queries.dart';
import 'package:bicycles_shop/common/tables.dart';
import 'package:bicycles_shop/data/user_entity.dart';
import 'package:bicycles_shop/domain/role.dart';
import 'package:bicycles_shop/domain/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  final int _version = 3;
  late final String _databaseFilePath;
  late final Database _database;

  Future<void> init() async {
    var fileDirectory = await path_provider.getApplicationDocumentsDirectory();
    _databaseFilePath = join(fileDirectory.path, 'bicycle_base.db');

    _database = await openDatabase(
      _databaseFilePath,
      version: _version,
      onUpgrade: (db, oldV, newV) => _onUpgrade(db),
      onDowngrade: (db, oldV, newV) => _onUpgrade(db),
      onConfigure: (db) => {_createTables(db)},
    );
    print("initializing");
  }

  Future<void> _onUpgrade(Database database) async {
    for (var table in Table.values) {
      await database.execute(DatabaseQuery.getDeleteTableQuery(table));
      print("delete table ${table.tableName}");
    }

    await _createTables(database);
  }

  Future<void> _createTables(Database database) async {
    for (var table in Table.values) {
      await database.execute(DatabaseQuery.getCreateTableQuery(table));
      print("create table ${table.tableName}");
    }
  }

  Future<void> dropDatabase() async {
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    } else {
      await deleteDatabase(_databaseFilePath);
    }
    await _database.close();
    print("closed db");
  }

  Future<User?> signIn(String login, String password) async {
    final encryptedPassword = CryptHelper.encrypt(password);
    List<Map<String, dynamic>> resultMaps = await _database.query(
        Table.users.tableName,
        where: 'login = ? and password = ?',
        whereArgs: [login, encryptedPassword]);

    if (resultMaps.isEmpty) return null;

    Map<String, dynamic> resultMap = resultMaps.first;
    print(resultMap);
    return UserEntity.fromMap(resultMap).toUser();
  }

  Future<User?> signUp(String login, String password, Role role) async {
    final encryptedPassword = CryptHelper.encrypt(password);
    try {
      await _database
          .execute("insert into ${Table.users.tableName}(login,password,role) "
          "values('$login', '$encryptedPassword', ${role.index});");

      List<Map<String, dynamic>> resultMaps = await _database.query(
          Table.users.tableName,
          where: 'login = ?',
          whereArgs: [login]);

      if (resultMaps.isEmpty) return null;

      Map<String, dynamic> resultMap = resultMaps.first;
      return UserEntity.fromMap(resultMap).toUser();
    } catch (e, s) {
      return null;
    }
  }
}

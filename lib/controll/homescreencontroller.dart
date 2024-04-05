import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:thursday040424/model/studentmodel.dart';

class HomeScreencontroller {
  static late Database database;
  static List<Map<String, Object?>> data = [];
  static List<studentModel> studentlist =[];
  static Future<void> initDb() async {
    Database database = await openDatabase("sample.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Student (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

  static addData() async {
    await database.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?)', ['name', 12345678]);
  }

  static Future<void> getData() async {
    var data = await database.rawQuery('SELECT * FROM Student');
    log(data.toString());
  }
}

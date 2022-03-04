import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {

  Future<Database> open() async {
    return await openDatabase(
        join((await getDatabasesPath()), 'sample_database.db'),
        onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    var createQuery = await rootBundle.loadString('assets/db/create/create.sql');
    db.transaction((txn) async {
      for (String query in splitQuery(createQuery)) {
        txn.execute(query);
      }
    });
  }
}

Iterable<String> splitQuery(String query) => query
    .split(";")
    .map(
      (e) => e.trim().replaceAll("\r\n", ""),
)
    .where(
      (e) => e.isNotEmpty,
);

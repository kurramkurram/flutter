import 'package:flutter_app/data/model/book.dart';
import 'package:flutter_app/util/log.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDataSource {
  Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      '${(await getDatabasesPath())}/books_database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Book (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXt not null, author_name TEXT, isbn TEXT, tag TEXT, state INTEGER)',
        );
      },
    );
  }

  Future<List<Docs>> select() async {
    final result = await (await database).query('Book');

    final List<Docs> list = [];
    for (var map in result) {
      Log.d('result = ${map['id']}');
      list.add(Docs.fromMap(map));
    }
    return Future.value(list);
  }

  Future<int> insert(Docs docs) async {
    return (await database).insert(
      'Book',
      docs.toMap(),
    );
  }

  Future<int> update(Docs docs) async {
    final docsMap = docs.toMap();
    return (await database).update(
      'Book',
      docsMap,
      where: 'title = ? AND isbn = ?',
      whereArgs: [docsMap['title'], docsMap['isbn']],
    );
  }

  Future<int> delete(Docs docs) async {
    final docsMap = docs.toMap();
    return (await database).delete(
      'Book',
      where: 'title = ? AND isbn = ?',
      whereArgs: [docsMap['title'], docsMap['isbn']],
    );
  }
}

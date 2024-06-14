import 'package:dio/dio.dart';
import 'package:flutter_app/data/data_source/book_database_data_source.dart';
import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:flutter_app/data/model/book.dart';
import 'package:flutter_app/util/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookRepositoryProvider = Provider<BookRepository>(
  (ref) => BookRepository(ref),
);

class BookRepository {
  BookRepository(this._ref);

  final Ref _ref;

  Future<Books> fetchBooks(String title, Dio dio) async {
    final bookRemote = _ref.read(bookRemoteDataSourceProvider(dio));
    return await bookRemote.fetchBooks(title);
  }

  Future<Books> fetchReadBook() async {
    final bookDatabase = _ref.read(bookDatabaseDataSourceProvider);
    return Books(await bookDatabase.select());
  }

  Future<void> deletReadBook(Docs docs) async {
    final bookDatabase = _ref.read(bookDatabaseDataSourceProvider);
    await bookDatabase.delete(docs);
  }

  Future<void> insertReadBook(Docs docs) async {
    final bookDatabase = _ref.read(bookDatabaseDataSourceProvider);
    final id = await bookDatabase.insert(docs);
    Log.d('id = $id');
  }

  Future<void> updateReadBook(Docs docs) async {
    final bookDatabase = _ref.read(bookDatabaseDataSourceProvider);
    final id = await bookDatabase.update(docs);
    Log.d('id = $id');
  }
}

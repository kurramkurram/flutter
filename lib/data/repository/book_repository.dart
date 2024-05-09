import 'package:dio/dio.dart';
import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookRepositoryProvider = Provider.family<BookRepository, Dio>(
  (ref, dio) => BookRepository(ref, dio),
);

class BookRepository {
  BookRepository(this._ref, this._dio);

  final Ref _ref;
  final Dio _dio;

  Future<Books> fetchBooks(String title) async {
    final bookRemote = _ref.read(bookRemoteDataSourceProvider(_dio));
    return await bookRemote.fetchBooks(title);
  }
}

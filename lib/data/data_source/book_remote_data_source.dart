import 'package:dio/dio.dart';
import 'package:flutter_app/data/model/book.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';

part 'book_remote_data_source.g.dart';

final bookRemoteDataSourceProvider = Provider.family<BookRemoteDataSource, Dio>(
  (ref, dio) => BookRemoteDataSource(dio),
);

@RestApi(baseUrl: 'https://openlibrary.org/')
abstract class BookRemoteDataSource {
  factory BookRemoteDataSource(Dio dio, {String baseUrl}) =
      _BookRemoteDataSource;

  @GET('search.json?q={title}&fields=key,title,author_name,isbn')
  Future<Books> fetchBooks(@Path('title') String title);
}

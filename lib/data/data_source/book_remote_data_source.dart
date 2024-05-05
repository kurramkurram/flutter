import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

@JsonSerializable()
class Books {
  const Books(this.docs);
  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);

  final List<Docs>? docs;

  Map<String, dynamic> toJson() => _$BooksToJson(this);
}

@JsonSerializable()
class Docs {
  Docs(this.title, this.authorName, this.isbn);

  factory Docs.fromJson(Map<String, dynamic> json) => _$DocsFromJson(json);

  final String? title;
  @JsonKey(name: 'author_name') List<String>? authorName;
  final List<String>? isbn;

  Map<String, dynamic> toJson() => _$DocsToJson(this);
}

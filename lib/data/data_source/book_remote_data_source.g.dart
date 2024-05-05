// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_remote_data_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) => Books(
      (json['docs'] as List<dynamic>?)
          ?.map((e) => Docs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'docs': instance.docs,
    };

Docs _$DocsFromJson(Map<String, dynamic> json) => Docs(
      json['title'] as String?,
      (json['author_name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['isbn'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DocsToJson(Docs instance) => <String, dynamic>{
      'title': instance.title,
      'author_name': instance.authorName,
      'isbn': instance.isbn,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BookRemoteDataSource implements BookRemoteDataSource {
  _BookRemoteDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://openlibrary.org/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Books> fetchBooks(String title) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Books>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'search.json?q=${title}&fields=key,title,author_name,isbn',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Books.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.g.dart';

enum ReadState {
  /// 読んでない
  unread,

  /// 読んだ
  read,

  /// 読みたい
  wantRead,
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

  /// タイトル
  final String? title;

  /// 著者名
  @JsonKey(name: 'author_name')
  List<String>? authorName;

  /// isbn
  final List<String>? isbn;

  /// タグ付け
  List<String>? tag;

  /// 読書状態
  ReadState? state;

  Map<String, dynamic> toJson() => _$DocsToJson(this);
}

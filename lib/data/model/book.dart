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

extension ReadStateExtension on ReadState {
  int get id {
    switch (this) {
      case ReadState.unread:
        return 0;
      case ReadState.read:
        return 1;
      case ReadState.wantRead:
        return 2;
    }
  }

  static ReadState getState(int id) {
    for (var state in ReadState.values) {
      if (state.id == id) return state;
    }
    return ReadState.unread;
  }
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
  Docs(
    this.title,
    this.authorName,
    this.isbn, {
    this.tag,
    this.state = ReadState.unread,
  });

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
  @Default(ReadState.unread)
  ReadState state;

  Map<String, dynamic> toJson() => _$DocsToJson(this);

  Map<String, dynamic> toMap() {
    final author = authorName?.isNotEmpty ?? false ? authorName?.first : null;
    final i = isbn?.isNotEmpty ?? false ? isbn?.first : null;
    return {
      "title": title,
      "author_name": author,
      "isbn": i,
      "tag": tag?.first,
      "state": state.id,
    };
  }

  factory Docs.fromMap(Map<String, dynamic> map) {
    final List<String>? authorName =
        map['author_name'] == null ? null : [map['author_name']];
    final List<String>? isbn = map['isbn'] == null ? null : [map['isbn']];
    final List<String>? tag = map['tag'] == null ? null : [map['tag']];
    final state = ReadStateExtension.getState(map['state'] as int);

    return Docs(
      map["title"],
      authorName,
      isbn,
      tag: tag,
      state: state,
    );
  }
}

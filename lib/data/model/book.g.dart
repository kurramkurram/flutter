// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

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
    )
      ..tag = (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..state = $enumDecodeNullable(_$ReadStateEnumMap, json['state']);

Map<String, dynamic> _$DocsToJson(Docs instance) => <String, dynamic>{
      'title': instance.title,
      'author_name': instance.authorName,
      'isbn': instance.isbn,
      'tag': instance.tag,
      'state': _$ReadStateEnumMap[instance.state],
    };

const _$ReadStateEnumMap = {
  ReadState.unread: 'unread',
  ReadState.read: 'read',
  ReadState.wantRead: 'wantRead',
};

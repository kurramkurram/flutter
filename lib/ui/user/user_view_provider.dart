import 'package:dio/dio.dart';
import 'package:flutter_app/data/model/book.dart';
import 'package:flutter_app/data/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewProvider = FutureProvider((ref) async {
  final dio = Dio();
  return await ref.read(userRepositoryProvider(dio)).fetchPerson('Shakespeare');
});

final userViewRecommendProvider = FutureProvider((ref) async {
  // 今は固定で表示させる
  return [
    Docs('The Toyota Way', [], ['9780071392310']),
    Docs('One Piece', [], ['9788468471525']),
    Docs('Atomic Kotlin', [], ['0981872557']),
    Docs('名探偵コナン', [], ['409850717X']),
    Docs('Steve Jobs', [], ['2709638320']),
    Docs('Harry Potter', [], ['9788498384505']),
  ];
});

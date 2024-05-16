import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:flutter_app/data/repository/book_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchViewModelProvider = AsyncNotifierProvider<SeacrhViewModel, Books>(
  () => SeacrhViewModel(),
);

class SeacrhViewModel extends AsyncNotifier<Books> {
  @override
  FutureOr<Books> build() async {
    // 初期値としては何も表示しない
    return const Books([]);
  }

  FutureOr<void> search(String title) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final dio = Dio();
      return await ref.read(bookRepositoryProvider(dio)).fetchBooks(title);
    });
  }
}

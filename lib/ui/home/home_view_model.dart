import 'dart:async';

import 'package:flutter_app/data/model/book.dart';
import 'package:flutter_app/data/repository/book_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, Books>(
  () => HomeViewModel(),
);

class HomeViewModel extends AsyncNotifier<Books> {
  @override
  FutureOr<Books> build() async =>
      await ref.read(bookRepositoryProvider).fetchReadBook();
}

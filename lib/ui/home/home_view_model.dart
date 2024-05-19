import 'dart:async';

import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, Books>(
  () => HomeViewModel(),
);

class HomeViewModel extends AsyncNotifier<Books> {
  @override
  FutureOr<Books> build() {
    return const Books([]);
  }
}

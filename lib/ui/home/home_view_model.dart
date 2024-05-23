import 'dart:async';

import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, Books>(
  () => HomeViewModel(),
);

class HomeViewModel extends AsyncNotifier<Books> {
  @override
  FutureOr<Books> build() {
    return Books([
      Docs('The Toyota Way', [], ['9780071392310']),
      Docs('One Piece', [], ['9788468471525']),
      Docs('Atomic Kotlin', [], ['0981872557']),
      Docs('名探偵コナン', [], ['409850717X']),
      Docs('Steve Jobs', [], ['2709638320']),
      Docs('Harry Potter', [], ['9788498384505']),
      Docs('The Toyota Way', [], ['9780071392310']),
      Docs('One Piece', [], ['9788468471525']),
      Docs('Atomic Kotlin', [], ['0981872557']),
      Docs('名探偵コナン', [], ['409850717X']),
      Docs('Steve Jobs', [], ['2709638320']),
      Docs('Harry Potter', [], ['9788498384505']),
      Docs('The Toyota Way', [], ['9780071392310']),
      Docs('One Piece', [], ['9788468471525']),
      Docs('Atomic Kotlin', [], ['0981872557']),
      Docs('名探偵コナン', [], ['409850717X']),
      Docs('Steve Jobs', [], ['2709638320']),
      Docs('Harry Potter', [], ['9788498384505']),
    ]);
  }
}

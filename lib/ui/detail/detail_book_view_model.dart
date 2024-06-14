import 'package:flutter_app/data/model/book.dart';
import 'package:flutter_app/data/repository/book_repository.dart';
import 'package:flutter_app/ui/detail/detail_book_in_route.dart';
import 'package:flutter_app/ui/home/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final detailBookProvider = StateProvider((ref) => Docs(null, null, null));

final detailBookViewModelProvider =
    AsyncNotifierProvider<DetailBookViewModel, Docs>(
  () => DetailBookViewModel(),
);

class DetailBookViewModel extends AsyncNotifier<Docs> {
  @override
  Future<Docs> build() async {
    return await ref.read(detailBookProvider);
  }

  Future<void> delete() async {
    final docs = ref.read(detailBookProvider.notifier).state;
    await ref.read(bookRepositoryProvider).deletReadBook(docs);
    ref.read(detailBookProvider.notifier).state = Docs(null, null, null);
  }

  Future<void> read(DetailBookInRoute route) async {
    ref.read(detailBookProvider.notifier).state.state = ReadState.read;
    final docs = ref.read(detailBookProvider.notifier).state;

    switch (route) {
      case DetailBookInRoute.home:
        await ref.read(bookRepositoryProvider).updateReadBook(docs);
        break;
      case DetailBookInRoute.search:
        await ref.read(bookRepositoryProvider).insertReadBook(docs);
        break;
    }
    ref.invalidate(homeViewModelProvider);
  }

  Future<void> wantRead(DetailBookInRoute route) async {
    ref.read(detailBookProvider.notifier).state.state = ReadState.wantRead;
    final docs = ref.read(detailBookProvider.notifier).state;

    switch (route) {
      case DetailBookInRoute.home:
        await ref.read(bookRepositoryProvider).updateReadBook(docs);
        break;
      case DetailBookInRoute.search:
        await ref.read(bookRepositoryProvider).insertReadBook(docs);
        break;
    }
    ref.invalidate(homeViewModelProvider);
  }
}

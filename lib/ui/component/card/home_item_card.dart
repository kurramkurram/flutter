import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:flutter_app/ui/detail/detail_book_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeItemcard extends HookConsumerWidget {
  const HomeItemcard({
    super.key,
    required this.docs,
  });

  /// 書籍の情報
  final Docs docs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isbn = docs.isbn?.first;

    return Center(
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailBookView(
                index: -1,
                docs: docs,
              ),
            ),
          )
        },
        child: Hero(
          tag: isbn!,
          child: Image.network(
            'https://covers.openlibrary.org/b/isbn/$isbn-M.jpg',
            height: 300,
            width: 180,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              height: 300,
              width: 180,
            ),
          ),
        ),
      ),
    );
  }
}

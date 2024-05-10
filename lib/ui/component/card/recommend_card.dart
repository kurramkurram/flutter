import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecommendCard extends HookConsumerWidget {
  const RecommendCard({
    super.key,
    required this.docs,
  });

  /// 書籍の情報
  final Docs docs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 10,
      child: Image.network(
        'https://covers.openlibrary.org/b/isbn/${docs.isbn?.first}-M.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}

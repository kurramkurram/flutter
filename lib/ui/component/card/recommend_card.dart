import 'package:cached_network_image/cached_network_image.dart';
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
    return Center(
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl:
            'https://covers.openlibrary.org/b/isbn/${docs.isbn?.first}-M.jpg',
      ),
    );
  }
}

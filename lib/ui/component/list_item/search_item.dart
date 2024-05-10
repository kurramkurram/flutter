import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SerachItem extends HookConsumerWidget {
  const SerachItem({
    super.key,
    required this.title,
    this.isbn,
    this.author,
  });

  final String title;
  final String? author;
  final String? isbn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (isbn != null) ...[
            Image.network(
              'https://covers.openlibrary.org/b/isbn/${isbn!}-M.jpg',
              height: 100,
              width: 60,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 100,
                width: 60,
              ),
            ),
          ] else ...[
            const SizedBox(height: 100, width: 60),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                if (author != null) ...[
                  Text(author!),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}

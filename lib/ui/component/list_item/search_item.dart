import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SerachItem extends HookConsumerWidget {
  const SerachItem({
    super.key,
    required this.index,
    required this.title,
    this.isbn,
    this.author,
  });

  final int index;
  final String title;
  final String? author;
  final String? isbn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (isbn != null) ...[
            Hero(
              tag: isbn!,
              child: Image.network(
                'https://covers.openlibrary.org/b/isbn/${isbn!}-M.jpg',
                height: 100,
                width: 60,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 100,
                  width: 60,
                ),
              ),
            ),
          ] else ...[
            const SizedBox(height: 100, width: 60),
          ],
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: '$title$index',
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (author != null) ...[
                  Hero(
                    tag: '$author$index',
                    child: Text(
                      author!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}

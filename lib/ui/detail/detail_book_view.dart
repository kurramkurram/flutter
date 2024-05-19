import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailBookView extends HookConsumerWidget {
  const DetailBookView({
    super.key,
    required this.index,
    required this.title,
    this.author,
    this.isbn,
  });

  final int index;
  final String title;
  final String? author;
  final String? isbn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(l10n.drawer_about_app),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isbn != null) ...[
                    Hero(
                      tag: isbn!,
                      child: Image.network(
                        'https://covers.openlibrary.org/b/isbn/${isbn!}-M.jpg',
                        height: 300,
                        width: 180,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(
                          height: 300,
                          width: 180,
                        ),
                      ),
                    ),
                  ] else ...[
                    const SizedBox(height: 300, width: 180),
                  ],
                  const Divider(),
                  const SizedBox(height: 24),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.detail_book_title),
                            Hero(
                              tag: '$title$index',
                              child: Text(
                                title,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (author != null) ...[
                              Text(l10n.detail_book_author
                              ),
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
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/book_remote_data_source.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailBookView extends HookConsumerWidget {
  const DetailBookView({
    super.key,
    required this.index,
    required this.docs,
  });

  final int index;
  final Docs docs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    final isbn = docs.isbn?.first;
    final title = docs.title!;
    final author =
        docs.authorName?.isNotEmpty ?? false ? docs.authorName?.first : null;

    titleName() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.detail_book_title),
            if (index != -1) ...[
              Hero(
                tag: '$title$index',
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ] else ...[
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
            const SizedBox(height: 12),
          ],
        );

    authorName() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (author != null) ...[
              Text(l10n.detail_book_author),
              if (index != -1) ...[
                Hero(
                  tag: '$author$index',
                  child: Text(
                    author,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ] else ...[
                Text(
                  author,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
              const SizedBox(height: 12),
            ],
          ],
        );

    tag() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.detail_book_tag),
            Text.rich(
              TextSpan(children: [
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.add),
                ),
                TextSpan(
                  text: l10n.detail_book_tag_not_registred,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ]),
            ),
            const SizedBox(height: 12),
          ],
        );

    date() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.detail_book_date),
            Text(
              '2024/05/26',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
          ],
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(l10n.detail_book),
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
                      tag: isbn,
                      child: Image.network(
                        'https://covers.openlibrary.org/b/isbn/$isbn-M.jpg',
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
                            titleName(),
                            authorName(),
                            date(),
                            tag(),
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

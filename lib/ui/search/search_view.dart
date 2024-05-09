import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/component/list_item/search_item.dart';
import 'package:flutter_app/ui/search/search_view_model.dart';
import 'package:flutter_app/util/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchView extends HookConsumerWidget {
  SearchView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final seacrh = ref.watch(searchViewModelProvider);
    final searchNotifier = ref.read(searchViewModelProvider.notifier);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(l10n.search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: l10n.search_book_hint),
              onSubmitted: (value) {
                Log.d('submit value = $value');
                searchNotifier.search(value);
              },
            ),
            Expanded(
              child: seacrh.when(
                data: (data) {
                  final books = data.docs;
                  if (books != null) {
                    final List<Widget> item = [];
                    for (var book in books) {
                      item.add(
                        SerachItem(
                          title: book.title!,
                          isbn: book.isbn?.first,
                          author: book.authorName?.first,
                        ),
                      );
                    }

                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return item[index];
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: item.length,
                    );
                  } else {
                    return Container();
                  }
                },
                error: (error, stackTrace) => Container(),
                loading: () => Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

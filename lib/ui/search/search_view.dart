import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/book.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/component/list_item/search_item.dart';
import 'package:flutter_app/ui/detail/detail_book_view.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
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
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(l10n.search),
      ),
      drawer: const DrawerView(),
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
                data: (Books data) {
                  final books = data.docs;
                  if (books != null) {
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailBookView(
                                  index: index,
                                  docs: books[index],
                                ),
                              ),
                            );
                          },
                          child: SerachItem(
                            index: index,
                            title: books[index].title!,
                            isbn: books[index].isbn?.first,
                            author: books[index].authorName?.first,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: books.length,
                    );
                  } else {
                    return Container();
                  }
                },
                error: (error, stackTrace) => Container(),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

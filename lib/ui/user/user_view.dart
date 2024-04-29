import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_source/user_network_data_source.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:flutter_app/ui/user/user_view_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserView extends HookConsumerWidget {
  UserView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(userViewProvider);
    final l10n = L10n.of(context)!;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(l10n.person),
      ),
      drawer: const DrawerView(),
      body: Center(
        child: Column(
          children: [
            person.when(
              data: (UserResult result) {
                final person = result.data;
                return Column(
                  children: [
                    if (person != null) ...[
                      Text('${person.name}'),
                      Text('${person.note}'),
                      Text('${person.age}'),
                      Text('${person.registerDate}')
                    ]
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            )
          ],
        ),
      ),
    );
  }
}

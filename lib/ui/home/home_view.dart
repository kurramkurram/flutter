
import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:flutter_app/ui/license/license_view.dart';
import 'package:flutter_app/ui/license/license_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0,);

class HomeView extends HookConsumerWidget {
   HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    StateController<int> counterNotifier = ref.watch(counterProvider.notifier);
    final count = ref.watch(counterProvider);
    final l10n = L10n.of(context)!;

    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu), 
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
        },),
        title: Text(l10n.home),
      ),
      drawer: DrawerView(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            TextButton(
              onPressed: () { 
                counterNotifier.state++;
              },
              child: Text(l10n.home)
            ),
          ]
        )
      ),
    );   
  }
}
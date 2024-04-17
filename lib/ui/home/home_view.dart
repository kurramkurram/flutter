
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0,);

class HomeView extends HookConsumerWidget {
   HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    StateController<int> counterNotifier = ref.watch(counterProvider.notifier);
    final count = ref.watch(counterProvider);

    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },),
        title: const Text('ホーム'),
      ),
      drawer: const DrawerView(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count'),
            TextButton(
              onPressed: () { 
                counterNotifier.state++; 
              },
              child: const Text('Button')),
          ]
        )
      ),
    );   
  }
}
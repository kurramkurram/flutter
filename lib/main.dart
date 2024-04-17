import 'package:flutter/material.dart';
import 'package:flutter_app/ui/analytics/analytics_view.dart';
import 'package:flutter_app/ui/home/home_view.dart';
import 'package:flutter_app/ui/settings/settings_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final indexProvider = StateProvider((ref) => 0,);

void main() {
  runApp(ProviderScope(child: MainApp(),));
}

class MainApp extends HookConsumerWidget {
   MainApp({super.key});
  
  final  _screen = [
    HomeView(),
    AnalyticsView(),
    SettingsView()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<int> indexNotifier = ref.watch(indexProvider.notifier);
    final index = ref.watch(indexProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: '統計'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定')
          ],
          onTap:(value) => indexNotifier.state = value,
          type: BottomNavigationBarType.fixed,
        ),
        body: _screen[index],
      )
    );
  }
}

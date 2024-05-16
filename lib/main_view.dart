import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/analytics/analytics_view.dart';
import 'package:flutter_app/ui/home/home_view.dart';
import 'package:flutter_app/ui/search/search_view.dart';
import 'package:flutter_app/ui/user/user_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final indexProvider = StateProvider(
  (ref) => 0,
);

class MainView extends HookConsumerWidget {
  MainView({super.key});

  final _screen = [HomeView(), SearchView(), AnalyticsView(), UserView()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<int> indexNotifier = ref.watch(indexProvider.notifier);
    final index = ref.watch(indexProvider);
    final l10n = L10n.of(context)!;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: l10n.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search), label: l10n.search),
          BottomNavigationBarItem(
              icon: const Icon(Icons.analytics), label: l10n.analytics),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: l10n.person),
        ],
        onTap: (value) => indexNotifier.state = value,
        type: BottomNavigationBarType.fixed,
      ),
      body: _screen[index],
    );
  }
}

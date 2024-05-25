import 'package:flutter/material.dart';
import 'package:flutter_app/data/repository/permission_repository.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/component/card/home_item_card.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:flutter_app/ui/home/home_view_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionRepository = ref.read(permissionRepositoryProvider);

    final homeViewModel = ref.watch(homeViewModelProvider);

    final l10n = L10n.of(context)!;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await permissionRepository.requestAll();
      });

      return null;
    }, []);

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
        title: Text(l10n.home),
      ),
      drawer: const DrawerView(),
      body: Column(
        children: [
          Expanded(
            child: homeViewModel.when(
                data: (data) {
                  return GridView.count(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: [
                      for (var docs in data.docs!) ...[HomeItemcard(docs: docs)]
                    ],
                  );
                },
                error: (error, stackTrace) => Container(),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
    );
  }
}

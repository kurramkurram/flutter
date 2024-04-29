import 'package:flutter/material.dart';
import 'package:flutter_app/data/repository/permission_repository.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/component/dialog/custom_alert_dialog.dart';
import 'package:flutter_app/ui/component/toast/toast.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider(
  (ref) => 0,
);

class HomeView extends HookConsumerWidget {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<int> counterNotifier = ref.watch(counterProvider.notifier);
    final permissionRepository = ref.read(permissionRepositoryProvider);

    final count = ref.watch(counterProvider);
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
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(l10n.home),
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
                showDialog(
                  context: context,
                  builder: (_) {
                    return const CustomAlertDialog(
                      title: 'タイトル',
                      description: 'ダイアログのサンプル',
                      positive: 'ハイ',
                      negative: 'いいえ',
                    );
                  },
                ).then((value) {
                  if (value == 0) {
                    ToastUtil.show('はいが押されました');
                  } else if (value == 1) {
                    ToastUtil.show('いいえが押されました');
                  }
                });
              },
              child: Text(l10n.home),
            ),
          ],
        ),
      ),
    );
  }
}

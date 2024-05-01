import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/launch/launch_app.dart';
import 'package:flutter_app/ui/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_app/ui/component/button/base_button.dart';
import 'package:flutter_app/ui/component/dialog/custom_alert_dialog.dart';
import 'package:flutter_app/ui/component/toast/toast.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:flutter_app/util/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(l10n.drawer_settings),
      ),
      drawer: const DrawerView(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseButton(
              text: const Text('トースト'),
              radius: 20,
              backgroundColor: Colors.white,
              borderColor: Colors.blue,
              onPressed: () {
                ToastUtil.show('トースト表示です');
              },
              leading: Assets.images.appIcon.appIcon.image(width: 10),
              action: Assets.images.appIcon.appIcon.image(width: 10),
            ),
            const SizedBox(height: 20),
            BaseButton(
              text: const Text('ダイアログ'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const CustomAlertDialog(
                      title: 'タイトル',
                      description: 'ダイアログのサンプル',
                      positive: 'はい',
                      negative: 'いいえ',
                    );
                  },
                ).then((value) {
                  if (value == 0) {
                    Log.d('はいが押されました');
                  } else if (value == 1) {
                    Log.d('いいえが押されました');
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            BaseButton(
              text: const Text('ブラウザ起動'),
              onPressed: () {
                context.launchApp('https://kurramkurram.github.io/');
              },
            ),
            const SizedBox(height: 20),
            BaseButton(
              text: const Text('ボトムシート'),
              onPressed: () {
                CustomBottomSheet().show(
                  context: context,
                  body: const Column(children: [Text('AAAAA')]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/component/chart/bar_chart.dart';
import 'package:flutter_app/ui/component/chart/pie_chart.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalyticsView extends HookConsumerWidget {
  AnalyticsView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    // 月別の読書量のダミーデータ
    List<int> readMonthly = [5, 20, 2, 4, 7, 0, 0, 0, 0, 0, 0, 0];
    int maxRead = readMonthly.reduce(max);

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
        title: Text(l10n.analytics),
      ),
      drawer: const DrawerView(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('2024年'),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 12; i++) ...[
                    Column(
                      children: [
                        BarChart(read: readMonthly[i], max: maxRead, delay: i),
                        const SizedBox(height: 4),
                        Text('${i + 1}月'),
                      ],
                    )
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(l10n.analytics_this_month_read),
          const SizedBox(height: 12),
          Expanded(
            child: PieChart(
              readCount: readMonthly[4],
              targetCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

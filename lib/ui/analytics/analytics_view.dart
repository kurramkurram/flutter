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
        children: [
          Text(l10n.analytics_this_month_read),
          const SizedBox(height: 24),
          const Expanded(
            // child: PieChart(
            //   readCount: 5,
            //   targetCount: 30,
            // ),
            child: BarChart(),
          ),
        ],
      ),
    );
  }
}

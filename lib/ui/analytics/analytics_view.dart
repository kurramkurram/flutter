import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalyticsView extends HookConsumerWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {},),
        title: const Text('統計'),
      ),
      body: const Center(
        child: Text('統計')
      ),
    );
  }
}
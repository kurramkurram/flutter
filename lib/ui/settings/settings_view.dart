
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {},),
        title: const Text('設定'),
      ),
      body: const Center(
        child: Text('設定')
      ),
    );
  }
}
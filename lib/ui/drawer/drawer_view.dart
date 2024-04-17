
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerView extends HookConsumerWidget {
  const DrawerView({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text('アプリ情報'),
          ),
          ListTile(
            title: Text('QA'),
          ),
        ],
      ),
    );
  }
}
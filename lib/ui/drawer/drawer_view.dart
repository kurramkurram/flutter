
import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerView extends HookConsumerWidget {
  const DrawerView({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(l10n.drawer_about_app),
          ),
          ListTile(
            title: Text(l10n.drawer_qa),
          ),
        ],
      ),
    );
  }
}
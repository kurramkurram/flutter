
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/drawer/drawer_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  SettingsView({super.key});
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
       key: _scaffoldKey,
       appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },),
        title: const Text('設定'),
      ),
      drawer: const DrawerView(),
      body: const Center(
        child: Text('設定')
      ),
    );
  }
}
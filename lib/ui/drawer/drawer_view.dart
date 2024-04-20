import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/license/license_view.dart';
import 'package:flutter_app/ui/terms/terms_view.dart';
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
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(l10n.drawer_qa),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(l10n.drawer_license),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TermsView()));
            },
          ),
          ListTile(
            title: Text(l10n.drawer_policy),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TermsView()));
            },
          )
        ],
      ),
    );
  }
}

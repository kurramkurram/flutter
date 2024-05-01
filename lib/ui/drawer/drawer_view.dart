import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/about/about_app_view.dart';
import 'package:flutter_app/ui/license/license_view.dart';
import 'package:flutter_app/ui/settings/settings_view.dart';
import 'package:flutter_app/ui/terms/terms_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerView extends HookConsumerWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return Container(
      color: Colors.blue.shade100,
      width: MediaQuery.of(context).size.width * 0.7,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(l10n.drawer_settings),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsView()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Assets.images.appIcon.appIcon.image(width: 24),
                    title: Text(l10n.drawer_about_app),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutAppView()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.question_answer),
                    title: Text(l10n.drawer_qa),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.note),
                    title: Text(l10n.drawer_license),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LicenseView()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.policy),
                    title: Text(l10n.drawer_policy),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsView()),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

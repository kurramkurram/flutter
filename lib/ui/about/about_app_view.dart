import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/about/about_app_view_model.dart';
import 'package:flutter_app/ui/about/about_app_view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutAppView extends HookConsumerWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final aboutAppViewModel = ref.watch(aboutAppViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(l10n.drawer_about_app),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.appIcon.appIcon.image(width: 100),
            const SizedBox(
              height: 16,
            ),
            aboutAppViewModel.when(
              data: (AboutAppViewState data) {
                return Center(
                  child: Column(
                    children: [
                      Text(l10n.about_app_app_name),
                      const SizedBox(height: 8),
                      Text(data.appName),
                      const SizedBox(height: 16),
                      Text(l10n.about_app_version),
                      const SizedBox(height: 8),
                      Text(data.appVersionName),
                    ],
                  ),
                );
              },
              error: (Object error, StackTrace stackTrace) => const Center(),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/ui/license/license_package.dart';
import 'package:flutter_app/ui/license/license_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LicenseView extends HookConsumerWidget {
  const LicenseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ossViewModel = ref.watch(licenseViewModelProvider);
    final l10n = L10n.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(l10n.drawer_license),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ossViewModel.when(
          data: (List<LicensePackage> data) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const Text('-------------'),
                  const SizedBox(height: 8),
                  Text(data[index].package),
                  const SizedBox(height: 8),
                  for (var paragrpah in data[index].paragraph) ...[
                    Text(paragrpah)
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) =>
              Text(l10n.license_error),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

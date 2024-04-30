import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TermsView extends HookConsumerWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
        title: Text(l10n.drawer_policy),
      ),
      body: InAppWebView(
        initialFile: Assets.html.terms,
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_app/lang/l10n.dart';
import 'package:flutter_app/main_view.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: MainView(),
    );
  }
}

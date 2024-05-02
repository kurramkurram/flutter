import 'dart:async';

import 'package:flutter_app/data/repository/package_info_repository.dart';
import 'package:flutter_app/ui/about/about_app_view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final aboutAppViewModelProvider =
    AsyncNotifierProvider<AboutAppViewModel, AboutAppViewState>(
  () => AboutAppViewModel(),
);

class AboutAppViewModel extends AsyncNotifier<AboutAppViewState> {
  late final _packageInfoRepository = ref.read(packageInfoRepositoryProvider);

  @override
  FutureOr<AboutAppViewState> build() async {
    final appName = await _packageInfoRepository.getAppName();
    final versionName = await _packageInfoRepository.getAppVersionName();

    return AboutAppViewState(
      appName: appName,
      appVersionName: versionName,
    );
  }
}

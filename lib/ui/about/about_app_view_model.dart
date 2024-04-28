import 'package:flutter_app/data/repository/package_info_repository.dart';
import 'package:flutter_app/ui/about/about_app_view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final aboutAppViewModelProvider = StateNotifierProvider.autoDispose<
    AboutAppViewModel, AsyncValue<AboutAppViewState>>(
  (ref) => AboutAppViewModel(ref),
);

class AboutAppViewModel extends StateNotifier<AsyncValue<AboutAppViewState>> {
  AboutAppViewModel(
    this._ref,
  ) : super(const AsyncValue.loading()) {
    _fetchAppInfo();
  }

  final Ref _ref;

  late final packageInfoRepository = _ref.read(packageInfoRepositoryProvider);

  Future<void> _fetchAppInfo() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final appName = await packageInfoRepository.getAppName();
      final versionName = await packageInfoRepository.getAppVersionName();

      return AboutAppViewState(
        appName: appName,
        appVersionName: versionName,
      );
    });
  }
}

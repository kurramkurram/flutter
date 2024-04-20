import 'package:flutter/foundation.dart';
import 'package:flutter_app/ui/license/license_package.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final licenseViewModelProvider = StateNotifierProvider.autoDispose<
    LicenseViewModel,
    AsyncValue<List<LicensePackage>>>((ref) => LicenseViewModel());

class LicenseViewModel extends StateNotifier<AsyncValue<List<LicensePackage>>> {
  LicenseViewModel() : super(const AsyncValue.loading()) {
    _fetchLicenses();
  }

  Future<void> _fetchLicenses() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final List<LicensePackage> license = [];
      await for (var licenses in LicenseRegistry.licenses) {
        for (var package in licenses.packages) {
          final List<String> paragraphs = [];
          for (var paragraph in licenses.paragraphs) {
            paragraphs.add(paragraph.text);
          }
          var ossPackage =
              LicensePackage(package: package, paragraph: paragraphs);
          license.add(ossPackage);
        }
      }
      return license;
    });
  }
}

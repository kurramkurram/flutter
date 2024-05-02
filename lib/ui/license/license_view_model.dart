import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/ui/license/license_package.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final licenseViewModelProvider =
    AsyncNotifierProvider<LicenseViewModel, List<LicensePackage>>(
  () => LicenseViewModel(),
);

class LicenseViewModel extends AsyncNotifier<List<LicensePackage>> {
  @override
  FutureOr<List<LicensePackage>> build() async {
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
  }
}

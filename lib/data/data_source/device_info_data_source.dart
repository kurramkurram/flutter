import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_app/data/model/system_version.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deviceInfoDatasourceProvider = Provider(
  (ref) => DeviceInfoDataSource(),
);

class DeviceInfoDataSource {
  bool isAndroid() => Platform.isAndroid;

  bool isIos() => Platform.isIOS;

  Future<int> fetchAndroidOsVersion() async {
    return (await (DeviceInfoPlugin().androidInfo)).version.sdkInt;
  }

  Future<SystemVersion> fetchIosOsVersion() async {
    return SystemVersion((await (DeviceInfoPlugin().iosInfo)).systemVersion);
  }
}

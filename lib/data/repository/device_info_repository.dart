import 'package:flutter_app/data/data_source/device_info_data_source.dart';
import 'package:flutter_app/data/model/system_version.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deviceInfoRepositoryProvider = Provider(
  (ref) => DeviceInfoRepository(ref),
);

class DeviceInfoRepository {
  DeviceInfoRepository(
    this._ref,
  );

  final Ref _ref;

  late final deviceInfoDatasource = _ref.read(deviceInfoDatasourceProvider);

  Future<int> fetchAndroidOsVersion() =>
      deviceInfoDatasource.fetchAndroidOsVersion();

  Future<SystemVersion> fetchIosOsVersion() =>
      deviceInfoDatasource.fetchIosOsVersion();

  bool isAndroid() => deviceInfoDatasource.isAndroid();

  bool isIos() => deviceInfoDatasource.isIos();
}

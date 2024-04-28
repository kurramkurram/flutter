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

  late final _deviceInfoDatasource = _ref.read(deviceInfoDatasourceProvider);

  Future<int> fetchAndroidOsVersion() =>
      _deviceInfoDatasource.fetchAndroidOsVersion();

  Future<SystemVersion> fetchIosOsVersion() =>
      _deviceInfoDatasource.fetchIosOsVersion();

  bool isAndroid() => _deviceInfoDatasource.isAndroid();

  bool isIos() => _deviceInfoDatasource.isIos();
}

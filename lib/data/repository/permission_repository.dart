import 'package:flutter_app/data/data_source/device_info_data_source.dart';
import 'package:flutter_app/data/data_source/permission_data_source.dart';
import 'package:flutter_app/data/model/system_version.dart';
import 'package:flutter_app/permission/permissions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionRepositoryProvider = Provider(
  (ref) => PermissionRepository(ref),
);

class PermissionRepository {
  PermissionRepository(this._ref);

  final Ref _ref;

  late final _permissionDataSource = _ref.read(permissionDataSourceProvider);

  late final _deviceInfoDataSource = _ref.read(deviceInfoDatasourceProvider);

  /// 権限をリクエスト
  Future<PermissionStatus> request(Permissions permission) async {
    return _permissionDataSource.request(permission);
  }

  /// すべての権限をリクエスト
  Future<void> requestAll() async {
    final isAndroid = _deviceInfoDataSource.isAndroid();
    final isIos = _deviceInfoDataSource.isIos();

    if (isAndroid) {
      final sdkVersion = await _deviceInfoDataSource.fetchAndroidOsVersion();

      for (var permission in Permissions.values) {
        if (permission.isAndroid &&
            permission.androidMinSdk <= sdkVersion &&
            permission.androidMaxSdk >= sdkVersion) {
          await _permissionDataSource.request(permission);
        }
      }
    } else if (isIos) {
      final systemVersion = await _deviceInfoDataSource.fetchIosOsVersion();

      for (var permission in Permissions.values) {
        if (permission.isIos &&
            SystemVersion(permission.iosMinOsVersion) <= systemVersion) {
          await _permissionDataSource.request(permission);
        }
      }
    }
  }

  /// 権限の状態を取得
  Future<PermissionStatus> getStatus(Permissions permission) {
    return _permissionDataSource.getStatus(permission);
  }
}

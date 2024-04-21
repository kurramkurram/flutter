import 'package:flutter_app/permission/permissions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionDataSourceProvider = Provider(
  (ref) => PermissionDataSource(),
);

class PermissionDataSource {
  /// 権限をリクエスト
  Future<PermissionStatus> request(Permissions permission) async {
    return permission.type.request();
  }

  /// 権限の状態を取得
  Future<PermissionStatus> getStatus(Permissions permission) async {
    return permission.type.status;
  }
}

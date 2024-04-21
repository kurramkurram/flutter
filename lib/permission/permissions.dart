import 'package:permission_handler/permission_handler.dart';

enum Permissions {
  // 通知
  notification,

  // 電話
  phone,

  // ストレージ
  storage,

  // フォト
  photos
}

extension PermissionsType on Permissions {
  Permission get type {
    switch (this) {
      case Permissions.notification:
        return Permission.notification;
      case Permissions.phone:
        return Permission.phone;
      case Permissions.storage:
        return Permission.storage;
      case Permissions.photos:
        return Permission.photos;
    }
  }

  bool get isAndroid {
    switch (this) {
      case Permissions.notification:
      case Permissions.phone:
      case Permissions.storage:
      case Permissions.photos:
        return true;
    }
  }

  bool get isIos {
    switch (this) {
      case Permissions.notification:
        return true;
      case Permissions.storage:
      case Permissions.phone:
      case Permissions.photos:
        return false;
    }
  }

  int get androidMinSdk {
    switch (this) {
      case Permissions.notification:
        return 33;
      case Permissions.phone:
        return 1;
      case Permissions.storage:
        return 16;
      case Permissions.photos:
        return 33;
    }
  }

  int get androidMaxSdk {
    switch (this) {
      case Permissions.storage:
        return 32;
      default:
        return 1000;
    }
  }

  String get iosMinOsVersion {
    switch (this) {
      case Permissions.notification:
        return '10';
      default:
        return '1000';
    }
  }
}

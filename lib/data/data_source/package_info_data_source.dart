import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final packageInfoDataSourceProvider = Provider(
  (ref) => PackageInfoDataSource(),
);

/// パッケージ名を取得
///
/// - Android パッケージ名
/// - iOS bundleIdentifier
class PackageInfoDataSource {
  Future<String> getPackageName() async =>
      (await PackageInfo.fromPlatform()).packageName;

  /// アプリ名を取得
  ///
  /// - Android application/label
  /// - iOS CFBundleDisplayName
  Future<String> getAppName() async =>
      (await PackageInfo.fromPlatform()).appName;

  /// バージョン名を取得
  ///
  /// - Android versionName
  /// - iOS CFBundleShortVersionString
  Future<String> getAppVersionName() async =>
      (await PackageInfo.fromPlatform()).version;

  /// バージョンコードを取得
  ///
  /// - Android versionCode
  /// - iOS CFBundleVersion
  Future<String> getAppVersionCode() async =>
      (await PackageInfo.fromPlatform()).buildNumber;
}

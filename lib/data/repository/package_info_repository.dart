import 'package:flutter_app/data/data_source/package_info_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final packageInfoRepositoryProvider = Provider(
  (ref) => PackageInfoRepository(ref),
);

class PackageInfoRepository {
  PackageInfoRepository(this._ref);

  final Ref _ref;

  late final _packageInfoDataSource = _ref.read(packageInfoDataSourceProvider);

  /// パッケージ名を取得
  ///
  /// - Android パッケージ名
  /// - iOS bundleIdentifier
  Future<String> getPackageName() async =>
      _packageInfoDataSource.getPackageName();

  /// アプリ名を取得
  ///
  /// - Android application/label
  /// - iOS CFBundleDisplayName
  Future<String> getAppName() async => _packageInfoDataSource.getAppName();

  /// バージョン名を取得
  ///
  /// - Android versionName
  /// - iOS CFBundleShortVersionString
  Future<String> getAppVersionName() async =>
      _packageInfoDataSource.getAppVersionName();

  /// バージョンコードを取得
  ///
  /// - Android versionCode
  /// - iOS CFBundleVersion
  Future<String> getAppVersionCode() async =>
      _packageInfoDataSource.getAppVersionCode();
}

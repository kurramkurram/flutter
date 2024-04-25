import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_package.freezed.dart';

@freezed
abstract class LicensePackage with _$LicensePackage {
  const factory LicensePackage({
    /// パッケージ
    @Default('') String package,

    /// 本文
    @Default([]) List<String> paragraph
  }) = _LicensePackage;
}

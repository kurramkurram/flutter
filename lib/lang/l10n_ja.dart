import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get home => 'ホーム';

  @override
  String get analytics => '統計';

  @override
  String get settings => '設定';

  @override
  String get drawer_about_app => 'アプリについて';

  @override
  String get drawer_qa => 'QA';

  @override
  String get drawer_license => 'ライセンス';

  @override
  String get drawer_policy => '利用規約';

  @override
  String get license_error => 'ライセンス情報を取得できませんでした';
}

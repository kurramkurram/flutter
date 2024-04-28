import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_app_view_state.freezed.dart';

@freezed
abstract class AboutAppViewState with _$AboutAppViewState {
  const factory AboutAppViewState({
    /// アプリ名
    @Default('') String appName,

    /// バージョン名
    @Default('') String appVersionName,
  }) = _AboutAppViewState;
}

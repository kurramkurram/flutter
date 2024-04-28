// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_app_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutAppViewState {
  /// アプリ名
  String get appName => throw _privateConstructorUsedError;

  /// バージョン名
  String get appVersionName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutAppViewStateCopyWith<AboutAppViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutAppViewStateCopyWith<$Res> {
  factory $AboutAppViewStateCopyWith(
          AboutAppViewState value, $Res Function(AboutAppViewState) then) =
      _$AboutAppViewStateCopyWithImpl<$Res, AboutAppViewState>;
  @useResult
  $Res call({String appName, String appVersionName});
}

/// @nodoc
class _$AboutAppViewStateCopyWithImpl<$Res, $Val extends AboutAppViewState>
    implements $AboutAppViewStateCopyWith<$Res> {
  _$AboutAppViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? appVersionName = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      appVersionName: null == appVersionName
          ? _value.appVersionName
          : appVersionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AboutAppViewStateImplCopyWith<$Res>
    implements $AboutAppViewStateCopyWith<$Res> {
  factory _$$AboutAppViewStateImplCopyWith(_$AboutAppViewStateImpl value,
          $Res Function(_$AboutAppViewStateImpl) then) =
      __$$AboutAppViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appName, String appVersionName});
}

/// @nodoc
class __$$AboutAppViewStateImplCopyWithImpl<$Res>
    extends _$AboutAppViewStateCopyWithImpl<$Res, _$AboutAppViewStateImpl>
    implements _$$AboutAppViewStateImplCopyWith<$Res> {
  __$$AboutAppViewStateImplCopyWithImpl(_$AboutAppViewStateImpl _value,
      $Res Function(_$AboutAppViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? appVersionName = null,
  }) {
    return _then(_$AboutAppViewStateImpl(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      appVersionName: null == appVersionName
          ? _value.appVersionName
          : appVersionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AboutAppViewStateImpl implements _AboutAppViewState {
  const _$AboutAppViewStateImpl({this.appName = '', this.appVersionName = ''});

  /// アプリ名
  @override
  @JsonKey()
  final String appName;

  /// バージョン名
  @override
  @JsonKey()
  final String appVersionName;

  @override
  String toString() {
    return 'AboutAppViewState(appName: $appName, appVersionName: $appVersionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutAppViewStateImpl &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appVersionName, appVersionName) ||
                other.appVersionName == appVersionName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appName, appVersionName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutAppViewStateImplCopyWith<_$AboutAppViewStateImpl> get copyWith =>
      __$$AboutAppViewStateImplCopyWithImpl<_$AboutAppViewStateImpl>(
          this, _$identity);
}

abstract class _AboutAppViewState implements AboutAppViewState {
  const factory _AboutAppViewState(
      {final String appName,
      final String appVersionName}) = _$AboutAppViewStateImpl;

  @override

  /// アプリ名
  String get appName;
  @override

  /// バージョン名
  String get appVersionName;
  @override
  @JsonKey(ignore: true)
  _$$AboutAppViewStateImplCopyWith<_$AboutAppViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

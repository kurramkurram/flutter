// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LicensePackage {
// パッケージ
  String get package => throw _privateConstructorUsedError; // 本文
  List<String> get paragraph => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LicensePackageCopyWith<LicensePackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicensePackageCopyWith<$Res> {
  factory $LicensePackageCopyWith(
          LicensePackage value, $Res Function(LicensePackage) then) =
      _$LicensePackageCopyWithImpl<$Res, LicensePackage>;
  @useResult
  $Res call({String package, List<String> paragraph});
}

/// @nodoc
class _$LicensePackageCopyWithImpl<$Res, $Val extends LicensePackage>
    implements $LicensePackageCopyWith<$Res> {
  _$LicensePackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package = null,
    Object? paragraph = null,
  }) {
    return _then(_value.copyWith(
      package: null == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String,
      paragraph: null == paragraph
          ? _value.paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicensePackageImplCopyWith<$Res>
    implements $LicensePackageCopyWith<$Res> {
  factory _$$LicensePackageImplCopyWith(_$LicensePackageImpl value,
          $Res Function(_$LicensePackageImpl) then) =
      __$$LicensePackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String package, List<String> paragraph});
}

/// @nodoc
class __$$LicensePackageImplCopyWithImpl<$Res>
    extends _$LicensePackageCopyWithImpl<$Res, _$LicensePackageImpl>
    implements _$$LicensePackageImplCopyWith<$Res> {
  __$$LicensePackageImplCopyWithImpl(
      _$LicensePackageImpl _value, $Res Function(_$LicensePackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package = null,
    Object? paragraph = null,
  }) {
    return _then(_$LicensePackageImpl(
      package: null == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String,
      paragraph: null == paragraph
          ? _value._paragraph
          : paragraph // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LicensePackageImpl implements _LicensePackage {
  const _$LicensePackageImpl(
      {this.package = '', final List<String> paragraph = const []})
      : _paragraph = paragraph;

// パッケージ
  @override
  @JsonKey()
  final String package;
// 本文
  final List<String> _paragraph;
// 本文
  @override
  @JsonKey()
  List<String> get paragraph {
    if (_paragraph is EqualUnmodifiableListView) return _paragraph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paragraph);
  }

  @override
  String toString() {
    return 'LicensePackage(package: $package, paragraph: $paragraph)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicensePackageImpl &&
            (identical(other.package, package) || other.package == package) &&
            const DeepCollectionEquality()
                .equals(other._paragraph, _paragraph));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, package, const DeepCollectionEquality().hash(_paragraph));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LicensePackageImplCopyWith<_$LicensePackageImpl> get copyWith =>
      __$$LicensePackageImplCopyWithImpl<_$LicensePackageImpl>(
          this, _$identity);
}

abstract class _LicensePackage implements LicensePackage {
  const factory _LicensePackage(
      {final String package,
      final List<String> paragraph}) = _$LicensePackageImpl;

  @override // パッケージ
  String get package;
  @override // 本文
  List<String> get paragraph;
  @override
  @JsonKey(ignore: true)
  _$$LicensePackageImplCopyWith<_$LicensePackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

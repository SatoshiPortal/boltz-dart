// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lnurl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lnurl {
  String get value;

  /// Create a copy of Lnurl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LnurlCopyWith<Lnurl> get copyWith =>
      _$LnurlCopyWithImpl<Lnurl>(this as Lnurl, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Lnurl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'Lnurl(value: $value)';
  }
}

/// @nodoc
abstract mixin class $LnurlCopyWith<$Res> {
  factory $LnurlCopyWith(Lnurl value, $Res Function(Lnurl) _then) =
      _$LnurlCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$LnurlCopyWithImpl<$Res> implements $LnurlCopyWith<$Res> {
  _$LnurlCopyWithImpl(this._self, this._then);

  final Lnurl _self;
  final $Res Function(Lnurl) _then;

  /// Create a copy of Lnurl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Lnurl extends Lnurl {
  const _Lnurl({required this.value}) : super._();

  @override
  final String value;

  /// Create a copy of Lnurl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LnurlCopyWith<_Lnurl> get copyWith =>
      __$LnurlCopyWithImpl<_Lnurl>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Lnurl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'Lnurl(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$LnurlCopyWith<$Res> implements $LnurlCopyWith<$Res> {
  factory _$LnurlCopyWith(_Lnurl value, $Res Function(_Lnurl) _then) =
      __$LnurlCopyWithImpl;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$LnurlCopyWithImpl<$Res> implements _$LnurlCopyWith<$Res> {
  __$LnurlCopyWithImpl(this._self, this._then);

  final _Lnurl _self;
  final $Res Function(_Lnurl) _then;

  /// Create a copy of Lnurl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_Lnurl(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

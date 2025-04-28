// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoltzError {
  String get kind;
  String get message;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BoltzErrorCopyWith<BoltzError> get copyWith =>
      _$BoltzErrorCopyWithImpl<BoltzError>(this as BoltzError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoltzError &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, message);

  @override
  String toString() {
    return 'BoltzError(kind: $kind, message: $message)';
  }
}

/// @nodoc
abstract mixin class $BoltzErrorCopyWith<$Res> {
  factory $BoltzErrorCopyWith(
          BoltzError value, $Res Function(BoltzError) _then) =
      _$BoltzErrorCopyWithImpl;
  @useResult
  $Res call({String kind, String message});
}

/// @nodoc
class _$BoltzErrorCopyWithImpl<$Res> implements $BoltzErrorCopyWith<$Res> {
  _$BoltzErrorCopyWithImpl(this._self, this._then);

  final BoltzError _self;
  final $Res Function(BoltzError) _then;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _BoltzError extends BoltzError {
  const _BoltzError({required this.kind, required this.message}) : super._();

  @override
  final String kind;
  @override
  final String message;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BoltzErrorCopyWith<_BoltzError> get copyWith =>
      __$BoltzErrorCopyWithImpl<_BoltzError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoltzError &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, message);

  @override
  String toString() {
    return 'BoltzError(kind: $kind, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$BoltzErrorCopyWith<$Res>
    implements $BoltzErrorCopyWith<$Res> {
  factory _$BoltzErrorCopyWith(
          _BoltzError value, $Res Function(_BoltzError) _then) =
      __$BoltzErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String kind, String message});
}

/// @nodoc
class __$BoltzErrorCopyWithImpl<$Res> implements _$BoltzErrorCopyWith<$Res> {
  __$BoltzErrorCopyWithImpl(this._self, this._then);

  final _BoltzError _self;
  final $Res Function(_BoltzError) _then;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = null,
    Object? message = null,
  }) {
    return _then(_BoltzError(
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

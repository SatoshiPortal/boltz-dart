// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoltzError {
  String get kind => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoltzErrorCopyWith<BoltzError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoltzErrorCopyWith<$Res> {
  factory $BoltzErrorCopyWith(
          BoltzError value, $Res Function(BoltzError) then) =
      _$BoltzErrorCopyWithImpl<$Res, BoltzError>;
  @useResult
  $Res call({String kind, String message});
}

/// @nodoc
class _$BoltzErrorCopyWithImpl<$Res, $Val extends BoltzError>
    implements $BoltzErrorCopyWith<$Res> {
  _$BoltzErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoltzErrorImplCopyWith<$Res>
    implements $BoltzErrorCopyWith<$Res> {
  factory _$$BoltzErrorImplCopyWith(
          _$BoltzErrorImpl value, $Res Function(_$BoltzErrorImpl) then) =
      __$$BoltzErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String kind, String message});
}

/// @nodoc
class __$$BoltzErrorImplCopyWithImpl<$Res>
    extends _$BoltzErrorCopyWithImpl<$Res, _$BoltzErrorImpl>
    implements _$$BoltzErrorImplCopyWith<$Res> {
  __$$BoltzErrorImplCopyWithImpl(
      _$BoltzErrorImpl _value, $Res Function(_$BoltzErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? message = null,
  }) {
    return _then(_$BoltzErrorImpl(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BoltzErrorImpl extends _BoltzError {
  const _$BoltzErrorImpl({required this.kind, required this.message})
      : super._();

  @override
  final String kind;
  @override
  final String message;

  @override
  String toString() {
    return 'BoltzError(kind: $kind, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoltzErrorImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, message);

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoltzErrorImplCopyWith<_$BoltzErrorImpl> get copyWith =>
      __$$BoltzErrorImplCopyWithImpl<_$BoltzErrorImpl>(this, _$identity);
}

abstract class _BoltzError extends BoltzError {
  const factory _BoltzError(
      {required final String kind,
      required final String message}) = _$BoltzErrorImpl;
  const _BoltzError._() : super._();

  @override
  String get kind;
  @override
  String get message;

  /// Create a copy of BoltzError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoltzErrorImplCopyWith<_$BoltzErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

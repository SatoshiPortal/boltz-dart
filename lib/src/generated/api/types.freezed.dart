// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TxFee {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BigInt field0) absolute,
    required TResult Function(double field0) relative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BigInt field0)? absolute,
    TResult? Function(double field0)? relative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BigInt field0)? absolute,
    TResult Function(double field0)? relative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TxFee_Absolute value) absolute,
    required TResult Function(TxFee_Relative value) relative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TxFee_Absolute value)? absolute,
    TResult? Function(TxFee_Relative value)? relative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TxFee_Absolute value)? absolute,
    TResult Function(TxFee_Relative value)? relative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TxFeeCopyWith<$Res> {
  factory $TxFeeCopyWith(TxFee value, $Res Function(TxFee) then) =
      _$TxFeeCopyWithImpl<$Res, TxFee>;
}

/// @nodoc
class _$TxFeeCopyWithImpl<$Res, $Val extends TxFee>
    implements $TxFeeCopyWith<$Res> {
  _$TxFeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TxFee_AbsoluteImplCopyWith<$Res> {
  factory _$$TxFee_AbsoluteImplCopyWith(_$TxFee_AbsoluteImpl value,
          $Res Function(_$TxFee_AbsoluteImpl) then) =
      __$$TxFee_AbsoluteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class __$$TxFee_AbsoluteImplCopyWithImpl<$Res>
    extends _$TxFeeCopyWithImpl<$Res, _$TxFee_AbsoluteImpl>
    implements _$$TxFee_AbsoluteImplCopyWith<$Res> {
  __$$TxFee_AbsoluteImplCopyWithImpl(
      _$TxFee_AbsoluteImpl _value, $Res Function(_$TxFee_AbsoluteImpl) _then)
      : super(_value, _then);

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$TxFee_AbsoluteImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$TxFee_AbsoluteImpl extends TxFee_Absolute {
  const _$TxFee_AbsoluteImpl(this.field0) : super._();

  @override
  final BigInt field0;

  @override
  String toString() {
    return 'TxFee.absolute(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxFee_AbsoluteImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TxFee_AbsoluteImplCopyWith<_$TxFee_AbsoluteImpl> get copyWith =>
      __$$TxFee_AbsoluteImplCopyWithImpl<_$TxFee_AbsoluteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BigInt field0) absolute,
    required TResult Function(double field0) relative,
  }) {
    return absolute(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BigInt field0)? absolute,
    TResult? Function(double field0)? relative,
  }) {
    return absolute?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BigInt field0)? absolute,
    TResult Function(double field0)? relative,
    required TResult orElse(),
  }) {
    if (absolute != null) {
      return absolute(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TxFee_Absolute value) absolute,
    required TResult Function(TxFee_Relative value) relative,
  }) {
    return absolute(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TxFee_Absolute value)? absolute,
    TResult? Function(TxFee_Relative value)? relative,
  }) {
    return absolute?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TxFee_Absolute value)? absolute,
    TResult Function(TxFee_Relative value)? relative,
    required TResult orElse(),
  }) {
    if (absolute != null) {
      return absolute(this);
    }
    return orElse();
  }
}

abstract class TxFee_Absolute extends TxFee {
  const factory TxFee_Absolute(final BigInt field0) = _$TxFee_AbsoluteImpl;
  const TxFee_Absolute._() : super._();

  @override
  BigInt get field0;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TxFee_AbsoluteImplCopyWith<_$TxFee_AbsoluteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TxFee_RelativeImplCopyWith<$Res> {
  factory _$$TxFee_RelativeImplCopyWith(_$TxFee_RelativeImpl value,
          $Res Function(_$TxFee_RelativeImpl) then) =
      __$$TxFee_RelativeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class __$$TxFee_RelativeImplCopyWithImpl<$Res>
    extends _$TxFeeCopyWithImpl<$Res, _$TxFee_RelativeImpl>
    implements _$$TxFee_RelativeImplCopyWith<$Res> {
  __$$TxFee_RelativeImplCopyWithImpl(
      _$TxFee_RelativeImpl _value, $Res Function(_$TxFee_RelativeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$TxFee_RelativeImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TxFee_RelativeImpl extends TxFee_Relative {
  const _$TxFee_RelativeImpl(this.field0) : super._();

  @override
  final double field0;

  @override
  String toString() {
    return 'TxFee.relative(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxFee_RelativeImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TxFee_RelativeImplCopyWith<_$TxFee_RelativeImpl> get copyWith =>
      __$$TxFee_RelativeImplCopyWithImpl<_$TxFee_RelativeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BigInt field0) absolute,
    required TResult Function(double field0) relative,
  }) {
    return relative(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BigInt field0)? absolute,
    TResult? Function(double field0)? relative,
  }) {
    return relative?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BigInt field0)? absolute,
    TResult Function(double field0)? relative,
    required TResult orElse(),
  }) {
    if (relative != null) {
      return relative(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TxFee_Absolute value) absolute,
    required TResult Function(TxFee_Relative value) relative,
  }) {
    return relative(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TxFee_Absolute value)? absolute,
    TResult? Function(TxFee_Relative value)? relative,
  }) {
    return relative?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TxFee_Absolute value)? absolute,
    TResult Function(TxFee_Relative value)? relative,
    required TResult orElse(),
  }) {
    if (relative != null) {
      return relative(this);
    }
    return orElse();
  }
}

abstract class TxFee_Relative extends TxFee {
  const factory TxFee_Relative(final double field0) = _$TxFee_RelativeImpl;
  const TxFee_Relative._() : super._();

  @override
  double get field0;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TxFee_RelativeImplCopyWith<_$TxFee_RelativeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

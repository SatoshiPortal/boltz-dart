// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TxFee {
  Object get field0;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxFee &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'TxFee(field0: $field0)';
  }
}

/// @nodoc
class $TxFeeCopyWith<$Res> {
  $TxFeeCopyWith(TxFee _, $Res Function(TxFee) __);
}

/// @nodoc

class TxFee_Absolute extends TxFee {
  const TxFee_Absolute(this.field0) : super._();

  @override
  final BigInt field0;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TxFee_AbsoluteCopyWith<TxFee_Absolute> get copyWith =>
      _$TxFee_AbsoluteCopyWithImpl<TxFee_Absolute>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxFee_Absolute &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'TxFee.absolute(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $TxFee_AbsoluteCopyWith<$Res>
    implements $TxFeeCopyWith<$Res> {
  factory $TxFee_AbsoluteCopyWith(
          TxFee_Absolute value, $Res Function(TxFee_Absolute) _then) =
      _$TxFee_AbsoluteCopyWithImpl;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$TxFee_AbsoluteCopyWithImpl<$Res>
    implements $TxFee_AbsoluteCopyWith<$Res> {
  _$TxFee_AbsoluteCopyWithImpl(this._self, this._then);

  final TxFee_Absolute _self;
  final $Res Function(TxFee_Absolute) _then;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(TxFee_Absolute(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class TxFee_Relative extends TxFee {
  const TxFee_Relative(this.field0) : super._();

  @override
  final double field0;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TxFee_RelativeCopyWith<TxFee_Relative> get copyWith =>
      _$TxFee_RelativeCopyWithImpl<TxFee_Relative>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TxFee_Relative &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'TxFee.relative(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $TxFee_RelativeCopyWith<$Res>
    implements $TxFeeCopyWith<$Res> {
  factory $TxFee_RelativeCopyWith(
          TxFee_Relative value, $Res Function(TxFee_Relative) _then) =
      _$TxFee_RelativeCopyWithImpl;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class _$TxFee_RelativeCopyWithImpl<$Res>
    implements $TxFee_RelativeCopyWith<$Res> {
  _$TxFee_RelativeCopyWithImpl(this._self, this._then);

  final TxFee_Relative _self;
  final $Res Function(TxFee_Relative) _then;

  /// Create a copy of TxFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(TxFee_Relative(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on

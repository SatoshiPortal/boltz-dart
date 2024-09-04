// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supported_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportedPair _$SupportedPairFromJson(Map<String, dynamic> json) {
  return _SupportedPair.fromJson(json);
}

/// @nodoc
mixin _$SupportedPair {
  String get name => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  Limits get limits => throw _privateConstructorUsedError;
  Fees get fees => throw _privateConstructorUsedError;

  /// Serializes this SupportedPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportedPairCopyWith<SupportedPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportedPairCopyWith<$Res> {
  factory $SupportedPairCopyWith(
          SupportedPair value, $Res Function(SupportedPair) then) =
      _$SupportedPairCopyWithImpl<$Res, SupportedPair>;
  @useResult
  $Res call({String name, String hash, int rate, Limits limits, Fees fees});

  $LimitsCopyWith<$Res> get limits;
  $FeesCopyWith<$Res> get fees;
}

/// @nodoc
class _$SupportedPairCopyWithImpl<$Res, $Val extends SupportedPair>
    implements $SupportedPairCopyWith<$Res> {
  _$SupportedPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hash = null,
    Object? rate = null,
    Object? limits = null,
    Object? fees = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      limits: null == limits
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as Limits,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fees,
    ) as $Val);
  }

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LimitsCopyWith<$Res> get limits {
    return $LimitsCopyWith<$Res>(_value.limits, (value) {
      return _then(_value.copyWith(limits: value) as $Val);
    });
  }

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeesCopyWith<$Res> get fees {
    return $FeesCopyWith<$Res>(_value.fees, (value) {
      return _then(_value.copyWith(fees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SupportedPairImplCopyWith<$Res>
    implements $SupportedPairCopyWith<$Res> {
  factory _$$SupportedPairImplCopyWith(
          _$SupportedPairImpl value, $Res Function(_$SupportedPairImpl) then) =
      __$$SupportedPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String hash, int rate, Limits limits, Fees fees});

  @override
  $LimitsCopyWith<$Res> get limits;
  @override
  $FeesCopyWith<$Res> get fees;
}

/// @nodoc
class __$$SupportedPairImplCopyWithImpl<$Res>
    extends _$SupportedPairCopyWithImpl<$Res, _$SupportedPairImpl>
    implements _$$SupportedPairImplCopyWith<$Res> {
  __$$SupportedPairImplCopyWithImpl(
      _$SupportedPairImpl _value, $Res Function(_$SupportedPairImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hash = null,
    Object? rate = null,
    Object? limits = null,
    Object? fees = null,
  }) {
    return _then(_$SupportedPairImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      limits: null == limits
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as Limits,
      fees: null == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fees,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportedPairImpl implements _SupportedPair {
  const _$SupportedPairImpl(
      {required this.name,
      required this.hash,
      required this.rate,
      required this.limits,
      required this.fees});

  factory _$SupportedPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportedPairImplFromJson(json);

  @override
  final String name;
  @override
  final String hash;
  @override
  final int rate;
  @override
  final Limits limits;
  @override
  final Fees fees;

  @override
  String toString() {
    return 'SupportedPair(name: $name, hash: $hash, rate: $rate, limits: $limits, fees: $fees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportedPairImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.limits, limits) || other.limits == limits) &&
            (identical(other.fees, fees) || other.fees == fees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, hash, rate, limits, fees);

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportedPairImplCopyWith<_$SupportedPairImpl> get copyWith =>
      __$$SupportedPairImplCopyWithImpl<_$SupportedPairImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportedPairImplToJson(
      this,
    );
  }
}

abstract class _SupportedPair implements SupportedPair {
  const factory _SupportedPair(
      {required final String name,
      required final String hash,
      required final int rate,
      required final Limits limits,
      required final Fees fees}) = _$SupportedPairImpl;

  factory _SupportedPair.fromJson(Map<String, dynamic> json) =
      _$SupportedPairImpl.fromJson;

  @override
  String get name;
  @override
  String get hash;
  @override
  int get rate;
  @override
  Limits get limits;
  @override
  Fees get fees;

  /// Create a copy of SupportedPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportedPairImplCopyWith<_$SupportedPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Fees _$FeesFromJson(Map<String, dynamic> json) {
  return _Fees.fromJson(json);
}

/// @nodoc
mixin _$Fees {
  double get percentage => throw _privateConstructorUsedError;
  double get percentageSwapIn => throw _privateConstructorUsedError;
  MinerFees get minerFees => throw _privateConstructorUsedError;

  /// Serializes this Fees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeesCopyWith<Fees> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeesCopyWith<$Res> {
  factory $FeesCopyWith(Fees value, $Res Function(Fees) then) =
      _$FeesCopyWithImpl<$Res, Fees>;
  @useResult
  $Res call({double percentage, double percentageSwapIn, MinerFees minerFees});

  $MinerFeesCopyWith<$Res> get minerFees;
}

/// @nodoc
class _$FeesCopyWithImpl<$Res, $Val extends Fees>
    implements $FeesCopyWith<$Res> {
  _$FeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? percentageSwapIn = null,
    Object? minerFees = null,
  }) {
    return _then(_value.copyWith(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      percentageSwapIn: null == percentageSwapIn
          ? _value.percentageSwapIn
          : percentageSwapIn // ignore: cast_nullable_to_non_nullable
              as double,
      minerFees: null == minerFees
          ? _value.minerFees
          : minerFees // ignore: cast_nullable_to_non_nullable
              as MinerFees,
    ) as $Val);
  }

  /// Create a copy of Fees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MinerFeesCopyWith<$Res> get minerFees {
    return $MinerFeesCopyWith<$Res>(_value.minerFees, (value) {
      return _then(_value.copyWith(minerFees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeesImplCopyWith<$Res> implements $FeesCopyWith<$Res> {
  factory _$$FeesImplCopyWith(
          _$FeesImpl value, $Res Function(_$FeesImpl) then) =
      __$$FeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double percentage, double percentageSwapIn, MinerFees minerFees});

  @override
  $MinerFeesCopyWith<$Res> get minerFees;
}

/// @nodoc
class __$$FeesImplCopyWithImpl<$Res>
    extends _$FeesCopyWithImpl<$Res, _$FeesImpl>
    implements _$$FeesImplCopyWith<$Res> {
  __$$FeesImplCopyWithImpl(_$FeesImpl _value, $Res Function(_$FeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? percentageSwapIn = null,
    Object? minerFees = null,
  }) {
    return _then(_$FeesImpl(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      percentageSwapIn: null == percentageSwapIn
          ? _value.percentageSwapIn
          : percentageSwapIn // ignore: cast_nullable_to_non_nullable
              as double,
      minerFees: null == minerFees
          ? _value.minerFees
          : minerFees // ignore: cast_nullable_to_non_nullable
              as MinerFees,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeesImpl implements _Fees {
  const _$FeesImpl(
      {required this.percentage,
      required this.percentageSwapIn,
      required this.minerFees});

  factory _$FeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeesImplFromJson(json);

  @override
  final double percentage;
  @override
  final double percentageSwapIn;
  @override
  final MinerFees minerFees;

  @override
  String toString() {
    return 'Fees(percentage: $percentage, percentageSwapIn: $percentageSwapIn, minerFees: $minerFees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeesImpl &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.percentageSwapIn, percentageSwapIn) ||
                other.percentageSwapIn == percentageSwapIn) &&
            (identical(other.minerFees, minerFees) ||
                other.minerFees == minerFees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, percentage, percentageSwapIn, minerFees);

  /// Create a copy of Fees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeesImplCopyWith<_$FeesImpl> get copyWith =>
      __$$FeesImplCopyWithImpl<_$FeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeesImplToJson(
      this,
    );
  }
}

abstract class _Fees implements Fees {
  const factory _Fees(
      {required final double percentage,
      required final double percentageSwapIn,
      required final MinerFees minerFees}) = _$FeesImpl;

  factory _Fees.fromJson(Map<String, dynamic> json) = _$FeesImpl.fromJson;

  @override
  double get percentage;
  @override
  double get percentageSwapIn;
  @override
  MinerFees get minerFees;

  /// Create a copy of Fees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeesImplCopyWith<_$FeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MinerFees _$MinerFeesFromJson(Map<String, dynamic> json) {
  return _MinerFees.fromJson(json);
}

/// @nodoc
mixin _$MinerFees {
  EAsset get baseAsset => throw _privateConstructorUsedError;
  EAsset get quoteAsset => throw _privateConstructorUsedError;

  /// Serializes this MinerFees to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MinerFeesCopyWith<MinerFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinerFeesCopyWith<$Res> {
  factory $MinerFeesCopyWith(MinerFees value, $Res Function(MinerFees) then) =
      _$MinerFeesCopyWithImpl<$Res, MinerFees>;
  @useResult
  $Res call({EAsset baseAsset, EAsset quoteAsset});

  $EAssetCopyWith<$Res> get baseAsset;
  $EAssetCopyWith<$Res> get quoteAsset;
}

/// @nodoc
class _$MinerFeesCopyWithImpl<$Res, $Val extends MinerFees>
    implements $MinerFeesCopyWith<$Res> {
  _$MinerFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseAsset = null,
    Object? quoteAsset = null,
  }) {
    return _then(_value.copyWith(
      baseAsset: null == baseAsset
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as EAsset,
      quoteAsset: null == quoteAsset
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as EAsset,
    ) as $Val);
  }

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EAssetCopyWith<$Res> get baseAsset {
    return $EAssetCopyWith<$Res>(_value.baseAsset, (value) {
      return _then(_value.copyWith(baseAsset: value) as $Val);
    });
  }

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EAssetCopyWith<$Res> get quoteAsset {
    return $EAssetCopyWith<$Res>(_value.quoteAsset, (value) {
      return _then(_value.copyWith(quoteAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MinerFeesImplCopyWith<$Res>
    implements $MinerFeesCopyWith<$Res> {
  factory _$$MinerFeesImplCopyWith(
          _$MinerFeesImpl value, $Res Function(_$MinerFeesImpl) then) =
      __$$MinerFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EAsset baseAsset, EAsset quoteAsset});

  @override
  $EAssetCopyWith<$Res> get baseAsset;
  @override
  $EAssetCopyWith<$Res> get quoteAsset;
}

/// @nodoc
class __$$MinerFeesImplCopyWithImpl<$Res>
    extends _$MinerFeesCopyWithImpl<$Res, _$MinerFeesImpl>
    implements _$$MinerFeesImplCopyWith<$Res> {
  __$$MinerFeesImplCopyWithImpl(
      _$MinerFeesImpl _value, $Res Function(_$MinerFeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseAsset = null,
    Object? quoteAsset = null,
  }) {
    return _then(_$MinerFeesImpl(
      baseAsset: null == baseAsset
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as EAsset,
      quoteAsset: null == quoteAsset
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as EAsset,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MinerFeesImpl implements _MinerFees {
  const _$MinerFeesImpl({required this.baseAsset, required this.quoteAsset});

  factory _$MinerFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MinerFeesImplFromJson(json);

  @override
  final EAsset baseAsset;
  @override
  final EAsset quoteAsset;

  @override
  String toString() {
    return 'MinerFees(baseAsset: $baseAsset, quoteAsset: $quoteAsset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinerFeesImpl &&
            (identical(other.baseAsset, baseAsset) ||
                other.baseAsset == baseAsset) &&
            (identical(other.quoteAsset, quoteAsset) ||
                other.quoteAsset == quoteAsset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseAsset, quoteAsset);

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MinerFeesImplCopyWith<_$MinerFeesImpl> get copyWith =>
      __$$MinerFeesImplCopyWithImpl<_$MinerFeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MinerFeesImplToJson(
      this,
    );
  }
}

abstract class _MinerFees implements MinerFees {
  const factory _MinerFees(
      {required final EAsset baseAsset,
      required final EAsset quoteAsset}) = _$MinerFeesImpl;

  factory _MinerFees.fromJson(Map<String, dynamic> json) =
      _$MinerFeesImpl.fromJson;

  @override
  EAsset get baseAsset;
  @override
  EAsset get quoteAsset;

  /// Create a copy of MinerFees
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MinerFeesImplCopyWith<_$MinerFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EAsset _$EAssetFromJson(Map<String, dynamic> json) {
  return _EAsset.fromJson(json);
}

/// @nodoc
mixin _$EAsset {
  int get normal => throw _privateConstructorUsedError;
  Reverse get reverse => throw _privateConstructorUsedError;

  /// Serializes this EAsset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EAsset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EAssetCopyWith<EAsset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EAssetCopyWith<$Res> {
  factory $EAssetCopyWith(EAsset value, $Res Function(EAsset) then) =
      _$EAssetCopyWithImpl<$Res, EAsset>;
  @useResult
  $Res call({int normal, Reverse reverse});

  $ReverseCopyWith<$Res> get reverse;
}

/// @nodoc
class _$EAssetCopyWithImpl<$Res, $Val extends EAsset>
    implements $EAssetCopyWith<$Res> {
  _$EAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EAsset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normal = null,
    Object? reverse = null,
  }) {
    return _then(_value.copyWith(
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as int,
      reverse: null == reverse
          ? _value.reverse
          : reverse // ignore: cast_nullable_to_non_nullable
              as Reverse,
    ) as $Val);
  }

  /// Create a copy of EAsset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReverseCopyWith<$Res> get reverse {
    return $ReverseCopyWith<$Res>(_value.reverse, (value) {
      return _then(_value.copyWith(reverse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EAssetImplCopyWith<$Res> implements $EAssetCopyWith<$Res> {
  factory _$$EAssetImplCopyWith(
          _$EAssetImpl value, $Res Function(_$EAssetImpl) then) =
      __$$EAssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int normal, Reverse reverse});

  @override
  $ReverseCopyWith<$Res> get reverse;
}

/// @nodoc
class __$$EAssetImplCopyWithImpl<$Res>
    extends _$EAssetCopyWithImpl<$Res, _$EAssetImpl>
    implements _$$EAssetImplCopyWith<$Res> {
  __$$EAssetImplCopyWithImpl(
      _$EAssetImpl _value, $Res Function(_$EAssetImpl) _then)
      : super(_value, _then);

  /// Create a copy of EAsset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normal = null,
    Object? reverse = null,
  }) {
    return _then(_$EAssetImpl(
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as int,
      reverse: null == reverse
          ? _value.reverse
          : reverse // ignore: cast_nullable_to_non_nullable
              as Reverse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EAssetImpl implements _EAsset {
  const _$EAssetImpl({required this.normal, required this.reverse});

  factory _$EAssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$EAssetImplFromJson(json);

  @override
  final int normal;
  @override
  final Reverse reverse;

  @override
  String toString() {
    return 'EAsset(normal: $normal, reverse: $reverse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EAssetImpl &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.reverse, reverse) || other.reverse == reverse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, normal, reverse);

  /// Create a copy of EAsset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EAssetImplCopyWith<_$EAssetImpl> get copyWith =>
      __$$EAssetImplCopyWithImpl<_$EAssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EAssetImplToJson(
      this,
    );
  }
}

abstract class _EAsset implements EAsset {
  const factory _EAsset(
      {required final int normal,
      required final Reverse reverse}) = _$EAssetImpl;

  factory _EAsset.fromJson(Map<String, dynamic> json) = _$EAssetImpl.fromJson;

  @override
  int get normal;
  @override
  Reverse get reverse;

  /// Create a copy of EAsset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EAssetImplCopyWith<_$EAssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reverse _$ReverseFromJson(Map<String, dynamic> json) {
  return _Reverse.fromJson(json);
}

/// @nodoc
mixin _$Reverse {
  int get claim => throw _privateConstructorUsedError;
  int get lockup => throw _privateConstructorUsedError;

  /// Serializes this Reverse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reverse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseCopyWith<Reverse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseCopyWith<$Res> {
  factory $ReverseCopyWith(Reverse value, $Res Function(Reverse) then) =
      _$ReverseCopyWithImpl<$Res, Reverse>;
  @useResult
  $Res call({int claim, int lockup});
}

/// @nodoc
class _$ReverseCopyWithImpl<$Res, $Val extends Reverse>
    implements $ReverseCopyWith<$Res> {
  _$ReverseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reverse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claim = null,
    Object? lockup = null,
  }) {
    return _then(_value.copyWith(
      claim: null == claim
          ? _value.claim
          : claim // ignore: cast_nullable_to_non_nullable
              as int,
      lockup: null == lockup
          ? _value.lockup
          : lockup // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReverseImplCopyWith<$Res> implements $ReverseCopyWith<$Res> {
  factory _$$ReverseImplCopyWith(
          _$ReverseImpl value, $Res Function(_$ReverseImpl) then) =
      __$$ReverseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int claim, int lockup});
}

/// @nodoc
class __$$ReverseImplCopyWithImpl<$Res>
    extends _$ReverseCopyWithImpl<$Res, _$ReverseImpl>
    implements _$$ReverseImplCopyWith<$Res> {
  __$$ReverseImplCopyWithImpl(
      _$ReverseImpl _value, $Res Function(_$ReverseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reverse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claim = null,
    Object? lockup = null,
  }) {
    return _then(_$ReverseImpl(
      claim: null == claim
          ? _value.claim
          : claim // ignore: cast_nullable_to_non_nullable
              as int,
      lockup: null == lockup
          ? _value.lockup
          : lockup // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseImpl implements _Reverse {
  const _$ReverseImpl({required this.claim, required this.lockup});

  factory _$ReverseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReverseImplFromJson(json);

  @override
  final int claim;
  @override
  final int lockup;

  @override
  String toString() {
    return 'Reverse(claim: $claim, lockup: $lockup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseImpl &&
            (identical(other.claim, claim) || other.claim == claim) &&
            (identical(other.lockup, lockup) || other.lockup == lockup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, claim, lockup);

  /// Create a copy of Reverse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseImplCopyWith<_$ReverseImpl> get copyWith =>
      __$$ReverseImplCopyWithImpl<_$ReverseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseImplToJson(
      this,
    );
  }
}

abstract class _Reverse implements Reverse {
  const factory _Reverse(
      {required final int claim, required final int lockup}) = _$ReverseImpl;

  factory _Reverse.fromJson(Map<String, dynamic> json) = _$ReverseImpl.fromJson;

  @override
  int get claim;
  @override
  int get lockup;

  /// Create a copy of Reverse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseImplCopyWith<_$ReverseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Limits _$LimitsFromJson(Map<String, dynamic> json) {
  return _Limits.fromJson(json);
}

/// @nodoc
mixin _$Limits {
  int get maximal => throw _privateConstructorUsedError;
  int get minimal => throw _privateConstructorUsedError;
  MaximalZeroConf get maximalZeroConf => throw _privateConstructorUsedError;

  /// Serializes this Limits to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Limits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LimitsCopyWith<Limits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LimitsCopyWith<$Res> {
  factory $LimitsCopyWith(Limits value, $Res Function(Limits) then) =
      _$LimitsCopyWithImpl<$Res, Limits>;
  @useResult
  $Res call({int maximal, int minimal, MaximalZeroConf maximalZeroConf});

  $MaximalZeroConfCopyWith<$Res> get maximalZeroConf;
}

/// @nodoc
class _$LimitsCopyWithImpl<$Res, $Val extends Limits>
    implements $LimitsCopyWith<$Res> {
  _$LimitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Limits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maximal = null,
    Object? minimal = null,
    Object? maximalZeroConf = null,
  }) {
    return _then(_value.copyWith(
      maximal: null == maximal
          ? _value.maximal
          : maximal // ignore: cast_nullable_to_non_nullable
              as int,
      minimal: null == minimal
          ? _value.minimal
          : minimal // ignore: cast_nullable_to_non_nullable
              as int,
      maximalZeroConf: null == maximalZeroConf
          ? _value.maximalZeroConf
          : maximalZeroConf // ignore: cast_nullable_to_non_nullable
              as MaximalZeroConf,
    ) as $Val);
  }

  /// Create a copy of Limits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaximalZeroConfCopyWith<$Res> get maximalZeroConf {
    return $MaximalZeroConfCopyWith<$Res>(_value.maximalZeroConf, (value) {
      return _then(_value.copyWith(maximalZeroConf: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LimitsImplCopyWith<$Res> implements $LimitsCopyWith<$Res> {
  factory _$$LimitsImplCopyWith(
          _$LimitsImpl value, $Res Function(_$LimitsImpl) then) =
      __$$LimitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int maximal, int minimal, MaximalZeroConf maximalZeroConf});

  @override
  $MaximalZeroConfCopyWith<$Res> get maximalZeroConf;
}

/// @nodoc
class __$$LimitsImplCopyWithImpl<$Res>
    extends _$LimitsCopyWithImpl<$Res, _$LimitsImpl>
    implements _$$LimitsImplCopyWith<$Res> {
  __$$LimitsImplCopyWithImpl(
      _$LimitsImpl _value, $Res Function(_$LimitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Limits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maximal = null,
    Object? minimal = null,
    Object? maximalZeroConf = null,
  }) {
    return _then(_$LimitsImpl(
      maximal: null == maximal
          ? _value.maximal
          : maximal // ignore: cast_nullable_to_non_nullable
              as int,
      minimal: null == minimal
          ? _value.minimal
          : minimal // ignore: cast_nullable_to_non_nullable
              as int,
      maximalZeroConf: null == maximalZeroConf
          ? _value.maximalZeroConf
          : maximalZeroConf // ignore: cast_nullable_to_non_nullable
              as MaximalZeroConf,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LimitsImpl implements _Limits {
  const _$LimitsImpl(
      {required this.maximal,
      required this.minimal,
      required this.maximalZeroConf});

  factory _$LimitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LimitsImplFromJson(json);

  @override
  final int maximal;
  @override
  final int minimal;
  @override
  final MaximalZeroConf maximalZeroConf;

  @override
  String toString() {
    return 'Limits(maximal: $maximal, minimal: $minimal, maximalZeroConf: $maximalZeroConf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LimitsImpl &&
            (identical(other.maximal, maximal) || other.maximal == maximal) &&
            (identical(other.minimal, minimal) || other.minimal == minimal) &&
            (identical(other.maximalZeroConf, maximalZeroConf) ||
                other.maximalZeroConf == maximalZeroConf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maximal, minimal, maximalZeroConf);

  /// Create a copy of Limits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LimitsImplCopyWith<_$LimitsImpl> get copyWith =>
      __$$LimitsImplCopyWithImpl<_$LimitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LimitsImplToJson(
      this,
    );
  }
}

abstract class _Limits implements Limits {
  const factory _Limits(
      {required final int maximal,
      required final int minimal,
      required final MaximalZeroConf maximalZeroConf}) = _$LimitsImpl;

  factory _Limits.fromJson(Map<String, dynamic> json) = _$LimitsImpl.fromJson;

  @override
  int get maximal;
  @override
  int get minimal;
  @override
  MaximalZeroConf get maximalZeroConf;

  /// Create a copy of Limits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LimitsImplCopyWith<_$LimitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaximalZeroConf _$MaximalZeroConfFromJson(Map<String, dynamic> json) {
  return _MaximalZeroConf.fromJson(json);
}

/// @nodoc
mixin _$MaximalZeroConf {
  int get baseAsset => throw _privateConstructorUsedError;
  int get quoteAsset => throw _privateConstructorUsedError;

  /// Serializes this MaximalZeroConf to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaximalZeroConf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaximalZeroConfCopyWith<MaximalZeroConf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaximalZeroConfCopyWith<$Res> {
  factory $MaximalZeroConfCopyWith(
          MaximalZeroConf value, $Res Function(MaximalZeroConf) then) =
      _$MaximalZeroConfCopyWithImpl<$Res, MaximalZeroConf>;
  @useResult
  $Res call({int baseAsset, int quoteAsset});
}

/// @nodoc
class _$MaximalZeroConfCopyWithImpl<$Res, $Val extends MaximalZeroConf>
    implements $MaximalZeroConfCopyWith<$Res> {
  _$MaximalZeroConfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaximalZeroConf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseAsset = null,
    Object? quoteAsset = null,
  }) {
    return _then(_value.copyWith(
      baseAsset: null == baseAsset
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as int,
      quoteAsset: null == quoteAsset
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaximalZeroConfImplCopyWith<$Res>
    implements $MaximalZeroConfCopyWith<$Res> {
  factory _$$MaximalZeroConfImplCopyWith(_$MaximalZeroConfImpl value,
          $Res Function(_$MaximalZeroConfImpl) then) =
      __$$MaximalZeroConfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int baseAsset, int quoteAsset});
}

/// @nodoc
class __$$MaximalZeroConfImplCopyWithImpl<$Res>
    extends _$MaximalZeroConfCopyWithImpl<$Res, _$MaximalZeroConfImpl>
    implements _$$MaximalZeroConfImplCopyWith<$Res> {
  __$$MaximalZeroConfImplCopyWithImpl(
      _$MaximalZeroConfImpl _value, $Res Function(_$MaximalZeroConfImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaximalZeroConf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseAsset = null,
    Object? quoteAsset = null,
  }) {
    return _then(_$MaximalZeroConfImpl(
      baseAsset: null == baseAsset
          ? _value.baseAsset
          : baseAsset // ignore: cast_nullable_to_non_nullable
              as int,
      quoteAsset: null == quoteAsset
          ? _value.quoteAsset
          : quoteAsset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaximalZeroConfImpl implements _MaximalZeroConf {
  const _$MaximalZeroConfImpl(
      {required this.baseAsset, required this.quoteAsset});

  factory _$MaximalZeroConfImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaximalZeroConfImplFromJson(json);

  @override
  final int baseAsset;
  @override
  final int quoteAsset;

  @override
  String toString() {
    return 'MaximalZeroConf(baseAsset: $baseAsset, quoteAsset: $quoteAsset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaximalZeroConfImpl &&
            (identical(other.baseAsset, baseAsset) ||
                other.baseAsset == baseAsset) &&
            (identical(other.quoteAsset, quoteAsset) ||
                other.quoteAsset == quoteAsset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseAsset, quoteAsset);

  /// Create a copy of MaximalZeroConf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaximalZeroConfImplCopyWith<_$MaximalZeroConfImpl> get copyWith =>
      __$$MaximalZeroConfImplCopyWithImpl<_$MaximalZeroConfImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaximalZeroConfImplToJson(
      this,
    );
  }
}

abstract class _MaximalZeroConf implements MaximalZeroConf {
  const factory _MaximalZeroConf(
      {required final int baseAsset,
      required final int quoteAsset}) = _$MaximalZeroConfImpl;

  factory _MaximalZeroConf.fromJson(Map<String, dynamic> json) =
      _$MaximalZeroConfImpl.fromJson;

  @override
  int get baseAsset;
  @override
  int get quoteAsset;

  /// Create a copy of MaximalZeroConf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaximalZeroConfImplCopyWith<_$MaximalZeroConfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

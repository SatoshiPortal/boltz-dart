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
mixin _$BtcSwapScriptStr {
  SwapType get swapType => throw _privateConstructorUsedError;
  String? get fundingAddrs => throw _privateConstructorUsedError;
  String get hashlock => throw _privateConstructorUsedError;
  String get receiverPubkey => throw _privateConstructorUsedError;
  int get locktime => throw _privateConstructorUsedError;
  String get senderPubkey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey)
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SwapType swapType, String? fundingAddrs, String hashlock,
            String receiverPubkey, int locktime, String senderPubkey)?
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SwapType swapType, String? fundingAddrs, String hashlock,
            String receiverPubkey, int locktime, String senderPubkey)?
        raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BtcSwapScriptStr value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BtcSwapScriptStr value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BtcSwapScriptStr value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BtcSwapScriptStrCopyWith<BtcSwapScriptStr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcSwapScriptStrCopyWith<$Res> {
  factory $BtcSwapScriptStrCopyWith(
          BtcSwapScriptStr value, $Res Function(BtcSwapScriptStr) then) =
      _$BtcSwapScriptStrCopyWithImpl<$Res, BtcSwapScriptStr>;
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey});
}

/// @nodoc
class _$BtcSwapScriptStrCopyWithImpl<$Res, $Val extends BtcSwapScriptStr>
    implements $BtcSwapScriptStrCopyWith<$Res> {
  _$BtcSwapScriptStrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
  }) {
    return _then(_value.copyWith(
      swapType: null == swapType
          ? _value.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _value.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _value.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _value.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _value.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _value.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BtcSwapScriptStrImplCopyWith<$Res>
    implements $BtcSwapScriptStrCopyWith<$Res> {
  factory _$$BtcSwapScriptStrImplCopyWith(_$BtcSwapScriptStrImpl value,
          $Res Function(_$BtcSwapScriptStrImpl) then) =
      __$$BtcSwapScriptStrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey});
}

/// @nodoc
class __$$BtcSwapScriptStrImplCopyWithImpl<$Res>
    extends _$BtcSwapScriptStrCopyWithImpl<$Res, _$BtcSwapScriptStrImpl>
    implements _$$BtcSwapScriptStrImplCopyWith<$Res> {
  __$$BtcSwapScriptStrImplCopyWithImpl(_$BtcSwapScriptStrImpl _value,
      $Res Function(_$BtcSwapScriptStrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
  }) {
    return _then(_$BtcSwapScriptStrImpl(
      swapType: null == swapType
          ? _value.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _value.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _value.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _value.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _value.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _value.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BtcSwapScriptStrImpl extends _BtcSwapScriptStr {
  const _$BtcSwapScriptStrImpl(
      {required this.swapType,
      this.fundingAddrs,
      required this.hashlock,
      required this.receiverPubkey,
      required this.locktime,
      required this.senderPubkey})
      : super._();

  @override
  final SwapType swapType;
  @override
  final String? fundingAddrs;
  @override
  final String hashlock;
  @override
  final String receiverPubkey;
  @override
  final int locktime;
  @override
  final String senderPubkey;

  @override
  String toString() {
    return 'BtcSwapScriptStr.raw(swapType: $swapType, fundingAddrs: $fundingAddrs, hashlock: $hashlock, receiverPubkey: $receiverPubkey, locktime: $locktime, senderPubkey: $senderPubkey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BtcSwapScriptStrImpl &&
            (identical(other.swapType, swapType) ||
                other.swapType == swapType) &&
            (identical(other.fundingAddrs, fundingAddrs) ||
                other.fundingAddrs == fundingAddrs) &&
            (identical(other.hashlock, hashlock) ||
                other.hashlock == hashlock) &&
            (identical(other.receiverPubkey, receiverPubkey) ||
                other.receiverPubkey == receiverPubkey) &&
            (identical(other.locktime, locktime) ||
                other.locktime == locktime) &&
            (identical(other.senderPubkey, senderPubkey) ||
                other.senderPubkey == senderPubkey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swapType, fundingAddrs, hashlock,
      receiverPubkey, locktime, senderPubkey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BtcSwapScriptStrImplCopyWith<_$BtcSwapScriptStrImpl> get copyWith =>
      __$$BtcSwapScriptStrImplCopyWithImpl<_$BtcSwapScriptStrImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey)
        raw,
  }) {
    return raw(swapType, fundingAddrs, hashlock, receiverPubkey, locktime,
        senderPubkey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SwapType swapType, String? fundingAddrs, String hashlock,
            String receiverPubkey, int locktime, String senderPubkey)?
        raw,
  }) {
    return raw?.call(swapType, fundingAddrs, hashlock, receiverPubkey, locktime,
        senderPubkey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SwapType swapType, String? fundingAddrs, String hashlock,
            String receiverPubkey, int locktime, String senderPubkey)?
        raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(swapType, fundingAddrs, hashlock, receiverPubkey, locktime,
          senderPubkey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BtcSwapScriptStr value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BtcSwapScriptStr value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BtcSwapScriptStr value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }
}

abstract class _BtcSwapScriptStr extends BtcSwapScriptStr {
  const factory _BtcSwapScriptStr(
      {required final SwapType swapType,
      final String? fundingAddrs,
      required final String hashlock,
      required final String receiverPubkey,
      required final int locktime,
      required final String senderPubkey}) = _$BtcSwapScriptStrImpl;
  const _BtcSwapScriptStr._() : super._();

  @override
  SwapType get swapType;
  @override
  String? get fundingAddrs;
  @override
  String get hashlock;
  @override
  String get receiverPubkey;
  @override
  int get locktime;
  @override
  String get senderPubkey;
  @override
  @JsonKey(ignore: true)
  _$$BtcSwapScriptStrImplCopyWith<_$BtcSwapScriptStrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChainFees {
  double get percentage => throw _privateConstructorUsedError;
  int get userLockup => throw _privateConstructorUsedError;
  int get userClaim => throw _privateConstructorUsedError;
  int get server => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChainFeesCopyWith<ChainFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainFeesCopyWith<$Res> {
  factory $ChainFeesCopyWith(ChainFees value, $Res Function(ChainFees) then) =
      _$ChainFeesCopyWithImpl<$Res, ChainFees>;
  @useResult
  $Res call({double percentage, int userLockup, int userClaim, int server});
}

/// @nodoc
class _$ChainFeesCopyWithImpl<$Res, $Val extends ChainFees>
    implements $ChainFeesCopyWith<$Res> {
  _$ChainFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? userLockup = null,
    Object? userClaim = null,
    Object? server = null,
  }) {
    return _then(_value.copyWith(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      userLockup: null == userLockup
          ? _value.userLockup
          : userLockup // ignore: cast_nullable_to_non_nullable
              as int,
      userClaim: null == userClaim
          ? _value.userClaim
          : userClaim // ignore: cast_nullable_to_non_nullable
              as int,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChainFeesImplCopyWith<$Res>
    implements $ChainFeesCopyWith<$Res> {
  factory _$$ChainFeesImplCopyWith(
          _$ChainFeesImpl value, $Res Function(_$ChainFeesImpl) then) =
      __$$ChainFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double percentage, int userLockup, int userClaim, int server});
}

/// @nodoc
class __$$ChainFeesImplCopyWithImpl<$Res>
    extends _$ChainFeesCopyWithImpl<$Res, _$ChainFeesImpl>
    implements _$$ChainFeesImplCopyWith<$Res> {
  __$$ChainFeesImplCopyWithImpl(
      _$ChainFeesImpl _value, $Res Function(_$ChainFeesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? userLockup = null,
    Object? userClaim = null,
    Object? server = null,
  }) {
    return _then(_$ChainFeesImpl(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      userLockup: null == userLockup
          ? _value.userLockup
          : userLockup // ignore: cast_nullable_to_non_nullable
              as int,
      userClaim: null == userClaim
          ? _value.userClaim
          : userClaim // ignore: cast_nullable_to_non_nullable
              as int,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChainFeesImpl implements _ChainFees {
  const _$ChainFeesImpl(
      {required this.percentage,
      required this.userLockup,
      required this.userClaim,
      required this.server});

  @override
  final double percentage;
  @override
  final int userLockup;
  @override
  final int userClaim;
  @override
  final int server;

  @override
  String toString() {
    return 'ChainFees(percentage: $percentage, userLockup: $userLockup, userClaim: $userClaim, server: $server)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainFeesImpl &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.userLockup, userLockup) ||
                other.userLockup == userLockup) &&
            (identical(other.userClaim, userClaim) ||
                other.userClaim == userClaim) &&
            (identical(other.server, server) || other.server == server));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, percentage, userLockup, userClaim, server);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainFeesImplCopyWith<_$ChainFeesImpl> get copyWith =>
      __$$ChainFeesImplCopyWithImpl<_$ChainFeesImpl>(this, _$identity);
}

abstract class _ChainFees implements ChainFees {
  const factory _ChainFees(
      {required final double percentage,
      required final int userLockup,
      required final int userClaim,
      required final int server}) = _$ChainFeesImpl;

  @override
  double get percentage;
  @override
  int get userLockup;
  @override
  int get userClaim;
  @override
  int get server;
  @override
  @JsonKey(ignore: true)
  _$$ChainFeesImplCopyWith<_$ChainFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChainFeesAndLimits {
  Limits get btcLimits => throw _privateConstructorUsedError;
  Limits get lbtcLimits => throw _privateConstructorUsedError;
  ChainFees get btcFees => throw _privateConstructorUsedError;
  ChainFees get lbtcFees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChainFeesAndLimitsCopyWith<ChainFeesAndLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainFeesAndLimitsCopyWith<$Res> {
  factory $ChainFeesAndLimitsCopyWith(
          ChainFeesAndLimits value, $Res Function(ChainFeesAndLimits) then) =
      _$ChainFeesAndLimitsCopyWithImpl<$Res, ChainFeesAndLimits>;
  @useResult
  $Res call(
      {Limits btcLimits,
      Limits lbtcLimits,
      ChainFees btcFees,
      ChainFees lbtcFees});

  $LimitsCopyWith<$Res> get btcLimits;
  $LimitsCopyWith<$Res> get lbtcLimits;
  $ChainFeesCopyWith<$Res> get btcFees;
  $ChainFeesCopyWith<$Res> get lbtcFees;
}

/// @nodoc
class _$ChainFeesAndLimitsCopyWithImpl<$Res, $Val extends ChainFeesAndLimits>
    implements $ChainFeesAndLimitsCopyWith<$Res> {
  _$ChainFeesAndLimitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btcLimits = null,
    Object? lbtcLimits = null,
    Object? btcFees = null,
    Object? lbtcFees = null,
  }) {
    return _then(_value.copyWith(
      btcLimits: null == btcLimits
          ? _value.btcLimits
          : btcLimits // ignore: cast_nullable_to_non_nullable
              as Limits,
      lbtcLimits: null == lbtcLimits
          ? _value.lbtcLimits
          : lbtcLimits // ignore: cast_nullable_to_non_nullable
              as Limits,
      btcFees: null == btcFees
          ? _value.btcFees
          : btcFees // ignore: cast_nullable_to_non_nullable
              as ChainFees,
      lbtcFees: null == lbtcFees
          ? _value.lbtcFees
          : lbtcFees // ignore: cast_nullable_to_non_nullable
              as ChainFees,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LimitsCopyWith<$Res> get btcLimits {
    return $LimitsCopyWith<$Res>(_value.btcLimits, (value) {
      return _then(_value.copyWith(btcLimits: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LimitsCopyWith<$Res> get lbtcLimits {
    return $LimitsCopyWith<$Res>(_value.lbtcLimits, (value) {
      return _then(_value.copyWith(lbtcLimits: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChainFeesCopyWith<$Res> get btcFees {
    return $ChainFeesCopyWith<$Res>(_value.btcFees, (value) {
      return _then(_value.copyWith(btcFees: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChainFeesCopyWith<$Res> get lbtcFees {
    return $ChainFeesCopyWith<$Res>(_value.lbtcFees, (value) {
      return _then(_value.copyWith(lbtcFees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChainFeesAndLimitsImplCopyWith<$Res>
    implements $ChainFeesAndLimitsCopyWith<$Res> {
  factory _$$ChainFeesAndLimitsImplCopyWith(_$ChainFeesAndLimitsImpl value,
          $Res Function(_$ChainFeesAndLimitsImpl) then) =
      __$$ChainFeesAndLimitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Limits btcLimits,
      Limits lbtcLimits,
      ChainFees btcFees,
      ChainFees lbtcFees});

  @override
  $LimitsCopyWith<$Res> get btcLimits;
  @override
  $LimitsCopyWith<$Res> get lbtcLimits;
  @override
  $ChainFeesCopyWith<$Res> get btcFees;
  @override
  $ChainFeesCopyWith<$Res> get lbtcFees;
}

/// @nodoc
class __$$ChainFeesAndLimitsImplCopyWithImpl<$Res>
    extends _$ChainFeesAndLimitsCopyWithImpl<$Res, _$ChainFeesAndLimitsImpl>
    implements _$$ChainFeesAndLimitsImplCopyWith<$Res> {
  __$$ChainFeesAndLimitsImplCopyWithImpl(_$ChainFeesAndLimitsImpl _value,
      $Res Function(_$ChainFeesAndLimitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btcLimits = null,
    Object? lbtcLimits = null,
    Object? btcFees = null,
    Object? lbtcFees = null,
  }) {
    return _then(_$ChainFeesAndLimitsImpl(
      btcLimits: null == btcLimits
          ? _value.btcLimits
          : btcLimits // ignore: cast_nullable_to_non_nullable
              as Limits,
      lbtcLimits: null == lbtcLimits
          ? _value.lbtcLimits
          : lbtcLimits // ignore: cast_nullable_to_non_nullable
              as Limits,
      btcFees: null == btcFees
          ? _value.btcFees
          : btcFees // ignore: cast_nullable_to_non_nullable
              as ChainFees,
      lbtcFees: null == lbtcFees
          ? _value.lbtcFees
          : lbtcFees // ignore: cast_nullable_to_non_nullable
              as ChainFees,
    ));
  }
}

/// @nodoc

class _$ChainFeesAndLimitsImpl implements _ChainFeesAndLimits {
  const _$ChainFeesAndLimitsImpl(
      {required this.btcLimits,
      required this.lbtcLimits,
      required this.btcFees,
      required this.lbtcFees});

  @override
  final Limits btcLimits;
  @override
  final Limits lbtcLimits;
  @override
  final ChainFees btcFees;
  @override
  final ChainFees lbtcFees;

  @override
  String toString() {
    return 'ChainFeesAndLimits(btcLimits: $btcLimits, lbtcLimits: $lbtcLimits, btcFees: $btcFees, lbtcFees: $lbtcFees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainFeesAndLimitsImpl &&
            (identical(other.btcLimits, btcLimits) ||
                other.btcLimits == btcLimits) &&
            (identical(other.lbtcLimits, lbtcLimits) ||
                other.lbtcLimits == lbtcLimits) &&
            (identical(other.btcFees, btcFees) || other.btcFees == btcFees) &&
            (identical(other.lbtcFees, lbtcFees) ||
                other.lbtcFees == lbtcFees));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, btcLimits, lbtcLimits, btcFees, lbtcFees);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainFeesAndLimitsImplCopyWith<_$ChainFeesAndLimitsImpl> get copyWith =>
      __$$ChainFeesAndLimitsImplCopyWithImpl<_$ChainFeesAndLimitsImpl>(
          this, _$identity);
}

abstract class _ChainFeesAndLimits implements ChainFeesAndLimits {
  const factory _ChainFeesAndLimits(
      {required final Limits btcLimits,
      required final Limits lbtcLimits,
      required final ChainFees btcFees,
      required final ChainFees lbtcFees}) = _$ChainFeesAndLimitsImpl;

  @override
  Limits get btcLimits;
  @override
  Limits get lbtcLimits;
  @override
  ChainFees get btcFees;
  @override
  ChainFees get lbtcFees;
  @override
  @JsonKey(ignore: true)
  _$$ChainFeesAndLimitsImplCopyWith<_$ChainFeesAndLimitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DecodedInvoice {
  int get msats => throw _privateConstructorUsedError;
  int get expiry => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;
  int get expiresAt => throw _privateConstructorUsedError;
  bool get isExpired => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  int get cltvExpDelta => throw _privateConstructorUsedError;
  String? get bip21 => throw _privateConstructorUsedError;
  String get preimageHash => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DecodedInvoiceCopyWith<DecodedInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecodedInvoiceCopyWith<$Res> {
  factory $DecodedInvoiceCopyWith(
          DecodedInvoice value, $Res Function(DecodedInvoice) then) =
      _$DecodedInvoiceCopyWithImpl<$Res, DecodedInvoice>;
  @useResult
  $Res call(
      {int msats,
      int expiry,
      int expiresIn,
      int expiresAt,
      bool isExpired,
      String network,
      int cltvExpDelta,
      String? bip21,
      String preimageHash});
}

/// @nodoc
class _$DecodedInvoiceCopyWithImpl<$Res, $Val extends DecodedInvoice>
    implements $DecodedInvoiceCopyWith<$Res> {
  _$DecodedInvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msats = null,
    Object? expiry = null,
    Object? expiresIn = null,
    Object? expiresAt = null,
    Object? isExpired = null,
    Object? network = null,
    Object? cltvExpDelta = null,
    Object? bip21 = freezed,
    Object? preimageHash = null,
  }) {
    return _then(_value.copyWith(
      msats: null == msats
          ? _value.msats
          : msats // ignore: cast_nullable_to_non_nullable
              as int,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as int,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      cltvExpDelta: null == cltvExpDelta
          ? _value.cltvExpDelta
          : cltvExpDelta // ignore: cast_nullable_to_non_nullable
              as int,
      bip21: freezed == bip21
          ? _value.bip21
          : bip21 // ignore: cast_nullable_to_non_nullable
              as String?,
      preimageHash: null == preimageHash
          ? _value.preimageHash
          : preimageHash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecodedInvoiceImplCopyWith<$Res>
    implements $DecodedInvoiceCopyWith<$Res> {
  factory _$$DecodedInvoiceImplCopyWith(_$DecodedInvoiceImpl value,
          $Res Function(_$DecodedInvoiceImpl) then) =
      __$$DecodedInvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int msats,
      int expiry,
      int expiresIn,
      int expiresAt,
      bool isExpired,
      String network,
      int cltvExpDelta,
      String? bip21,
      String preimageHash});
}

/// @nodoc
class __$$DecodedInvoiceImplCopyWithImpl<$Res>
    extends _$DecodedInvoiceCopyWithImpl<$Res, _$DecodedInvoiceImpl>
    implements _$$DecodedInvoiceImplCopyWith<$Res> {
  __$$DecodedInvoiceImplCopyWithImpl(
      _$DecodedInvoiceImpl _value, $Res Function(_$DecodedInvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msats = null,
    Object? expiry = null,
    Object? expiresIn = null,
    Object? expiresAt = null,
    Object? isExpired = null,
    Object? network = null,
    Object? cltvExpDelta = null,
    Object? bip21 = freezed,
    Object? preimageHash = null,
  }) {
    return _then(_$DecodedInvoiceImpl(
      msats: null == msats
          ? _value.msats
          : msats // ignore: cast_nullable_to_non_nullable
              as int,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as int,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      cltvExpDelta: null == cltvExpDelta
          ? _value.cltvExpDelta
          : cltvExpDelta // ignore: cast_nullable_to_non_nullable
              as int,
      bip21: freezed == bip21
          ? _value.bip21
          : bip21 // ignore: cast_nullable_to_non_nullable
              as String?,
      preimageHash: null == preimageHash
          ? _value.preimageHash
          : preimageHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DecodedInvoiceImpl extends _DecodedInvoice {
  const _$DecodedInvoiceImpl(
      {required this.msats,
      required this.expiry,
      required this.expiresIn,
      required this.expiresAt,
      required this.isExpired,
      required this.network,
      required this.cltvExpDelta,
      this.bip21,
      required this.preimageHash})
      : super._();

  @override
  final int msats;
  @override
  final int expiry;
  @override
  final int expiresIn;
  @override
  final int expiresAt;
  @override
  final bool isExpired;
  @override
  final String network;
  @override
  final int cltvExpDelta;
  @override
  final String? bip21;
  @override
  final String preimageHash;

  @override
  String toString() {
    return 'DecodedInvoice(msats: $msats, expiry: $expiry, expiresIn: $expiresIn, expiresAt: $expiresAt, isExpired: $isExpired, network: $network, cltvExpDelta: $cltvExpDelta, bip21: $bip21, preimageHash: $preimageHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecodedInvoiceImpl &&
            (identical(other.msats, msats) || other.msats == msats) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.cltvExpDelta, cltvExpDelta) ||
                other.cltvExpDelta == cltvExpDelta) &&
            (identical(other.bip21, bip21) || other.bip21 == bip21) &&
            (identical(other.preimageHash, preimageHash) ||
                other.preimageHash == preimageHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msats, expiry, expiresIn,
      expiresAt, isExpired, network, cltvExpDelta, bip21, preimageHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecodedInvoiceImplCopyWith<_$DecodedInvoiceImpl> get copyWith =>
      __$$DecodedInvoiceImplCopyWithImpl<_$DecodedInvoiceImpl>(
          this, _$identity);
}

abstract class _DecodedInvoice extends DecodedInvoice {
  const factory _DecodedInvoice(
      {required final int msats,
      required final int expiry,
      required final int expiresIn,
      required final int expiresAt,
      required final bool isExpired,
      required final String network,
      required final int cltvExpDelta,
      final String? bip21,
      required final String preimageHash}) = _$DecodedInvoiceImpl;
  const _DecodedInvoice._() : super._();

  @override
  int get msats;
  @override
  int get expiry;
  @override
  int get expiresIn;
  @override
  int get expiresAt;
  @override
  bool get isExpired;
  @override
  String get network;
  @override
  int get cltvExpDelta;
  @override
  String? get bip21;
  @override
  String get preimageHash;
  @override
  @JsonKey(ignore: true)
  _$$DecodedInvoiceImplCopyWith<_$DecodedInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KeyPair {
  String get secretKey => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String secretKey, String publicKey) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String secretKey, String publicKey)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretKey, String publicKey)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_KeyPair value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_KeyPair value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_KeyPair value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyPairCopyWith<KeyPair> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyPairCopyWith<$Res> {
  factory $KeyPairCopyWith(KeyPair value, $Res Function(KeyPair) then) =
      _$KeyPairCopyWithImpl<$Res, KeyPair>;
  @useResult
  $Res call({String secretKey, String publicKey});
}

/// @nodoc
class _$KeyPairCopyWithImpl<$Res, $Val extends KeyPair>
    implements $KeyPairCopyWith<$Res> {
  _$KeyPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = null,
    Object? publicKey = null,
  }) {
    return _then(_value.copyWith(
      secretKey: null == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeyPairImplCopyWith<$Res> implements $KeyPairCopyWith<$Res> {
  factory _$$KeyPairImplCopyWith(
          _$KeyPairImpl value, $Res Function(_$KeyPairImpl) then) =
      __$$KeyPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String secretKey, String publicKey});
}

/// @nodoc
class __$$KeyPairImplCopyWithImpl<$Res>
    extends _$KeyPairCopyWithImpl<$Res, _$KeyPairImpl>
    implements _$$KeyPairImplCopyWith<$Res> {
  __$$KeyPairImplCopyWithImpl(
      _$KeyPairImpl _value, $Res Function(_$KeyPairImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = null,
    Object? publicKey = null,
  }) {
    return _then(_$KeyPairImpl(
      secretKey: null == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$KeyPairImpl extends _KeyPair {
  const _$KeyPairImpl({required this.secretKey, required this.publicKey})
      : super._();

  @override
  final String secretKey;
  @override
  final String publicKey;

  @override
  String toString() {
    return 'KeyPair.raw(secretKey: $secretKey, publicKey: $publicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyPairImpl &&
            (identical(other.secretKey, secretKey) ||
                other.secretKey == secretKey) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secretKey, publicKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyPairImplCopyWith<_$KeyPairImpl> get copyWith =>
      __$$KeyPairImplCopyWithImpl<_$KeyPairImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String secretKey, String publicKey) raw,
  }) {
    return raw(secretKey, publicKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String secretKey, String publicKey)? raw,
  }) {
    return raw?.call(secretKey, publicKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretKey, String publicKey)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(secretKey, publicKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_KeyPair value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_KeyPair value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_KeyPair value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }
}

abstract class _KeyPair extends KeyPair {
  const factory _KeyPair(
      {required final String secretKey,
      required final String publicKey}) = _$KeyPairImpl;
  const _KeyPair._() : super._();

  @override
  String get secretKey;
  @override
  String get publicKey;
  @override
  @JsonKey(ignore: true)
  _$$KeyPairImplCopyWith<_$KeyPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LBtcSwapScriptStr {
  SwapType get swapType => throw _privateConstructorUsedError;
  String? get fundingAddrs => throw _privateConstructorUsedError;
  String get hashlock => throw _privateConstructorUsedError;
  String get receiverPubkey => throw _privateConstructorUsedError;
  int get locktime => throw _privateConstructorUsedError;
  String get senderPubkey => throw _privateConstructorUsedError;
  String get blindingKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey,
            String blindingKey)
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey,
            String blindingKey)?
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey,
            String blindingKey)?
        raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LBtcSwapScriptStr value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LBtcSwapScriptStr value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LBtcSwapScriptStr value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LBtcSwapScriptStrCopyWith<LBtcSwapScriptStr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LBtcSwapScriptStrCopyWith<$Res> {
  factory $LBtcSwapScriptStrCopyWith(
          LBtcSwapScriptStr value, $Res Function(LBtcSwapScriptStr) then) =
      _$LBtcSwapScriptStrCopyWithImpl<$Res, LBtcSwapScriptStr>;
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey,
      String blindingKey});
}

/// @nodoc
class _$LBtcSwapScriptStrCopyWithImpl<$Res, $Val extends LBtcSwapScriptStr>
    implements $LBtcSwapScriptStrCopyWith<$Res> {
  _$LBtcSwapScriptStrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
    Object? blindingKey = null,
  }) {
    return _then(_value.copyWith(
      swapType: null == swapType
          ? _value.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _value.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _value.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _value.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _value.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _value.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _value.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LBtcSwapScriptStrImplCopyWith<$Res>
    implements $LBtcSwapScriptStrCopyWith<$Res> {
  factory _$$LBtcSwapScriptStrImplCopyWith(_$LBtcSwapScriptStrImpl value,
          $Res Function(_$LBtcSwapScriptStrImpl) then) =
      __$$LBtcSwapScriptStrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey,
      String blindingKey});
}

/// @nodoc
class __$$LBtcSwapScriptStrImplCopyWithImpl<$Res>
    extends _$LBtcSwapScriptStrCopyWithImpl<$Res, _$LBtcSwapScriptStrImpl>
    implements _$$LBtcSwapScriptStrImplCopyWith<$Res> {
  __$$LBtcSwapScriptStrImplCopyWithImpl(_$LBtcSwapScriptStrImpl _value,
      $Res Function(_$LBtcSwapScriptStrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
    Object? blindingKey = null,
  }) {
    return _then(_$LBtcSwapScriptStrImpl(
      swapType: null == swapType
          ? _value.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _value.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _value.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _value.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _value.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _value.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _value.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LBtcSwapScriptStrImpl extends _LBtcSwapScriptStr {
  const _$LBtcSwapScriptStrImpl(
      {required this.swapType,
      this.fundingAddrs,
      required this.hashlock,
      required this.receiverPubkey,
      required this.locktime,
      required this.senderPubkey,
      required this.blindingKey})
      : super._();

  @override
  final SwapType swapType;
  @override
  final String? fundingAddrs;
  @override
  final String hashlock;
  @override
  final String receiverPubkey;
  @override
  final int locktime;
  @override
  final String senderPubkey;
  @override
  final String blindingKey;

  @override
  String toString() {
    return 'LBtcSwapScriptStr.raw(swapType: $swapType, fundingAddrs: $fundingAddrs, hashlock: $hashlock, receiverPubkey: $receiverPubkey, locktime: $locktime, senderPubkey: $senderPubkey, blindingKey: $blindingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LBtcSwapScriptStrImpl &&
            (identical(other.swapType, swapType) ||
                other.swapType == swapType) &&
            (identical(other.fundingAddrs, fundingAddrs) ||
                other.fundingAddrs == fundingAddrs) &&
            (identical(other.hashlock, hashlock) ||
                other.hashlock == hashlock) &&
            (identical(other.receiverPubkey, receiverPubkey) ||
                other.receiverPubkey == receiverPubkey) &&
            (identical(other.locktime, locktime) ||
                other.locktime == locktime) &&
            (identical(other.senderPubkey, senderPubkey) ||
                other.senderPubkey == senderPubkey) &&
            (identical(other.blindingKey, blindingKey) ||
                other.blindingKey == blindingKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swapType, fundingAddrs, hashlock,
      receiverPubkey, locktime, senderPubkey, blindingKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LBtcSwapScriptStrImplCopyWith<_$LBtcSwapScriptStrImpl> get copyWith =>
      __$$LBtcSwapScriptStrImplCopyWithImpl<_$LBtcSwapScriptStrImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey,
            String blindingKey)
        raw,
  }) {
    return raw(swapType, fundingAddrs, hashlock, receiverPubkey, locktime,
        senderPubkey, blindingKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey,
            String blindingKey)?
        raw,
  }) {
    return raw?.call(swapType, fundingAddrs, hashlock, receiverPubkey, locktime,
        senderPubkey, blindingKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SwapType swapType,
            String? fundingAddrs,
            String hashlock,
            String receiverPubkey,
            int locktime,
            String senderPubkey,
            String blindingKey)?
        raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(swapType, fundingAddrs, hashlock, receiverPubkey, locktime,
          senderPubkey, blindingKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LBtcSwapScriptStr value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LBtcSwapScriptStr value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LBtcSwapScriptStr value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }
}

abstract class _LBtcSwapScriptStr extends LBtcSwapScriptStr {
  const factory _LBtcSwapScriptStr(
      {required final SwapType swapType,
      final String? fundingAddrs,
      required final String hashlock,
      required final String receiverPubkey,
      required final int locktime,
      required final String senderPubkey,
      required final String blindingKey}) = _$LBtcSwapScriptStrImpl;
  const _LBtcSwapScriptStr._() : super._();

  @override
  SwapType get swapType;
  @override
  String? get fundingAddrs;
  @override
  String get hashlock;
  @override
  String get receiverPubkey;
  @override
  int get locktime;
  @override
  String get senderPubkey;
  @override
  String get blindingKey;
  @override
  @JsonKey(ignore: true)
  _$$LBtcSwapScriptStrImplCopyWith<_$LBtcSwapScriptStrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Limits {
  int get minimal => throw _privateConstructorUsedError;
  int get maximal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LimitsCopyWith<Limits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LimitsCopyWith<$Res> {
  factory $LimitsCopyWith(Limits value, $Res Function(Limits) then) =
      _$LimitsCopyWithImpl<$Res, Limits>;
  @useResult
  $Res call({int minimal, int maximal});
}

/// @nodoc
class _$LimitsCopyWithImpl<$Res, $Val extends Limits>
    implements $LimitsCopyWith<$Res> {
  _$LimitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minimal = null,
    Object? maximal = null,
  }) {
    return _then(_value.copyWith(
      minimal: null == minimal
          ? _value.minimal
          : minimal // ignore: cast_nullable_to_non_nullable
              as int,
      maximal: null == maximal
          ? _value.maximal
          : maximal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LimitsImplCopyWith<$Res> implements $LimitsCopyWith<$Res> {
  factory _$$LimitsImplCopyWith(
          _$LimitsImpl value, $Res Function(_$LimitsImpl) then) =
      __$$LimitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minimal, int maximal});
}

/// @nodoc
class __$$LimitsImplCopyWithImpl<$Res>
    extends _$LimitsCopyWithImpl<$Res, _$LimitsImpl>
    implements _$$LimitsImplCopyWith<$Res> {
  __$$LimitsImplCopyWithImpl(
      _$LimitsImpl _value, $Res Function(_$LimitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minimal = null,
    Object? maximal = null,
  }) {
    return _then(_$LimitsImpl(
      minimal: null == minimal
          ? _value.minimal
          : minimal // ignore: cast_nullable_to_non_nullable
              as int,
      maximal: null == maximal
          ? _value.maximal
          : maximal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LimitsImpl implements _Limits {
  const _$LimitsImpl({required this.minimal, required this.maximal});

  @override
  final int minimal;
  @override
  final int maximal;

  @override
  String toString() {
    return 'Limits(minimal: $minimal, maximal: $maximal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LimitsImpl &&
            (identical(other.minimal, minimal) || other.minimal == minimal) &&
            (identical(other.maximal, maximal) || other.maximal == maximal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minimal, maximal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LimitsImplCopyWith<_$LimitsImpl> get copyWith =>
      __$$LimitsImplCopyWithImpl<_$LimitsImpl>(this, _$identity);
}

abstract class _Limits implements Limits {
  const factory _Limits(
      {required final int minimal, required final int maximal}) = _$LimitsImpl;

  @override
  int get minimal;
  @override
  int get maximal;
  @override
  @JsonKey(ignore: true)
  _$$LimitsImplCopyWith<_$LimitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PreImage {
  String get value => throw _privateConstructorUsedError;
  String get sha256 => throw _privateConstructorUsedError;
  String get hash160 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value, String sha256, String hash160) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value, String sha256, String hash160)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value, String sha256, String hash160)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreImage value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PreImage value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreImage value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreImageCopyWith<PreImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreImageCopyWith<$Res> {
  factory $PreImageCopyWith(PreImage value, $Res Function(PreImage) then) =
      _$PreImageCopyWithImpl<$Res, PreImage>;
  @useResult
  $Res call({String value, String sha256, String hash160});
}

/// @nodoc
class _$PreImageCopyWithImpl<$Res, $Val extends PreImage>
    implements $PreImageCopyWith<$Res> {
  _$PreImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? sha256 = null,
    Object? hash160 = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: null == sha256
          ? _value.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String,
      hash160: null == hash160
          ? _value.hash160
          : hash160 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreImageImplCopyWith<$Res>
    implements $PreImageCopyWith<$Res> {
  factory _$$PreImageImplCopyWith(
          _$PreImageImpl value, $Res Function(_$PreImageImpl) then) =
      __$$PreImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String sha256, String hash160});
}

/// @nodoc
class __$$PreImageImplCopyWithImpl<$Res>
    extends _$PreImageCopyWithImpl<$Res, _$PreImageImpl>
    implements _$$PreImageImplCopyWith<$Res> {
  __$$PreImageImplCopyWithImpl(
      _$PreImageImpl _value, $Res Function(_$PreImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? sha256 = null,
    Object? hash160 = null,
  }) {
    return _then(_$PreImageImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: null == sha256
          ? _value.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String,
      hash160: null == hash160
          ? _value.hash160
          : hash160 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PreImageImpl extends _PreImage {
  const _$PreImageImpl(
      {required this.value, required this.sha256, required this.hash160})
      : super._();

  @override
  final String value;
  @override
  final String sha256;
  @override
  final String hash160;

  @override
  String toString() {
    return 'PreImage.raw(value: $value, sha256: $sha256, hash160: $hash160)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreImageImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.sha256, sha256) || other.sha256 == sha256) &&
            (identical(other.hash160, hash160) || other.hash160 == hash160));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, sha256, hash160);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreImageImplCopyWith<_$PreImageImpl> get copyWith =>
      __$$PreImageImplCopyWithImpl<_$PreImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value, String sha256, String hash160) raw,
  }) {
    return raw(value, sha256, hash160);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value, String sha256, String hash160)? raw,
  }) {
    return raw?.call(value, sha256, hash160);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value, String sha256, String hash160)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(value, sha256, hash160);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PreImage value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PreImage value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PreImage value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }
}

abstract class _PreImage extends PreImage {
  const factory _PreImage(
      {required final String value,
      required final String sha256,
      required final String hash160}) = _$PreImageImpl;
  const _PreImage._() : super._();

  @override
  String get value;
  @override
  String get sha256;
  @override
  String get hash160;
  @override
  @JsonKey(ignore: true)
  _$$PreImageImplCopyWith<_$PreImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

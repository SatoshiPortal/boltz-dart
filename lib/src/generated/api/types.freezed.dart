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

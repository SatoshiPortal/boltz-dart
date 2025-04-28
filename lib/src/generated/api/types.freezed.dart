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
mixin _$BtcSwapScriptStr {
  SwapType get swapType;
  String? get fundingAddrs;
  String get hashlock;
  String get receiverPubkey;
  int get locktime;
  String get senderPubkey;
  Side? get side;

  /// Create a copy of BtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<BtcSwapScriptStr> get copyWith =>
      _$BtcSwapScriptStrCopyWithImpl<BtcSwapScriptStr>(
          this as BtcSwapScriptStr, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BtcSwapScriptStr &&
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
            (identical(other.side, side) || other.side == side));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swapType, fundingAddrs, hashlock,
      receiverPubkey, locktime, senderPubkey, side);

  @override
  String toString() {
    return 'BtcSwapScriptStr(swapType: $swapType, fundingAddrs: $fundingAddrs, hashlock: $hashlock, receiverPubkey: $receiverPubkey, locktime: $locktime, senderPubkey: $senderPubkey, side: $side)';
  }
}

/// @nodoc
abstract mixin class $BtcSwapScriptStrCopyWith<$Res> {
  factory $BtcSwapScriptStrCopyWith(
          BtcSwapScriptStr value, $Res Function(BtcSwapScriptStr) _then) =
      _$BtcSwapScriptStrCopyWithImpl;
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey,
      Side? side});
}

/// @nodoc
class _$BtcSwapScriptStrCopyWithImpl<$Res>
    implements $BtcSwapScriptStrCopyWith<$Res> {
  _$BtcSwapScriptStrCopyWithImpl(this._self, this._then);

  final BtcSwapScriptStr _self;
  final $Res Function(BtcSwapScriptStr) _then;

  /// Create a copy of BtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
    Object? side = freezed,
  }) {
    return _then(_self.copyWith(
      swapType: null == swapType
          ? _self.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _self.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _self.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _self.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _self.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _self.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      side: freezed == side
          ? _self.side
          : side // ignore: cast_nullable_to_non_nullable
              as Side?,
    ));
  }
}

/// @nodoc

class _BtcSwapScriptStr extends BtcSwapScriptStr {
  const _BtcSwapScriptStr(
      {required this.swapType,
      this.fundingAddrs,
      required this.hashlock,
      required this.receiverPubkey,
      required this.locktime,
      required this.senderPubkey,
      this.side})
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
  final Side? side;

  /// Create a copy of BtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BtcSwapScriptStrCopyWith<_BtcSwapScriptStr> get copyWith =>
      __$BtcSwapScriptStrCopyWithImpl<_BtcSwapScriptStr>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BtcSwapScriptStr &&
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
            (identical(other.side, side) || other.side == side));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swapType, fundingAddrs, hashlock,
      receiverPubkey, locktime, senderPubkey, side);

  @override
  String toString() {
    return 'BtcSwapScriptStr(swapType: $swapType, fundingAddrs: $fundingAddrs, hashlock: $hashlock, receiverPubkey: $receiverPubkey, locktime: $locktime, senderPubkey: $senderPubkey, side: $side)';
  }
}

/// @nodoc
abstract mixin class _$BtcSwapScriptStrCopyWith<$Res>
    implements $BtcSwapScriptStrCopyWith<$Res> {
  factory _$BtcSwapScriptStrCopyWith(
          _BtcSwapScriptStr value, $Res Function(_BtcSwapScriptStr) _then) =
      __$BtcSwapScriptStrCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey,
      Side? side});
}

/// @nodoc
class __$BtcSwapScriptStrCopyWithImpl<$Res>
    implements _$BtcSwapScriptStrCopyWith<$Res> {
  __$BtcSwapScriptStrCopyWithImpl(this._self, this._then);

  final _BtcSwapScriptStr _self;
  final $Res Function(_BtcSwapScriptStr) _then;

  /// Create a copy of BtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
    Object? side = freezed,
  }) {
    return _then(_BtcSwapScriptStr(
      swapType: null == swapType
          ? _self.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _self.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _self.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _self.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _self.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _self.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      side: freezed == side
          ? _self.side
          : side // ignore: cast_nullable_to_non_nullable
              as Side?,
    ));
  }
}

/// @nodoc
mixin _$DecodedInvoice {
  BigInt get msats;
  BigInt get expiry;
  BigInt get expiresIn;
  BigInt get expiresAt;
  bool get isExpired;
  String get network;
  BigInt get cltvExpDelta;
  String? get bip21;
  String get preimageHash;
  String get description;

  /// Create a copy of DecodedInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DecodedInvoiceCopyWith<DecodedInvoice> get copyWith =>
      _$DecodedInvoiceCopyWithImpl<DecodedInvoice>(
          this as DecodedInvoice, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodedInvoice &&
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
                other.preimageHash == preimageHash) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      msats,
      expiry,
      expiresIn,
      expiresAt,
      isExpired,
      network,
      cltvExpDelta,
      bip21,
      preimageHash,
      description);

  @override
  String toString() {
    return 'DecodedInvoice(msats: $msats, expiry: $expiry, expiresIn: $expiresIn, expiresAt: $expiresAt, isExpired: $isExpired, network: $network, cltvExpDelta: $cltvExpDelta, bip21: $bip21, preimageHash: $preimageHash, description: $description)';
  }
}

/// @nodoc
abstract mixin class $DecodedInvoiceCopyWith<$Res> {
  factory $DecodedInvoiceCopyWith(
          DecodedInvoice value, $Res Function(DecodedInvoice) _then) =
      _$DecodedInvoiceCopyWithImpl;
  @useResult
  $Res call(
      {BigInt msats,
      BigInt expiry,
      BigInt expiresIn,
      BigInt expiresAt,
      bool isExpired,
      String network,
      BigInt cltvExpDelta,
      String? bip21,
      String preimageHash,
      String description});
}

/// @nodoc
class _$DecodedInvoiceCopyWithImpl<$Res>
    implements $DecodedInvoiceCopyWith<$Res> {
  _$DecodedInvoiceCopyWithImpl(this._self, this._then);

  final DecodedInvoice _self;
  final $Res Function(DecodedInvoice) _then;

  /// Create a copy of DecodedInvoice
  /// with the given fields replaced by the non-null parameter values.
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
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      msats: null == msats
          ? _self.msats
          : msats // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiry: null == expiry
          ? _self.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as BigInt,
      isExpired: null == isExpired
          ? _self.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      network: null == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      cltvExpDelta: null == cltvExpDelta
          ? _self.cltvExpDelta
          : cltvExpDelta // ignore: cast_nullable_to_non_nullable
              as BigInt,
      bip21: freezed == bip21
          ? _self.bip21
          : bip21 // ignore: cast_nullable_to_non_nullable
              as String?,
      preimageHash: null == preimageHash
          ? _self.preimageHash
          : preimageHash // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DecodedInvoice extends DecodedInvoice {
  const _DecodedInvoice(
      {required this.msats,
      required this.expiry,
      required this.expiresIn,
      required this.expiresAt,
      required this.isExpired,
      required this.network,
      required this.cltvExpDelta,
      this.bip21,
      required this.preimageHash,
      required this.description})
      : super._();

  @override
  final BigInt msats;
  @override
  final BigInt expiry;
  @override
  final BigInt expiresIn;
  @override
  final BigInt expiresAt;
  @override
  final bool isExpired;
  @override
  final String network;
  @override
  final BigInt cltvExpDelta;
  @override
  final String? bip21;
  @override
  final String preimageHash;
  @override
  final String description;

  /// Create a copy of DecodedInvoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DecodedInvoiceCopyWith<_DecodedInvoice> get copyWith =>
      __$DecodedInvoiceCopyWithImpl<_DecodedInvoice>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DecodedInvoice &&
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
                other.preimageHash == preimageHash) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      msats,
      expiry,
      expiresIn,
      expiresAt,
      isExpired,
      network,
      cltvExpDelta,
      bip21,
      preimageHash,
      description);

  @override
  String toString() {
    return 'DecodedInvoice(msats: $msats, expiry: $expiry, expiresIn: $expiresIn, expiresAt: $expiresAt, isExpired: $isExpired, network: $network, cltvExpDelta: $cltvExpDelta, bip21: $bip21, preimageHash: $preimageHash, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$DecodedInvoiceCopyWith<$Res>
    implements $DecodedInvoiceCopyWith<$Res> {
  factory _$DecodedInvoiceCopyWith(
          _DecodedInvoice value, $Res Function(_DecodedInvoice) _then) =
      __$DecodedInvoiceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BigInt msats,
      BigInt expiry,
      BigInt expiresIn,
      BigInt expiresAt,
      bool isExpired,
      String network,
      BigInt cltvExpDelta,
      String? bip21,
      String preimageHash,
      String description});
}

/// @nodoc
class __$DecodedInvoiceCopyWithImpl<$Res>
    implements _$DecodedInvoiceCopyWith<$Res> {
  __$DecodedInvoiceCopyWithImpl(this._self, this._then);

  final _DecodedInvoice _self;
  final $Res Function(_DecodedInvoice) _then;

  /// Create a copy of DecodedInvoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? description = null,
  }) {
    return _then(_DecodedInvoice(
      msats: null == msats
          ? _self.msats
          : msats // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiry: null == expiry
          ? _self.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiresIn: null == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as BigInt,
      isExpired: null == isExpired
          ? _self.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      network: null == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      cltvExpDelta: null == cltvExpDelta
          ? _self.cltvExpDelta
          : cltvExpDelta // ignore: cast_nullable_to_non_nullable
              as BigInt,
      bip21: freezed == bip21
          ? _self.bip21
          : bip21 // ignore: cast_nullable_to_non_nullable
              as String?,
      preimageHash: null == preimageHash
          ? _self.preimageHash
          : preimageHash // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$KeyPair {
  String get secretKey;
  String get publicKey;

  /// Create a copy of KeyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<KeyPair> get copyWith =>
      _$KeyPairCopyWithImpl<KeyPair>(this as KeyPair, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KeyPair &&
            (identical(other.secretKey, secretKey) ||
                other.secretKey == secretKey) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secretKey, publicKey);

  @override
  String toString() {
    return 'KeyPair(secretKey: $secretKey, publicKey: $publicKey)';
  }
}

/// @nodoc
abstract mixin class $KeyPairCopyWith<$Res> {
  factory $KeyPairCopyWith(KeyPair value, $Res Function(KeyPair) _then) =
      _$KeyPairCopyWithImpl;
  @useResult
  $Res call({String secretKey, String publicKey});
}

/// @nodoc
class _$KeyPairCopyWithImpl<$Res> implements $KeyPairCopyWith<$Res> {
  _$KeyPairCopyWithImpl(this._self, this._then);

  final KeyPair _self;
  final $Res Function(KeyPair) _then;

  /// Create a copy of KeyPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secretKey = null,
    Object? publicKey = null,
  }) {
    return _then(_self.copyWith(
      secretKey: null == secretKey
          ? _self.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _self.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _KeyPair extends KeyPair {
  const _KeyPair({required this.secretKey, required this.publicKey})
      : super._();

  @override
  final String secretKey;
  @override
  final String publicKey;

  /// Create a copy of KeyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KeyPairCopyWith<_KeyPair> get copyWith =>
      __$KeyPairCopyWithImpl<_KeyPair>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeyPair &&
            (identical(other.secretKey, secretKey) ||
                other.secretKey == secretKey) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secretKey, publicKey);

  @override
  String toString() {
    return 'KeyPair(secretKey: $secretKey, publicKey: $publicKey)';
  }
}

/// @nodoc
abstract mixin class _$KeyPairCopyWith<$Res> implements $KeyPairCopyWith<$Res> {
  factory _$KeyPairCopyWith(_KeyPair value, $Res Function(_KeyPair) _then) =
      __$KeyPairCopyWithImpl;
  @override
  @useResult
  $Res call({String secretKey, String publicKey});
}

/// @nodoc
class __$KeyPairCopyWithImpl<$Res> implements _$KeyPairCopyWith<$Res> {
  __$KeyPairCopyWithImpl(this._self, this._then);

  final _KeyPair _self;
  final $Res Function(_KeyPair) _then;

  /// Create a copy of KeyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? secretKey = null,
    Object? publicKey = null,
  }) {
    return _then(_KeyPair(
      secretKey: null == secretKey
          ? _self.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _self.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LBtcSwapScriptStr {
  SwapType get swapType;
  String? get fundingAddrs;
  String get hashlock;
  String get receiverPubkey;
  int get locktime;
  String get senderPubkey;
  String get blindingKey;
  Side? get side;

  /// Create a copy of LBtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<LBtcSwapScriptStr> get copyWith =>
      _$LBtcSwapScriptStrCopyWithImpl<LBtcSwapScriptStr>(
          this as LBtcSwapScriptStr, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LBtcSwapScriptStr &&
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
                other.blindingKey == blindingKey) &&
            (identical(other.side, side) || other.side == side));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swapType, fundingAddrs, hashlock,
      receiverPubkey, locktime, senderPubkey, blindingKey, side);

  @override
  String toString() {
    return 'LBtcSwapScriptStr(swapType: $swapType, fundingAddrs: $fundingAddrs, hashlock: $hashlock, receiverPubkey: $receiverPubkey, locktime: $locktime, senderPubkey: $senderPubkey, blindingKey: $blindingKey, side: $side)';
  }
}

/// @nodoc
abstract mixin class $LBtcSwapScriptStrCopyWith<$Res> {
  factory $LBtcSwapScriptStrCopyWith(
          LBtcSwapScriptStr value, $Res Function(LBtcSwapScriptStr) _then) =
      _$LBtcSwapScriptStrCopyWithImpl;
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey,
      String blindingKey,
      Side? side});
}

/// @nodoc
class _$LBtcSwapScriptStrCopyWithImpl<$Res>
    implements $LBtcSwapScriptStrCopyWith<$Res> {
  _$LBtcSwapScriptStrCopyWithImpl(this._self, this._then);

  final LBtcSwapScriptStr _self;
  final $Res Function(LBtcSwapScriptStr) _then;

  /// Create a copy of LBtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
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
    Object? side = freezed,
  }) {
    return _then(_self.copyWith(
      swapType: null == swapType
          ? _self.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _self.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _self.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _self.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _self.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _self.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _self.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
      side: freezed == side
          ? _self.side
          : side // ignore: cast_nullable_to_non_nullable
              as Side?,
    ));
  }
}

/// @nodoc

class _LBtcSwapScriptStr extends LBtcSwapScriptStr {
  const _LBtcSwapScriptStr(
      {required this.swapType,
      this.fundingAddrs,
      required this.hashlock,
      required this.receiverPubkey,
      required this.locktime,
      required this.senderPubkey,
      required this.blindingKey,
      this.side})
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
  final Side? side;

  /// Create a copy of LBtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LBtcSwapScriptStrCopyWith<_LBtcSwapScriptStr> get copyWith =>
      __$LBtcSwapScriptStrCopyWithImpl<_LBtcSwapScriptStr>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LBtcSwapScriptStr &&
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
                other.blindingKey == blindingKey) &&
            (identical(other.side, side) || other.side == side));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swapType, fundingAddrs, hashlock,
      receiverPubkey, locktime, senderPubkey, blindingKey, side);

  @override
  String toString() {
    return 'LBtcSwapScriptStr(swapType: $swapType, fundingAddrs: $fundingAddrs, hashlock: $hashlock, receiverPubkey: $receiverPubkey, locktime: $locktime, senderPubkey: $senderPubkey, blindingKey: $blindingKey, side: $side)';
  }
}

/// @nodoc
abstract mixin class _$LBtcSwapScriptStrCopyWith<$Res>
    implements $LBtcSwapScriptStrCopyWith<$Res> {
  factory _$LBtcSwapScriptStrCopyWith(
          _LBtcSwapScriptStr value, $Res Function(_LBtcSwapScriptStr) _then) =
      __$LBtcSwapScriptStrCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SwapType swapType,
      String? fundingAddrs,
      String hashlock,
      String receiverPubkey,
      int locktime,
      String senderPubkey,
      String blindingKey,
      Side? side});
}

/// @nodoc
class __$LBtcSwapScriptStrCopyWithImpl<$Res>
    implements _$LBtcSwapScriptStrCopyWith<$Res> {
  __$LBtcSwapScriptStrCopyWithImpl(this._self, this._then);

  final _LBtcSwapScriptStr _self;
  final $Res Function(_LBtcSwapScriptStr) _then;

  /// Create a copy of LBtcSwapScriptStr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? swapType = null,
    Object? fundingAddrs = freezed,
    Object? hashlock = null,
    Object? receiverPubkey = null,
    Object? locktime = null,
    Object? senderPubkey = null,
    Object? blindingKey = null,
    Object? side = freezed,
  }) {
    return _then(_LBtcSwapScriptStr(
      swapType: null == swapType
          ? _self.swapType
          : swapType // ignore: cast_nullable_to_non_nullable
              as SwapType,
      fundingAddrs: freezed == fundingAddrs
          ? _self.fundingAddrs
          : fundingAddrs // ignore: cast_nullable_to_non_nullable
              as String?,
      hashlock: null == hashlock
          ? _self.hashlock
          : hashlock // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPubkey: null == receiverPubkey
          ? _self.receiverPubkey
          : receiverPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      locktime: null == locktime
          ? _self.locktime
          : locktime // ignore: cast_nullable_to_non_nullable
              as int,
      senderPubkey: null == senderPubkey
          ? _self.senderPubkey
          : senderPubkey // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _self.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
      side: freezed == side
          ? _self.side
          : side // ignore: cast_nullable_to_non_nullable
              as Side?,
    ));
  }
}

/// @nodoc
mixin _$PreImage {
  String get value;
  String get sha256;
  String get hash160;

  /// Create a copy of PreImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<PreImage> get copyWith =>
      _$PreImageCopyWithImpl<PreImage>(this as PreImage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreImage &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.sha256, sha256) || other.sha256 == sha256) &&
            (identical(other.hash160, hash160) || other.hash160 == hash160));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, sha256, hash160);

  @override
  String toString() {
    return 'PreImage(value: $value, sha256: $sha256, hash160: $hash160)';
  }
}

/// @nodoc
abstract mixin class $PreImageCopyWith<$Res> {
  factory $PreImageCopyWith(PreImage value, $Res Function(PreImage) _then) =
      _$PreImageCopyWithImpl;
  @useResult
  $Res call({String value, String sha256, String hash160});
}

/// @nodoc
class _$PreImageCopyWithImpl<$Res> implements $PreImageCopyWith<$Res> {
  _$PreImageCopyWithImpl(this._self, this._then);

  final PreImage _self;
  final $Res Function(PreImage) _then;

  /// Create a copy of PreImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? sha256 = null,
    Object? hash160 = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: null == sha256
          ? _self.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String,
      hash160: null == hash160
          ? _self.hash160
          : hash160 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PreImage extends PreImage {
  const _PreImage(
      {required this.value, required this.sha256, required this.hash160})
      : super._();

  @override
  final String value;
  @override
  final String sha256;
  @override
  final String hash160;

  /// Create a copy of PreImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreImageCopyWith<_PreImage> get copyWith =>
      __$PreImageCopyWithImpl<_PreImage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreImage &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.sha256, sha256) || other.sha256 == sha256) &&
            (identical(other.hash160, hash160) || other.hash160 == hash160));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, sha256, hash160);

  @override
  String toString() {
    return 'PreImage(value: $value, sha256: $sha256, hash160: $hash160)';
  }
}

/// @nodoc
abstract mixin class _$PreImageCopyWith<$Res>
    implements $PreImageCopyWith<$Res> {
  factory _$PreImageCopyWith(_PreImage value, $Res Function(_PreImage) _then) =
      __$PreImageCopyWithImpl;
  @override
  @useResult
  $Res call({String value, String sha256, String hash160});
}

/// @nodoc
class __$PreImageCopyWithImpl<$Res> implements _$PreImageCopyWith<$Res> {
  __$PreImageCopyWithImpl(this._self, this._then);

  final _PreImage _self;
  final $Res Function(_PreImage) _then;

  /// Create a copy of PreImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? sha256 = null,
    Object? hash160 = null,
  }) {
    return _then(_PreImage(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: null == sha256
          ? _self.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String,
      hash160: null == hash160
          ? _self.hash160
          : hash160 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

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

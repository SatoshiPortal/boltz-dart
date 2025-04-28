// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_ln.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BtcLnSwap {
  String get id;
  SwapType get kind;
  Chain get network;
  KeyPair get keys;
  BigInt get keyIndex;
  PreImage get preimage;
  BtcSwapScriptStr get swapScript;
  String get invoice;
  String get scriptAddress;
  BigInt get outAmount;
  String get electrumUrl;
  String get boltzUrl;
  String? get referralId;

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BtcLnSwapCopyWith<BtcLnSwap> get copyWith =>
      _$BtcLnSwapCopyWithImpl<BtcLnSwap>(this as BtcLnSwap, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BtcLnSwap &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.keys, keys) || other.keys == keys) &&
            (identical(other.keyIndex, keyIndex) ||
                other.keyIndex == keyIndex) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.swapScript, swapScript) ||
                other.swapScript == swapScript) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.electrumUrl, electrumUrl) ||
                other.electrumUrl == electrumUrl) &&
            (identical(other.boltzUrl, boltzUrl) ||
                other.boltzUrl == boltzUrl) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      kind,
      network,
      keys,
      keyIndex,
      preimage,
      swapScript,
      invoice,
      scriptAddress,
      outAmount,
      electrumUrl,
      boltzUrl,
      referralId);

  @override
  String toString() {
    return 'BtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, keyIndex: $keyIndex, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, scriptAddress: $scriptAddress, outAmount: $outAmount, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }
}

/// @nodoc
abstract mixin class $BtcLnSwapCopyWith<$Res> {
  factory $BtcLnSwapCopyWith(BtcLnSwap value, $Res Function(BtcLnSwap) _then) =
      _$BtcLnSwapCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      BigInt keyIndex,
      PreImage preimage,
      BtcSwapScriptStr swapScript,
      String invoice,
      String scriptAddress,
      BigInt outAmount,
      String electrumUrl,
      String boltzUrl,
      String? referralId});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
  $BtcSwapScriptStrCopyWith<$Res> get swapScript;
}

/// @nodoc
class _$BtcLnSwapCopyWithImpl<$Res> implements $BtcLnSwapCopyWith<$Res> {
  _$BtcLnSwapCopyWithImpl(this._self, this._then);

  final BtcLnSwap _self;
  final $Res Function(BtcLnSwap) _then;

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? network = null,
    Object? keys = null,
    Object? keyIndex = null,
    Object? preimage = null,
    Object? swapScript = null,
    Object? invoice = null,
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
    Object? referralId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as SwapType,
      network: null == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as Chain,
      keys: null == keys
          ? _self.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      keyIndex: null == keyIndex
          ? _self.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as BigInt,
      preimage: null == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      swapScript: null == swapScript
          ? _self.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      invoice: null == invoice
          ? _self.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      scriptAddress: null == scriptAddress
          ? _self.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _self.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      electrumUrl: null == electrumUrl
          ? _self.electrumUrl
          : electrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _self.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _self.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get keys {
    return $KeyPairCopyWith<$Res>(_self.keys, (value) {
      return _then(_self.copyWith(keys: value));
    });
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_self.preimage, (value) {
      return _then(_self.copyWith(preimage: value));
    });
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<$Res> get swapScript {
    return $BtcSwapScriptStrCopyWith<$Res>(_self.swapScript, (value) {
      return _then(_self.copyWith(swapScript: value));
    });
  }
}

/// @nodoc

class _BtcLnSwap extends BtcLnSwap {
  const _BtcLnSwap(
      {required this.id,
      required this.kind,
      required this.network,
      required this.keys,
      required this.keyIndex,
      required this.preimage,
      required this.swapScript,
      required this.invoice,
      required this.scriptAddress,
      required this.outAmount,
      required this.electrumUrl,
      required this.boltzUrl,
      this.referralId})
      : super._();

  @override
  final String id;
  @override
  final SwapType kind;
  @override
  final Chain network;
  @override
  final KeyPair keys;
  @override
  final BigInt keyIndex;
  @override
  final PreImage preimage;
  @override
  final BtcSwapScriptStr swapScript;
  @override
  final String invoice;
  @override
  final String scriptAddress;
  @override
  final BigInt outAmount;
  @override
  final String electrumUrl;
  @override
  final String boltzUrl;
  @override
  final String? referralId;

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BtcLnSwapCopyWith<_BtcLnSwap> get copyWith =>
      __$BtcLnSwapCopyWithImpl<_BtcLnSwap>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BtcLnSwap &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.keys, keys) || other.keys == keys) &&
            (identical(other.keyIndex, keyIndex) ||
                other.keyIndex == keyIndex) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.swapScript, swapScript) ||
                other.swapScript == swapScript) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.electrumUrl, electrumUrl) ||
                other.electrumUrl == electrumUrl) &&
            (identical(other.boltzUrl, boltzUrl) ||
                other.boltzUrl == boltzUrl) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      kind,
      network,
      keys,
      keyIndex,
      preimage,
      swapScript,
      invoice,
      scriptAddress,
      outAmount,
      electrumUrl,
      boltzUrl,
      referralId);

  @override
  String toString() {
    return 'BtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, keyIndex: $keyIndex, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, scriptAddress: $scriptAddress, outAmount: $outAmount, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }
}

/// @nodoc
abstract mixin class _$BtcLnSwapCopyWith<$Res>
    implements $BtcLnSwapCopyWith<$Res> {
  factory _$BtcLnSwapCopyWith(
          _BtcLnSwap value, $Res Function(_BtcLnSwap) _then) =
      __$BtcLnSwapCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      BigInt keyIndex,
      PreImage preimage,
      BtcSwapScriptStr swapScript,
      String invoice,
      String scriptAddress,
      BigInt outAmount,
      String electrumUrl,
      String boltzUrl,
      String? referralId});

  @override
  $KeyPairCopyWith<$Res> get keys;
  @override
  $PreImageCopyWith<$Res> get preimage;
  @override
  $BtcSwapScriptStrCopyWith<$Res> get swapScript;
}

/// @nodoc
class __$BtcLnSwapCopyWithImpl<$Res> implements _$BtcLnSwapCopyWith<$Res> {
  __$BtcLnSwapCopyWithImpl(this._self, this._then);

  final _BtcLnSwap _self;
  final $Res Function(_BtcLnSwap) _then;

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? network = null,
    Object? keys = null,
    Object? keyIndex = null,
    Object? preimage = null,
    Object? swapScript = null,
    Object? invoice = null,
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
    Object? referralId = freezed,
  }) {
    return _then(_BtcLnSwap(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as SwapType,
      network: null == network
          ? _self.network
          : network // ignore: cast_nullable_to_non_nullable
              as Chain,
      keys: null == keys
          ? _self.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      keyIndex: null == keyIndex
          ? _self.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as BigInt,
      preimage: null == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      swapScript: null == swapScript
          ? _self.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      invoice: null == invoice
          ? _self.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      scriptAddress: null == scriptAddress
          ? _self.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _self.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      electrumUrl: null == electrumUrl
          ? _self.electrumUrl
          : electrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _self.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _self.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get keys {
    return $KeyPairCopyWith<$Res>(_self.keys, (value) {
      return _then(_self.copyWith(keys: value));
    });
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_self.preimage, (value) {
      return _then(_self.copyWith(preimage: value));
    });
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<$Res> get swapScript {
    return $BtcSwapScriptStrCopyWith<$Res>(_self.swapScript, (value) {
      return _then(_self.copyWith(swapScript: value));
    });
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lbtc_ln.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LbtcLnSwap {
  String get id;
  SwapType get kind;
  Chain get network;
  KeyPair get keys;
  BigInt get keyIndex;
  PreImage get preimage;
  LBtcSwapScriptStr get swapScript;
  String get invoice;
  BigInt get outAmount;
  String get scriptAddress;
  String get blindingKey;
  String get electrumUrl;
  String get boltzUrl;
  String? get referralId;

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LbtcLnSwapCopyWith<LbtcLnSwap> get copyWith =>
      _$LbtcLnSwapCopyWithImpl<LbtcLnSwap>(this as LbtcLnSwap, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LbtcLnSwap &&
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
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.blindingKey, blindingKey) ||
                other.blindingKey == blindingKey) &&
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
      outAmount,
      scriptAddress,
      blindingKey,
      electrumUrl,
      boltzUrl,
      referralId);

  @override
  String toString() {
    return 'LbtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, keyIndex: $keyIndex, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, outAmount: $outAmount, scriptAddress: $scriptAddress, blindingKey: $blindingKey, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }
}

/// @nodoc
abstract mixin class $LbtcLnSwapCopyWith<$Res> {
  factory $LbtcLnSwapCopyWith(
          LbtcLnSwap value, $Res Function(LbtcLnSwap) _then) =
      _$LbtcLnSwapCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      BigInt keyIndex,
      PreImage preimage,
      LBtcSwapScriptStr swapScript,
      String invoice,
      BigInt outAmount,
      String scriptAddress,
      String blindingKey,
      String electrumUrl,
      String boltzUrl,
      String? referralId});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
  $LBtcSwapScriptStrCopyWith<$Res> get swapScript;
}

/// @nodoc
class _$LbtcLnSwapCopyWithImpl<$Res> implements $LbtcLnSwapCopyWith<$Res> {
  _$LbtcLnSwapCopyWithImpl(this._self, this._then);

  final LbtcLnSwap _self;
  final $Res Function(LbtcLnSwap) _then;

  /// Create a copy of LbtcLnSwap
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
    Object? outAmount = null,
    Object? scriptAddress = null,
    Object? blindingKey = null,
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
              as LBtcSwapScriptStr,
      invoice: null == invoice
          ? _self.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _self.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      scriptAddress: null == scriptAddress
          ? _self.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _self.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get keys {
    return $KeyPairCopyWith<$Res>(_self.keys, (value) {
      return _then(_self.copyWith(keys: value));
    });
  }

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_self.preimage, (value) {
      return _then(_self.copyWith(preimage: value));
    });
  }

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<$Res> get swapScript {
    return $LBtcSwapScriptStrCopyWith<$Res>(_self.swapScript, (value) {
      return _then(_self.copyWith(swapScript: value));
    });
  }
}

/// @nodoc

class _LbtcLnSwap extends LbtcLnSwap {
  const _LbtcLnSwap(
      {required this.id,
      required this.kind,
      required this.network,
      required this.keys,
      required this.keyIndex,
      required this.preimage,
      required this.swapScript,
      required this.invoice,
      required this.outAmount,
      required this.scriptAddress,
      required this.blindingKey,
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
  final LBtcSwapScriptStr swapScript;
  @override
  final String invoice;
  @override
  final BigInt outAmount;
  @override
  final String scriptAddress;
  @override
  final String blindingKey;
  @override
  final String electrumUrl;
  @override
  final String boltzUrl;
  @override
  final String? referralId;

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LbtcLnSwapCopyWith<_LbtcLnSwap> get copyWith =>
      __$LbtcLnSwapCopyWithImpl<_LbtcLnSwap>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LbtcLnSwap &&
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
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.blindingKey, blindingKey) ||
                other.blindingKey == blindingKey) &&
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
      outAmount,
      scriptAddress,
      blindingKey,
      electrumUrl,
      boltzUrl,
      referralId);

  @override
  String toString() {
    return 'LbtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, keyIndex: $keyIndex, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, outAmount: $outAmount, scriptAddress: $scriptAddress, blindingKey: $blindingKey, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }
}

/// @nodoc
abstract mixin class _$LbtcLnSwapCopyWith<$Res>
    implements $LbtcLnSwapCopyWith<$Res> {
  factory _$LbtcLnSwapCopyWith(
          _LbtcLnSwap value, $Res Function(_LbtcLnSwap) _then) =
      __$LbtcLnSwapCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      BigInt keyIndex,
      PreImage preimage,
      LBtcSwapScriptStr swapScript,
      String invoice,
      BigInt outAmount,
      String scriptAddress,
      String blindingKey,
      String electrumUrl,
      String boltzUrl,
      String? referralId});

  @override
  $KeyPairCopyWith<$Res> get keys;
  @override
  $PreImageCopyWith<$Res> get preimage;
  @override
  $LBtcSwapScriptStrCopyWith<$Res> get swapScript;
}

/// @nodoc
class __$LbtcLnSwapCopyWithImpl<$Res> implements _$LbtcLnSwapCopyWith<$Res> {
  __$LbtcLnSwapCopyWithImpl(this._self, this._then);

  final _LbtcLnSwap _self;
  final $Res Function(_LbtcLnSwap) _then;

  /// Create a copy of LbtcLnSwap
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
    Object? outAmount = null,
    Object? scriptAddress = null,
    Object? blindingKey = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
    Object? referralId = freezed,
  }) {
    return _then(_LbtcLnSwap(
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
              as LBtcSwapScriptStr,
      invoice: null == invoice
          ? _self.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _self.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      scriptAddress: null == scriptAddress
          ? _self.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _self.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get keys {
    return $KeyPairCopyWith<$Res>(_self.keys, (value) {
      return _then(_self.copyWith(keys: value));
    });
  }

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_self.preimage, (value) {
      return _then(_self.copyWith(preimage: value));
    });
  }

  /// Create a copy of LbtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<$Res> get swapScript {
    return $LBtcSwapScriptStrCopyWith<$Res>(_self.swapScript, (value) {
      return _then(_self.copyWith(swapScript: value));
    });
  }
}

// dart format on

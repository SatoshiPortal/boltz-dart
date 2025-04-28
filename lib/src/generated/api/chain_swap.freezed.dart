// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain_swap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChainSwap {
  String get id;
  bool get isTestnet;
  ChainSwapDirection get direction;
  KeyPair get refundKeys;
  BigInt get refundIndex;
  KeyPair get claimKeys;
  BigInt get claimIndex;
  PreImage get preimage;
  BtcSwapScriptStr get btcScriptStr;
  LBtcSwapScriptStr get lbtcScriptStr;
  String get scriptAddress;
  BigInt get outAmount;
  String get btcElectrumUrl;
  String get lbtcElectrumUrl;
  String get boltzUrl;
  String? get referralId;
  String get blindingKey;

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChainSwapCopyWith<ChainSwap> get copyWith =>
      _$ChainSwapCopyWithImpl<ChainSwap>(this as ChainSwap, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChainSwap &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isTestnet, isTestnet) ||
                other.isTestnet == isTestnet) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.refundKeys, refundKeys) ||
                other.refundKeys == refundKeys) &&
            (identical(other.refundIndex, refundIndex) ||
                other.refundIndex == refundIndex) &&
            (identical(other.claimKeys, claimKeys) ||
                other.claimKeys == claimKeys) &&
            (identical(other.claimIndex, claimIndex) ||
                other.claimIndex == claimIndex) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.btcScriptStr, btcScriptStr) ||
                other.btcScriptStr == btcScriptStr) &&
            (identical(other.lbtcScriptStr, lbtcScriptStr) ||
                other.lbtcScriptStr == lbtcScriptStr) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.btcElectrumUrl, btcElectrumUrl) ||
                other.btcElectrumUrl == btcElectrumUrl) &&
            (identical(other.lbtcElectrumUrl, lbtcElectrumUrl) ||
                other.lbtcElectrumUrl == lbtcElectrumUrl) &&
            (identical(other.boltzUrl, boltzUrl) ||
                other.boltzUrl == boltzUrl) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.blindingKey, blindingKey) ||
                other.blindingKey == blindingKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isTestnet,
      direction,
      refundKeys,
      refundIndex,
      claimKeys,
      claimIndex,
      preimage,
      btcScriptStr,
      lbtcScriptStr,
      scriptAddress,
      outAmount,
      btcElectrumUrl,
      lbtcElectrumUrl,
      boltzUrl,
      referralId,
      blindingKey);

  @override
  String toString() {
    return 'ChainSwap(id: $id, isTestnet: $isTestnet, direction: $direction, refundKeys: $refundKeys, refundIndex: $refundIndex, claimKeys: $claimKeys, claimIndex: $claimIndex, preimage: $preimage, btcScriptStr: $btcScriptStr, lbtcScriptStr: $lbtcScriptStr, scriptAddress: $scriptAddress, outAmount: $outAmount, btcElectrumUrl: $btcElectrumUrl, lbtcElectrumUrl: $lbtcElectrumUrl, boltzUrl: $boltzUrl, referralId: $referralId, blindingKey: $blindingKey)';
  }
}

/// @nodoc
abstract mixin class $ChainSwapCopyWith<$Res> {
  factory $ChainSwapCopyWith(ChainSwap value, $Res Function(ChainSwap) _then) =
      _$ChainSwapCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      bool isTestnet,
      ChainSwapDirection direction,
      KeyPair refundKeys,
      BigInt refundIndex,
      KeyPair claimKeys,
      BigInt claimIndex,
      PreImage preimage,
      BtcSwapScriptStr btcScriptStr,
      LBtcSwapScriptStr lbtcScriptStr,
      String scriptAddress,
      BigInt outAmount,
      String btcElectrumUrl,
      String lbtcElectrumUrl,
      String boltzUrl,
      String? referralId,
      String blindingKey});

  $KeyPairCopyWith<$Res> get refundKeys;
  $KeyPairCopyWith<$Res> get claimKeys;
  $PreImageCopyWith<$Res> get preimage;
  $BtcSwapScriptStrCopyWith<$Res> get btcScriptStr;
  $LBtcSwapScriptStrCopyWith<$Res> get lbtcScriptStr;
}

/// @nodoc
class _$ChainSwapCopyWithImpl<$Res> implements $ChainSwapCopyWith<$Res> {
  _$ChainSwapCopyWithImpl(this._self, this._then);

  final ChainSwap _self;
  final $Res Function(ChainSwap) _then;

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isTestnet = null,
    Object? direction = null,
    Object? refundKeys = null,
    Object? refundIndex = null,
    Object? claimKeys = null,
    Object? claimIndex = null,
    Object? preimage = null,
    Object? btcScriptStr = null,
    Object? lbtcScriptStr = null,
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? btcElectrumUrl = null,
    Object? lbtcElectrumUrl = null,
    Object? boltzUrl = null,
    Object? referralId = freezed,
    Object? blindingKey = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTestnet: null == isTestnet
          ? _self.isTestnet
          : isTestnet // ignore: cast_nullable_to_non_nullable
              as bool,
      direction: null == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as ChainSwapDirection,
      refundKeys: null == refundKeys
          ? _self.refundKeys
          : refundKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      refundIndex: null == refundIndex
          ? _self.refundIndex
          : refundIndex // ignore: cast_nullable_to_non_nullable
              as BigInt,
      claimKeys: null == claimKeys
          ? _self.claimKeys
          : claimKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      claimIndex: null == claimIndex
          ? _self.claimIndex
          : claimIndex // ignore: cast_nullable_to_non_nullable
              as BigInt,
      preimage: null == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      btcScriptStr: null == btcScriptStr
          ? _self.btcScriptStr
          : btcScriptStr // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      lbtcScriptStr: null == lbtcScriptStr
          ? _self.lbtcScriptStr
          : lbtcScriptStr // ignore: cast_nullable_to_non_nullable
              as LBtcSwapScriptStr,
      scriptAddress: null == scriptAddress
          ? _self.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _self.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      btcElectrumUrl: null == btcElectrumUrl
          ? _self.btcElectrumUrl
          : btcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lbtcElectrumUrl: null == lbtcElectrumUrl
          ? _self.lbtcElectrumUrl
          : lbtcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _self.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _self.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
      blindingKey: null == blindingKey
          ? _self.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get refundKeys {
    return $KeyPairCopyWith<$Res>(_self.refundKeys, (value) {
      return _then(_self.copyWith(refundKeys: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get claimKeys {
    return $KeyPairCopyWith<$Res>(_self.claimKeys, (value) {
      return _then(_self.copyWith(claimKeys: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_self.preimage, (value) {
      return _then(_self.copyWith(preimage: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<$Res> get btcScriptStr {
    return $BtcSwapScriptStrCopyWith<$Res>(_self.btcScriptStr, (value) {
      return _then(_self.copyWith(btcScriptStr: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<$Res> get lbtcScriptStr {
    return $LBtcSwapScriptStrCopyWith<$Res>(_self.lbtcScriptStr, (value) {
      return _then(_self.copyWith(lbtcScriptStr: value));
    });
  }
}

/// @nodoc

class _ChainSwap extends ChainSwap {
  const _ChainSwap(
      {required this.id,
      required this.isTestnet,
      required this.direction,
      required this.refundKeys,
      required this.refundIndex,
      required this.claimKeys,
      required this.claimIndex,
      required this.preimage,
      required this.btcScriptStr,
      required this.lbtcScriptStr,
      required this.scriptAddress,
      required this.outAmount,
      required this.btcElectrumUrl,
      required this.lbtcElectrumUrl,
      required this.boltzUrl,
      this.referralId,
      required this.blindingKey})
      : super._();

  @override
  final String id;
  @override
  final bool isTestnet;
  @override
  final ChainSwapDirection direction;
  @override
  final KeyPair refundKeys;
  @override
  final BigInt refundIndex;
  @override
  final KeyPair claimKeys;
  @override
  final BigInt claimIndex;
  @override
  final PreImage preimage;
  @override
  final BtcSwapScriptStr btcScriptStr;
  @override
  final LBtcSwapScriptStr lbtcScriptStr;
  @override
  final String scriptAddress;
  @override
  final BigInt outAmount;
  @override
  final String btcElectrumUrl;
  @override
  final String lbtcElectrumUrl;
  @override
  final String boltzUrl;
  @override
  final String? referralId;
  @override
  final String blindingKey;

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChainSwapCopyWith<_ChainSwap> get copyWith =>
      __$ChainSwapCopyWithImpl<_ChainSwap>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChainSwap &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isTestnet, isTestnet) ||
                other.isTestnet == isTestnet) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.refundKeys, refundKeys) ||
                other.refundKeys == refundKeys) &&
            (identical(other.refundIndex, refundIndex) ||
                other.refundIndex == refundIndex) &&
            (identical(other.claimKeys, claimKeys) ||
                other.claimKeys == claimKeys) &&
            (identical(other.claimIndex, claimIndex) ||
                other.claimIndex == claimIndex) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.btcScriptStr, btcScriptStr) ||
                other.btcScriptStr == btcScriptStr) &&
            (identical(other.lbtcScriptStr, lbtcScriptStr) ||
                other.lbtcScriptStr == lbtcScriptStr) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.btcElectrumUrl, btcElectrumUrl) ||
                other.btcElectrumUrl == btcElectrumUrl) &&
            (identical(other.lbtcElectrumUrl, lbtcElectrumUrl) ||
                other.lbtcElectrumUrl == lbtcElectrumUrl) &&
            (identical(other.boltzUrl, boltzUrl) ||
                other.boltzUrl == boltzUrl) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.blindingKey, blindingKey) ||
                other.blindingKey == blindingKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isTestnet,
      direction,
      refundKeys,
      refundIndex,
      claimKeys,
      claimIndex,
      preimage,
      btcScriptStr,
      lbtcScriptStr,
      scriptAddress,
      outAmount,
      btcElectrumUrl,
      lbtcElectrumUrl,
      boltzUrl,
      referralId,
      blindingKey);

  @override
  String toString() {
    return 'ChainSwap(id: $id, isTestnet: $isTestnet, direction: $direction, refundKeys: $refundKeys, refundIndex: $refundIndex, claimKeys: $claimKeys, claimIndex: $claimIndex, preimage: $preimage, btcScriptStr: $btcScriptStr, lbtcScriptStr: $lbtcScriptStr, scriptAddress: $scriptAddress, outAmount: $outAmount, btcElectrumUrl: $btcElectrumUrl, lbtcElectrumUrl: $lbtcElectrumUrl, boltzUrl: $boltzUrl, referralId: $referralId, blindingKey: $blindingKey)';
  }
}

/// @nodoc
abstract mixin class _$ChainSwapCopyWith<$Res>
    implements $ChainSwapCopyWith<$Res> {
  factory _$ChainSwapCopyWith(
          _ChainSwap value, $Res Function(_ChainSwap) _then) =
      __$ChainSwapCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      bool isTestnet,
      ChainSwapDirection direction,
      KeyPair refundKeys,
      BigInt refundIndex,
      KeyPair claimKeys,
      BigInt claimIndex,
      PreImage preimage,
      BtcSwapScriptStr btcScriptStr,
      LBtcSwapScriptStr lbtcScriptStr,
      String scriptAddress,
      BigInt outAmount,
      String btcElectrumUrl,
      String lbtcElectrumUrl,
      String boltzUrl,
      String? referralId,
      String blindingKey});

  @override
  $KeyPairCopyWith<$Res> get refundKeys;
  @override
  $KeyPairCopyWith<$Res> get claimKeys;
  @override
  $PreImageCopyWith<$Res> get preimage;
  @override
  $BtcSwapScriptStrCopyWith<$Res> get btcScriptStr;
  @override
  $LBtcSwapScriptStrCopyWith<$Res> get lbtcScriptStr;
}

/// @nodoc
class __$ChainSwapCopyWithImpl<$Res> implements _$ChainSwapCopyWith<$Res> {
  __$ChainSwapCopyWithImpl(this._self, this._then);

  final _ChainSwap _self;
  final $Res Function(_ChainSwap) _then;

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isTestnet = null,
    Object? direction = null,
    Object? refundKeys = null,
    Object? refundIndex = null,
    Object? claimKeys = null,
    Object? claimIndex = null,
    Object? preimage = null,
    Object? btcScriptStr = null,
    Object? lbtcScriptStr = null,
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? btcElectrumUrl = null,
    Object? lbtcElectrumUrl = null,
    Object? boltzUrl = null,
    Object? referralId = freezed,
    Object? blindingKey = null,
  }) {
    return _then(_ChainSwap(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTestnet: null == isTestnet
          ? _self.isTestnet
          : isTestnet // ignore: cast_nullable_to_non_nullable
              as bool,
      direction: null == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as ChainSwapDirection,
      refundKeys: null == refundKeys
          ? _self.refundKeys
          : refundKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      refundIndex: null == refundIndex
          ? _self.refundIndex
          : refundIndex // ignore: cast_nullable_to_non_nullable
              as BigInt,
      claimKeys: null == claimKeys
          ? _self.claimKeys
          : claimKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      claimIndex: null == claimIndex
          ? _self.claimIndex
          : claimIndex // ignore: cast_nullable_to_non_nullable
              as BigInt,
      preimage: null == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      btcScriptStr: null == btcScriptStr
          ? _self.btcScriptStr
          : btcScriptStr // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      lbtcScriptStr: null == lbtcScriptStr
          ? _self.lbtcScriptStr
          : lbtcScriptStr // ignore: cast_nullable_to_non_nullable
              as LBtcSwapScriptStr,
      scriptAddress: null == scriptAddress
          ? _self.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _self.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      btcElectrumUrl: null == btcElectrumUrl
          ? _self.btcElectrumUrl
          : btcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lbtcElectrumUrl: null == lbtcElectrumUrl
          ? _self.lbtcElectrumUrl
          : lbtcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _self.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _self.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
      blindingKey: null == blindingKey
          ? _self.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get refundKeys {
    return $KeyPairCopyWith<$Res>(_self.refundKeys, (value) {
      return _then(_self.copyWith(refundKeys: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get claimKeys {
    return $KeyPairCopyWith<$Res>(_self.claimKeys, (value) {
      return _then(_self.copyWith(claimKeys: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_self.preimage, (value) {
      return _then(_self.copyWith(preimage: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<$Res> get btcScriptStr {
    return $BtcSwapScriptStrCopyWith<$Res>(_self.btcScriptStr, (value) {
      return _then(_self.copyWith(btcScriptStr: value));
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<$Res> get lbtcScriptStr {
    return $LBtcSwapScriptStrCopyWith<$Res>(_self.lbtcScriptStr, (value) {
      return _then(_self.copyWith(lbtcScriptStr: value));
    });
  }
}

// dart format on

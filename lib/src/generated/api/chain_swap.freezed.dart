// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain_swap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChainSwap {
  String get id => throw _privateConstructorUsedError;
  bool get isTestnet => throw _privateConstructorUsedError;
  ChainSwapDirection get direction => throw _privateConstructorUsedError;
  KeyPair get refundKeys => throw _privateConstructorUsedError;
  int get refundIndex => throw _privateConstructorUsedError;
  KeyPair get claimKeys => throw _privateConstructorUsedError;
  int get claimIndex => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  BtcSwapScriptStr get btcScriptStr => throw _privateConstructorUsedError;
  LBtcSwapScriptStr get lbtcScriptStr => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get btcElectrumUrl => throw _privateConstructorUsedError;
  String get lbtcElectrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;
  String? get referralId => throw _privateConstructorUsedError;
  String get blindingKey => throw _privateConstructorUsedError;

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChainSwapCopyWith<ChainSwap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainSwapCopyWith<$Res> {
  factory $ChainSwapCopyWith(ChainSwap value, $Res Function(ChainSwap) then) =
      _$ChainSwapCopyWithImpl<$Res, ChainSwap>;
  @useResult
  $Res call(
      {String id,
      bool isTestnet,
      ChainSwapDirection direction,
      KeyPair refundKeys,
      int refundIndex,
      KeyPair claimKeys,
      int claimIndex,
      PreImage preimage,
      BtcSwapScriptStr btcScriptStr,
      LBtcSwapScriptStr lbtcScriptStr,
      String scriptAddress,
      int outAmount,
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
class _$ChainSwapCopyWithImpl<$Res, $Val extends ChainSwap>
    implements $ChainSwapCopyWith<$Res> {
  _$ChainSwapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTestnet: null == isTestnet
          ? _value.isTestnet
          : isTestnet // ignore: cast_nullable_to_non_nullable
              as bool,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as ChainSwapDirection,
      refundKeys: null == refundKeys
          ? _value.refundKeys
          : refundKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      refundIndex: null == refundIndex
          ? _value.refundIndex
          : refundIndex // ignore: cast_nullable_to_non_nullable
              as int,
      claimKeys: null == claimKeys
          ? _value.claimKeys
          : claimKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      claimIndex: null == claimIndex
          ? _value.claimIndex
          : claimIndex // ignore: cast_nullable_to_non_nullable
              as int,
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      btcScriptStr: null == btcScriptStr
          ? _value.btcScriptStr
          : btcScriptStr // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      lbtcScriptStr: null == lbtcScriptStr
          ? _value.lbtcScriptStr
          : lbtcScriptStr // ignore: cast_nullable_to_non_nullable
              as LBtcSwapScriptStr,
      scriptAddress: null == scriptAddress
          ? _value.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _value.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as int,
      btcElectrumUrl: null == btcElectrumUrl
          ? _value.btcElectrumUrl
          : btcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lbtcElectrumUrl: null == lbtcElectrumUrl
          ? _value.lbtcElectrumUrl
          : lbtcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _value.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
      blindingKey: null == blindingKey
          ? _value.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get refundKeys {
    return $KeyPairCopyWith<$Res>(_value.refundKeys, (value) {
      return _then(_value.copyWith(refundKeys: value) as $Val);
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get claimKeys {
    return $KeyPairCopyWith<$Res>(_value.claimKeys, (value) {
      return _then(_value.copyWith(claimKeys: value) as $Val);
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_value.preimage, (value) {
      return _then(_value.copyWith(preimage: value) as $Val);
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<$Res> get btcScriptStr {
    return $BtcSwapScriptStrCopyWith<$Res>(_value.btcScriptStr, (value) {
      return _then(_value.copyWith(btcScriptStr: value) as $Val);
    });
  }

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<$Res> get lbtcScriptStr {
    return $LBtcSwapScriptStrCopyWith<$Res>(_value.lbtcScriptStr, (value) {
      return _then(_value.copyWith(lbtcScriptStr: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChainSwapImplCopyWith<$Res>
    implements $ChainSwapCopyWith<$Res> {
  factory _$$ChainSwapImplCopyWith(
          _$ChainSwapImpl value, $Res Function(_$ChainSwapImpl) then) =
      __$$ChainSwapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isTestnet,
      ChainSwapDirection direction,
      KeyPair refundKeys,
      int refundIndex,
      KeyPair claimKeys,
      int claimIndex,
      PreImage preimage,
      BtcSwapScriptStr btcScriptStr,
      LBtcSwapScriptStr lbtcScriptStr,
      String scriptAddress,
      int outAmount,
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
class __$$ChainSwapImplCopyWithImpl<$Res>
    extends _$ChainSwapCopyWithImpl<$Res, _$ChainSwapImpl>
    implements _$$ChainSwapImplCopyWith<$Res> {
  __$$ChainSwapImplCopyWithImpl(
      _$ChainSwapImpl _value, $Res Function(_$ChainSwapImpl) _then)
      : super(_value, _then);

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
    return _then(_$ChainSwapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTestnet: null == isTestnet
          ? _value.isTestnet
          : isTestnet // ignore: cast_nullable_to_non_nullable
              as bool,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as ChainSwapDirection,
      refundKeys: null == refundKeys
          ? _value.refundKeys
          : refundKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      refundIndex: null == refundIndex
          ? _value.refundIndex
          : refundIndex // ignore: cast_nullable_to_non_nullable
              as int,
      claimKeys: null == claimKeys
          ? _value.claimKeys
          : claimKeys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      claimIndex: null == claimIndex
          ? _value.claimIndex
          : claimIndex // ignore: cast_nullable_to_non_nullable
              as int,
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      btcScriptStr: null == btcScriptStr
          ? _value.btcScriptStr
          : btcScriptStr // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      lbtcScriptStr: null == lbtcScriptStr
          ? _value.lbtcScriptStr
          : lbtcScriptStr // ignore: cast_nullable_to_non_nullable
              as LBtcSwapScriptStr,
      scriptAddress: null == scriptAddress
          ? _value.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _value.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as int,
      btcElectrumUrl: null == btcElectrumUrl
          ? _value.btcElectrumUrl
          : btcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lbtcElectrumUrl: null == lbtcElectrumUrl
          ? _value.lbtcElectrumUrl
          : lbtcElectrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _value.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
      blindingKey: null == blindingKey
          ? _value.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChainSwapImpl extends _ChainSwap {
  const _$ChainSwapImpl(
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
  final int refundIndex;
  @override
  final KeyPair claimKeys;
  @override
  final int claimIndex;
  @override
  final PreImage preimage;
  @override
  final BtcSwapScriptStr btcScriptStr;
  @override
  final LBtcSwapScriptStr lbtcScriptStr;
  @override
  final String scriptAddress;
  @override
  final int outAmount;
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

  @override
  String toString() {
    return 'ChainSwap(id: $id, isTestnet: $isTestnet, direction: $direction, refundKeys: $refundKeys, refundIndex: $refundIndex, claimKeys: $claimKeys, claimIndex: $claimIndex, preimage: $preimage, btcScriptStr: $btcScriptStr, lbtcScriptStr: $lbtcScriptStr, scriptAddress: $scriptAddress, outAmount: $outAmount, btcElectrumUrl: $btcElectrumUrl, lbtcElectrumUrl: $lbtcElectrumUrl, boltzUrl: $boltzUrl, referralId: $referralId, blindingKey: $blindingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainSwapImpl &&
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

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainSwapImplCopyWith<_$ChainSwapImpl> get copyWith =>
      __$$ChainSwapImplCopyWithImpl<_$ChainSwapImpl>(this, _$identity);
}

abstract class _ChainSwap extends ChainSwap {
  const factory _ChainSwap(
      {required final String id,
      required final bool isTestnet,
      required final ChainSwapDirection direction,
      required final KeyPair refundKeys,
      required final int refundIndex,
      required final KeyPair claimKeys,
      required final int claimIndex,
      required final PreImage preimage,
      required final BtcSwapScriptStr btcScriptStr,
      required final LBtcSwapScriptStr lbtcScriptStr,
      required final String scriptAddress,
      required final int outAmount,
      required final String btcElectrumUrl,
      required final String lbtcElectrumUrl,
      required final String boltzUrl,
      final String? referralId,
      required final String blindingKey}) = _$ChainSwapImpl;
  const _ChainSwap._() : super._();

  @override
  String get id;
  @override
  bool get isTestnet;
  @override
  ChainSwapDirection get direction;
  @override
  KeyPair get refundKeys;
  @override
  int get refundIndex;
  @override
  KeyPair get claimKeys;
  @override
  int get claimIndex;
  @override
  PreImage get preimage;
  @override
  BtcSwapScriptStr get btcScriptStr;
  @override
  LBtcSwapScriptStr get lbtcScriptStr;
  @override
  String get scriptAddress;
  @override
  int get outAmount;
  @override
  String get btcElectrumUrl;
  @override
  String get lbtcElectrumUrl;
  @override
  String get boltzUrl;
  @override
  String? get referralId;
  @override
  String get blindingKey;

  /// Create a copy of ChainSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainSwapImplCopyWith<_$ChainSwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_ln.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BtcLnSwap {
  String get id => throw _privateConstructorUsedError;
  SwapType get kind => throw _privateConstructorUsedError;
  Chain get network => throw _privateConstructorUsedError;
  KeyPair get keys => throw _privateConstructorUsedError;
  int get keyIndex => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  BtcSwapScriptStr get swapScript => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get electrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;
  String? get referralId => throw _privateConstructorUsedError;

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BtcLnSwapCopyWith<BtcLnSwap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcLnSwapCopyWith<$Res> {
  factory $BtcLnSwapCopyWith(BtcLnSwap value, $Res Function(BtcLnSwap) then) =
      _$BtcLnSwapCopyWithImpl<$Res, BtcLnSwap>;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      int keyIndex,
      PreImage preimage,
      BtcSwapScriptStr swapScript,
      String invoice,
      String scriptAddress,
      int outAmount,
      String electrumUrl,
      String boltzUrl,
      String? referralId});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
  $BtcSwapScriptStrCopyWith<$Res> get swapScript;
}

/// @nodoc
class _$BtcLnSwapCopyWithImpl<$Res, $Val extends BtcLnSwap>
    implements $BtcLnSwapCopyWith<$Res> {
  _$BtcLnSwapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as SwapType,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as Chain,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      keyIndex: null == keyIndex
          ? _value.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      swapScript: null == swapScript
          ? _value.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      scriptAddress: null == scriptAddress
          ? _value.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _value.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as int,
      electrumUrl: null == electrumUrl
          ? _value.electrumUrl
          : electrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _value.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get keys {
    return $KeyPairCopyWith<$Res>(_value.keys, (value) {
      return _then(_value.copyWith(keys: value) as $Val);
    });
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_value.preimage, (value) {
      return _then(_value.copyWith(preimage: value) as $Val);
    });
  }

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptStrCopyWith<$Res> get swapScript {
    return $BtcSwapScriptStrCopyWith<$Res>(_value.swapScript, (value) {
      return _then(_value.copyWith(swapScript: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BtcLnSwapImplCopyWith<$Res>
    implements $BtcLnSwapCopyWith<$Res> {
  factory _$$BtcLnSwapImplCopyWith(
          _$BtcLnSwapImpl value, $Res Function(_$BtcLnSwapImpl) then) =
      __$$BtcLnSwapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      int keyIndex,
      PreImage preimage,
      BtcSwapScriptStr swapScript,
      String invoice,
      String scriptAddress,
      int outAmount,
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
class __$$BtcLnSwapImplCopyWithImpl<$Res>
    extends _$BtcLnSwapCopyWithImpl<$Res, _$BtcLnSwapImpl>
    implements _$$BtcLnSwapImplCopyWith<$Res> {
  __$$BtcLnSwapImplCopyWithImpl(
      _$BtcLnSwapImpl _value, $Res Function(_$BtcLnSwapImpl) _then)
      : super(_value, _then);

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
    return _then(_$BtcLnSwapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as SwapType,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as Chain,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as KeyPair,
      keyIndex: null == keyIndex
          ? _value.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      swapScript: null == swapScript
          ? _value.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptStr,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      scriptAddress: null == scriptAddress
          ? _value.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _value.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as int,
      electrumUrl: null == electrumUrl
          ? _value.electrumUrl
          : electrumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      boltzUrl: null == boltzUrl
          ? _value.boltzUrl
          : boltzUrl // ignore: cast_nullable_to_non_nullable
              as String,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BtcLnSwapImpl extends _BtcLnSwap {
  const _$BtcLnSwapImpl(
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
  final int keyIndex;
  @override
  final PreImage preimage;
  @override
  final BtcSwapScriptStr swapScript;
  @override
  final String invoice;
  @override
  final String scriptAddress;
  @override
  final int outAmount;
  @override
  final String electrumUrl;
  @override
  final String boltzUrl;
  @override
  final String? referralId;

  @override
  String toString() {
    return 'BtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, keyIndex: $keyIndex, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, scriptAddress: $scriptAddress, outAmount: $outAmount, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BtcLnSwapImpl &&
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

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BtcLnSwapImplCopyWith<_$BtcLnSwapImpl> get copyWith =>
      __$$BtcLnSwapImplCopyWithImpl<_$BtcLnSwapImpl>(this, _$identity);
}

abstract class _BtcLnSwap extends BtcLnSwap {
  const factory _BtcLnSwap(
      {required final String id,
      required final SwapType kind,
      required final Chain network,
      required final KeyPair keys,
      required final int keyIndex,
      required final PreImage preimage,
      required final BtcSwapScriptStr swapScript,
      required final String invoice,
      required final String scriptAddress,
      required final int outAmount,
      required final String electrumUrl,
      required final String boltzUrl,
      final String? referralId}) = _$BtcLnSwapImpl;
  const _BtcLnSwap._() : super._();

  @override
  String get id;
  @override
  SwapType get kind;
  @override
  Chain get network;
  @override
  KeyPair get keys;
  @override
  int get keyIndex;
  @override
  PreImage get preimage;
  @override
  BtcSwapScriptStr get swapScript;
  @override
  String get invoice;
  @override
  String get scriptAddress;
  @override
  int get outAmount;
  @override
  String get electrumUrl;
  @override
  String get boltzUrl;
  @override
  String? get referralId;

  /// Create a copy of BtcLnSwap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BtcLnSwapImplCopyWith<_$BtcLnSwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

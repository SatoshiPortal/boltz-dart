// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lbtc_ln.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LbtcLnSwap {
  String get id => throw _privateConstructorUsedError;
  SwapType get kind => throw _privateConstructorUsedError;
  Chain get network => throw _privateConstructorUsedError;
  KeyPair get keys => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  LBtcSwapScriptStr get swapScript => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  String get blindingKey => throw _privateConstructorUsedError;
  String get electrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;
  String? get referralId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LbtcLnSwapCopyWith<LbtcLnSwap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LbtcLnSwapCopyWith<$Res> {
  factory $LbtcLnSwapCopyWith(
          LbtcLnSwap value, $Res Function(LbtcLnSwap) then) =
      _$LbtcLnSwapCopyWithImpl<$Res, LbtcLnSwap>;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      LBtcSwapScriptStr swapScript,
      String invoice,
      int outAmount,
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
class _$LbtcLnSwapCopyWithImpl<$Res, $Val extends LbtcLnSwap>
    implements $LbtcLnSwapCopyWith<$Res> {
  _$LbtcLnSwapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? network = null,
    Object? keys = null,
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
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      swapScript: null == swapScript
          ? _value.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as LBtcSwapScriptStr,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _value.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as int,
      scriptAddress: null == scriptAddress
          ? _value.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _value.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
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

  @override
  @pragma('vm:prefer-inline')
  $KeyPairCopyWith<$Res> get keys {
    return $KeyPairCopyWith<$Res>(_value.keys, (value) {
      return _then(_value.copyWith(keys: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PreImageCopyWith<$Res> get preimage {
    return $PreImageCopyWith<$Res>(_value.preimage, (value) {
      return _then(_value.copyWith(preimage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LBtcSwapScriptStrCopyWith<$Res> get swapScript {
    return $LBtcSwapScriptStrCopyWith<$Res>(_value.swapScript, (value) {
      return _then(_value.copyWith(swapScript: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LbtcLnSwapImplCopyWith<$Res>
    implements $LbtcLnSwapCopyWith<$Res> {
  factory _$$LbtcLnSwapImplCopyWith(
          _$LbtcLnSwapImpl value, $Res Function(_$LbtcLnSwapImpl) then) =
      __$$LbtcLnSwapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      LBtcSwapScriptStr swapScript,
      String invoice,
      int outAmount,
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
class __$$LbtcLnSwapImplCopyWithImpl<$Res>
    extends _$LbtcLnSwapCopyWithImpl<$Res, _$LbtcLnSwapImpl>
    implements _$$LbtcLnSwapImplCopyWith<$Res> {
  __$$LbtcLnSwapImplCopyWithImpl(
      _$LbtcLnSwapImpl _value, $Res Function(_$LbtcLnSwapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? network = null,
    Object? keys = null,
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
    return _then(_$LbtcLnSwapImpl(
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
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      swapScript: null == swapScript
          ? _value.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as LBtcSwapScriptStr,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      outAmount: null == outAmount
          ? _value.outAmount
          : outAmount // ignore: cast_nullable_to_non_nullable
              as int,
      scriptAddress: null == scriptAddress
          ? _value.scriptAddress
          : scriptAddress // ignore: cast_nullable_to_non_nullable
              as String,
      blindingKey: null == blindingKey
          ? _value.blindingKey
          : blindingKey // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$LbtcLnSwapImpl extends _LbtcLnSwap {
  const _$LbtcLnSwapImpl(
      {required this.id,
      required this.kind,
      required this.network,
      required this.keys,
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
  final PreImage preimage;
  @override
  final LBtcSwapScriptStr swapScript;
  @override
  final String invoice;
  @override
  final int outAmount;
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

  @override
  String toString() {
    return 'LbtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, outAmount: $outAmount, scriptAddress: $scriptAddress, blindingKey: $blindingKey, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LbtcLnSwapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.keys, keys) || other.keys == keys) &&
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
      preimage,
      swapScript,
      invoice,
      outAmount,
      scriptAddress,
      blindingKey,
      electrumUrl,
      boltzUrl,
      referralId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LbtcLnSwapImplCopyWith<_$LbtcLnSwapImpl> get copyWith =>
      __$$LbtcLnSwapImplCopyWithImpl<_$LbtcLnSwapImpl>(this, _$identity);
}

abstract class _LbtcLnSwap extends LbtcLnSwap {
  const factory _LbtcLnSwap(
      {required final String id,
      required final SwapType kind,
      required final Chain network,
      required final KeyPair keys,
      required final PreImage preimage,
      required final LBtcSwapScriptStr swapScript,
      required final String invoice,
      required final int outAmount,
      required final String scriptAddress,
      required final String blindingKey,
      required final String electrumUrl,
      required final String boltzUrl,
      final String? referralId}) = _$LbtcLnSwapImpl;
  const _LbtcLnSwap._() : super._();

  @override
  String get id;
  @override
  SwapType get kind;
  @override
  Chain get network;
  @override
  KeyPair get keys;
  @override
  PreImage get preimage;
  @override
  LBtcSwapScriptStr get swapScript;
  @override
  String get invoice;
  @override
  int get outAmount;
  @override
  String get scriptAddress;
  @override
  String get blindingKey;
  @override
  String get electrumUrl;
  @override
  String get boltzUrl;
  @override
  String? get referralId;
  @override
  @JsonKey(ignore: true)
  _$$LbtcLnSwapImplCopyWith<_$LbtcLnSwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

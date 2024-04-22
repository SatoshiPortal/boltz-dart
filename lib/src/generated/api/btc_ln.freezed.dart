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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BtcLnSwap {
  String get id => throw _privateConstructorUsedError;
  SwapType get kind => throw _privateConstructorUsedError;
  Chain get network => throw _privateConstructorUsedError;
  KeyPair get keys => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  String get redeemScript => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get electrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      PreImage preimage,
      String redeemScript,
      String invoice,
      String scriptAddress,
      int outAmount,
      String electrumUrl,
      String boltzUrl});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
}

/// @nodoc
class _$BtcLnSwapCopyWithImpl<$Res, $Val extends BtcLnSwap>
    implements $BtcLnSwapCopyWith<$Res> {
  _$BtcLnSwapCopyWithImpl(this._value, this._then);

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
    Object? redeemScript = null,
    Object? invoice = null,
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
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
      redeemScript: null == redeemScript
          ? _value.redeemScript
          : redeemScript // ignore: cast_nullable_to_non_nullable
              as String,
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
      PreImage preimage,
      String redeemScript,
      String invoice,
      String scriptAddress,
      int outAmount,
      String electrumUrl,
      String boltzUrl});

  @override
  $KeyPairCopyWith<$Res> get keys;
  @override
  $PreImageCopyWith<$Res> get preimage;
}

/// @nodoc
class __$$BtcLnSwapImplCopyWithImpl<$Res>
    extends _$BtcLnSwapCopyWithImpl<$Res, _$BtcLnSwapImpl>
    implements _$$BtcLnSwapImplCopyWith<$Res> {
  __$$BtcLnSwapImplCopyWithImpl(
      _$BtcLnSwapImpl _value, $Res Function(_$BtcLnSwapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? network = null,
    Object? keys = null,
    Object? preimage = null,
    Object? redeemScript = null,
    Object? invoice = null,
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
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
      preimage: null == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PreImage,
      redeemScript: null == redeemScript
          ? _value.redeemScript
          : redeemScript // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.preimage,
      required this.redeemScript,
      required this.invoice,
      required this.scriptAddress,
      required this.outAmount,
      required this.electrumUrl,
      required this.boltzUrl})
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
  final String redeemScript;
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
  String toString() {
    return 'BtcLnSwap(id: $id, kind: $kind, network: $network, keys: $keys, preimage: $preimage, redeemScript: $redeemScript, invoice: $invoice, scriptAddress: $scriptAddress, outAmount: $outAmount, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl)';
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
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.redeemScript, redeemScript) ||
                other.redeemScript == redeemScript) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.scriptAddress, scriptAddress) ||
                other.scriptAddress == scriptAddress) &&
            (identical(other.outAmount, outAmount) ||
                other.outAmount == outAmount) &&
            (identical(other.electrumUrl, electrumUrl) ||
                other.electrumUrl == electrumUrl) &&
            (identical(other.boltzUrl, boltzUrl) ||
                other.boltzUrl == boltzUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      kind,
      network,
      keys,
      preimage,
      redeemScript,
      invoice,
      scriptAddress,
      outAmount,
      electrumUrl,
      boltzUrl);

  @JsonKey(ignore: true)
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
      required final PreImage preimage,
      required final String redeemScript,
      required final String invoice,
      required final String scriptAddress,
      required final int outAmount,
      required final String electrumUrl,
      required final String boltzUrl}) = _$BtcLnSwapImpl;
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
  PreImage get preimage;
  @override
  String get redeemScript;
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
  @JsonKey(ignore: true)
  _$$BtcLnSwapImplCopyWith<_$BtcLnSwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

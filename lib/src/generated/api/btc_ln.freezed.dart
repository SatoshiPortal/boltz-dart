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
mixin _$BtcLnV1Swap {
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
  $BtcLnV1SwapCopyWith<BtcLnV1Swap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcLnV1SwapCopyWith<$Res> {
  factory $BtcLnV1SwapCopyWith(
          BtcLnV1Swap value, $Res Function(BtcLnV1Swap) then) =
      _$BtcLnV1SwapCopyWithImpl<$Res, BtcLnV1Swap>;
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
class _$BtcLnV1SwapCopyWithImpl<$Res, $Val extends BtcLnV1Swap>
    implements $BtcLnV1SwapCopyWith<$Res> {
  _$BtcLnV1SwapCopyWithImpl(this._value, this._then);

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
abstract class _$$BtcLnV1SwapImplCopyWith<$Res>
    implements $BtcLnV1SwapCopyWith<$Res> {
  factory _$$BtcLnV1SwapImplCopyWith(
          _$BtcLnV1SwapImpl value, $Res Function(_$BtcLnV1SwapImpl) then) =
      __$$BtcLnV1SwapImplCopyWithImpl<$Res>;
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
class __$$BtcLnV1SwapImplCopyWithImpl<$Res>
    extends _$BtcLnV1SwapCopyWithImpl<$Res, _$BtcLnV1SwapImpl>
    implements _$$BtcLnV1SwapImplCopyWith<$Res> {
  __$$BtcLnV1SwapImplCopyWithImpl(
      _$BtcLnV1SwapImpl _value, $Res Function(_$BtcLnV1SwapImpl) _then)
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
    return _then(_$BtcLnV1SwapImpl(
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

class _$BtcLnV1SwapImpl extends _BtcLnV1Swap {
  const _$BtcLnV1SwapImpl(
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
    return 'BtcLnV1Swap(id: $id, kind: $kind, network: $network, keys: $keys, preimage: $preimage, redeemScript: $redeemScript, invoice: $invoice, scriptAddress: $scriptAddress, outAmount: $outAmount, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BtcLnV1SwapImpl &&
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
  _$$BtcLnV1SwapImplCopyWith<_$BtcLnV1SwapImpl> get copyWith =>
      __$$BtcLnV1SwapImplCopyWithImpl<_$BtcLnV1SwapImpl>(this, _$identity);
}

abstract class _BtcLnV1Swap extends BtcLnV1Swap {
  const factory _BtcLnV1Swap(
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
      required final String boltzUrl}) = _$BtcLnV1SwapImpl;
  const _BtcLnV1Swap._() : super._();

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
  _$$BtcLnV1SwapImplCopyWith<_$BtcLnV1SwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BtcLnV2Swap {
  String get id => throw _privateConstructorUsedError;
  SwapType get kind => throw _privateConstructorUsedError;
  Chain get network => throw _privateConstructorUsedError;
  KeyPair get keys => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  BtcSwapScriptV2Str get swapScript => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get electrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BtcLnV2SwapCopyWith<BtcLnV2Swap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcLnV2SwapCopyWith<$Res> {
  factory $BtcLnV2SwapCopyWith(
          BtcLnV2Swap value, $Res Function(BtcLnV2Swap) then) =
      _$BtcLnV2SwapCopyWithImpl<$Res, BtcLnV2Swap>;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      BtcSwapScriptV2Str swapScript,
      String invoice,
      String scriptAddress,
      int outAmount,
      String electrumUrl,
      String boltzUrl});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
  $BtcSwapScriptV2StrCopyWith<$Res> get swapScript;
}

/// @nodoc
class _$BtcLnV2SwapCopyWithImpl<$Res, $Val extends BtcLnV2Swap>
    implements $BtcLnV2SwapCopyWith<$Res> {
  _$BtcLnV2SwapCopyWithImpl(this._value, this._then);

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
      swapScript: null == swapScript
          ? _value.swapScript
          : swapScript // ignore: cast_nullable_to_non_nullable
              as BtcSwapScriptV2Str,
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

  @override
  @pragma('vm:prefer-inline')
  $BtcSwapScriptV2StrCopyWith<$Res> get swapScript {
    return $BtcSwapScriptV2StrCopyWith<$Res>(_value.swapScript, (value) {
      return _then(_value.copyWith(swapScript: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BtcLnV2SwapImplCopyWith<$Res>
    implements $BtcLnV2SwapCopyWith<$Res> {
  factory _$$BtcLnV2SwapImplCopyWith(
          _$BtcLnV2SwapImpl value, $Res Function(_$BtcLnV2SwapImpl) then) =
      __$$BtcLnV2SwapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      BtcSwapScriptV2Str swapScript,
      String invoice,
      String scriptAddress,
      int outAmount,
      String electrumUrl,
      String boltzUrl});

  @override
  $KeyPairCopyWith<$Res> get keys;
  @override
  $PreImageCopyWith<$Res> get preimage;
  @override
  $BtcSwapScriptV2StrCopyWith<$Res> get swapScript;
}

/// @nodoc
class __$$BtcLnV2SwapImplCopyWithImpl<$Res>
    extends _$BtcLnV2SwapCopyWithImpl<$Res, _$BtcLnV2SwapImpl>
    implements _$$BtcLnV2SwapImplCopyWith<$Res> {
  __$$BtcLnV2SwapImplCopyWithImpl(
      _$BtcLnV2SwapImpl _value, $Res Function(_$BtcLnV2SwapImpl) _then)
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
    Object? scriptAddress = null,
    Object? outAmount = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
  }) {
    return _then(_$BtcLnV2SwapImpl(
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
              as BtcSwapScriptV2Str,
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

class _$BtcLnV2SwapImpl extends _BtcLnV2Swap {
  const _$BtcLnV2SwapImpl(
      {required this.id,
      required this.kind,
      required this.network,
      required this.keys,
      required this.preimage,
      required this.swapScript,
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
  final BtcSwapScriptV2Str swapScript;
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
    return 'BtcLnV2Swap(id: $id, kind: $kind, network: $network, keys: $keys, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, scriptAddress: $scriptAddress, outAmount: $outAmount, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BtcLnV2SwapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.keys, keys) || other.keys == keys) &&
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
      swapScript,
      invoice,
      scriptAddress,
      outAmount,
      electrumUrl,
      boltzUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BtcLnV2SwapImplCopyWith<_$BtcLnV2SwapImpl> get copyWith =>
      __$$BtcLnV2SwapImplCopyWithImpl<_$BtcLnV2SwapImpl>(this, _$identity);
}

abstract class _BtcLnV2Swap extends BtcLnV2Swap {
  const factory _BtcLnV2Swap(
      {required final String id,
      required final SwapType kind,
      required final Chain network,
      required final KeyPair keys,
      required final PreImage preimage,
      required final BtcSwapScriptV2Str swapScript,
      required final String invoice,
      required final String scriptAddress,
      required final int outAmount,
      required final String electrumUrl,
      required final String boltzUrl}) = _$BtcLnV2SwapImpl;
  const _BtcLnV2Swap._() : super._();

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
  BtcSwapScriptV2Str get swapScript;
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
  _$$BtcLnV2SwapImplCopyWith<_$BtcLnV2SwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

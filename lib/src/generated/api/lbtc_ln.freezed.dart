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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LbtcLnV1Swap {
  String get id => throw _privateConstructorUsedError;
  SwapType get kind => throw _privateConstructorUsedError;
  Chain get network => throw _privateConstructorUsedError;
  KeyPair get keys => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  String get redeemScript => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  String get blindingKey => throw _privateConstructorUsedError;
  String get electrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LbtcLnV1SwapCopyWith<LbtcLnV1Swap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LbtcLnV1SwapCopyWith<$Res> {
  factory $LbtcLnV1SwapCopyWith(
          LbtcLnV1Swap value, $Res Function(LbtcLnV1Swap) then) =
      _$LbtcLnV1SwapCopyWithImpl<$Res, LbtcLnV1Swap>;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      String redeemScript,
      String invoice,
      int outAmount,
      String scriptAddress,
      String blindingKey,
      String electrumUrl,
      String boltzUrl});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
}

/// @nodoc
class _$LbtcLnV1SwapCopyWithImpl<$Res, $Val extends LbtcLnV1Swap>
    implements $LbtcLnV1SwapCopyWith<$Res> {
  _$LbtcLnV1SwapCopyWithImpl(this._value, this._then);

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
    Object? outAmount = null,
    Object? scriptAddress = null,
    Object? blindingKey = null,
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
abstract class _$$LbtcLnV1SwapImplCopyWith<$Res>
    implements $LbtcLnV1SwapCopyWith<$Res> {
  factory _$$LbtcLnV1SwapImplCopyWith(
          _$LbtcLnV1SwapImpl value, $Res Function(_$LbtcLnV1SwapImpl) then) =
      __$$LbtcLnV1SwapImplCopyWithImpl<$Res>;
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
      int outAmount,
      String scriptAddress,
      String blindingKey,
      String electrumUrl,
      String boltzUrl});

  @override
  $KeyPairCopyWith<$Res> get keys;
  @override
  $PreImageCopyWith<$Res> get preimage;
}

/// @nodoc
class __$$LbtcLnV1SwapImplCopyWithImpl<$Res>
    extends _$LbtcLnV1SwapCopyWithImpl<$Res, _$LbtcLnV1SwapImpl>
    implements _$$LbtcLnV1SwapImplCopyWith<$Res> {
  __$$LbtcLnV1SwapImplCopyWithImpl(
      _$LbtcLnV1SwapImpl _value, $Res Function(_$LbtcLnV1SwapImpl) _then)
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
    Object? outAmount = null,
    Object? scriptAddress = null,
    Object? blindingKey = null,
    Object? electrumUrl = null,
    Object? boltzUrl = null,
  }) {
    return _then(_$LbtcLnV1SwapImpl(
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
    ));
  }
}

/// @nodoc

class _$LbtcLnV1SwapImpl extends _LbtcLnV1Swap {
  const _$LbtcLnV1SwapImpl(
      {required this.id,
      required this.kind,
      required this.network,
      required this.keys,
      required this.preimage,
      required this.redeemScript,
      required this.invoice,
      required this.outAmount,
      required this.scriptAddress,
      required this.blindingKey,
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
  String toString() {
    return 'LbtcLnV1Swap(id: $id, kind: $kind, network: $network, keys: $keys, preimage: $preimage, redeemScript: $redeemScript, invoice: $invoice, outAmount: $outAmount, scriptAddress: $scriptAddress, blindingKey: $blindingKey, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LbtcLnV1SwapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.keys, keys) || other.keys == keys) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.redeemScript, redeemScript) ||
                other.redeemScript == redeemScript) &&
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
      outAmount,
      scriptAddress,
      blindingKey,
      electrumUrl,
      boltzUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LbtcLnV1SwapImplCopyWith<_$LbtcLnV1SwapImpl> get copyWith =>
      __$$LbtcLnV1SwapImplCopyWithImpl<_$LbtcLnV1SwapImpl>(this, _$identity);
}

abstract class _LbtcLnV1Swap extends LbtcLnV1Swap {
  const factory _LbtcLnV1Swap(
      {required final String id,
      required final SwapType kind,
      required final Chain network,
      required final KeyPair keys,
      required final PreImage preimage,
      required final String redeemScript,
      required final String invoice,
      required final int outAmount,
      required final String scriptAddress,
      required final String blindingKey,
      required final String electrumUrl,
      required final String boltzUrl}) = _$LbtcLnV1SwapImpl;
  const _LbtcLnV1Swap._() : super._();

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
  @JsonKey(ignore: true)
  _$$LbtcLnV1SwapImplCopyWith<_$LbtcLnV1SwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LbtcLnV2Swap {
  String get id => throw _privateConstructorUsedError;
  SwapType get kind => throw _privateConstructorUsedError;
  Chain get network => throw _privateConstructorUsedError;
  KeyPair get keys => throw _privateConstructorUsedError;
  PreImage get preimage => throw _privateConstructorUsedError;
  LBtcSwapScriptV2Str get swapScript => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  int get outAmount => throw _privateConstructorUsedError;
  String get scriptAddress => throw _privateConstructorUsedError;
  String get blindingKey => throw _privateConstructorUsedError;
  String get electrumUrl => throw _privateConstructorUsedError;
  String get boltzUrl => throw _privateConstructorUsedError;
  String? get referralId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LbtcLnV2SwapCopyWith<LbtcLnV2Swap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LbtcLnV2SwapCopyWith<$Res> {
  factory $LbtcLnV2SwapCopyWith(
          LbtcLnV2Swap value, $Res Function(LbtcLnV2Swap) then) =
      _$LbtcLnV2SwapCopyWithImpl<$Res, LbtcLnV2Swap>;
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      LBtcSwapScriptV2Str swapScript,
      String invoice,
      int outAmount,
      String scriptAddress,
      String blindingKey,
      String electrumUrl,
      String boltzUrl,
      String? referralId});

  $KeyPairCopyWith<$Res> get keys;
  $PreImageCopyWith<$Res> get preimage;
  $LBtcSwapScriptV2StrCopyWith<$Res> get swapScript;
}

/// @nodoc
class _$LbtcLnV2SwapCopyWithImpl<$Res, $Val extends LbtcLnV2Swap>
    implements $LbtcLnV2SwapCopyWith<$Res> {
  _$LbtcLnV2SwapCopyWithImpl(this._value, this._then);

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
              as LBtcSwapScriptV2Str,
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
  $LBtcSwapScriptV2StrCopyWith<$Res> get swapScript {
    return $LBtcSwapScriptV2StrCopyWith<$Res>(_value.swapScript, (value) {
      return _then(_value.copyWith(swapScript: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LbtcLnV2SwapImplCopyWith<$Res>
    implements $LbtcLnV2SwapCopyWith<$Res> {
  factory _$$LbtcLnV2SwapImplCopyWith(
          _$LbtcLnV2SwapImpl value, $Res Function(_$LbtcLnV2SwapImpl) then) =
      __$$LbtcLnV2SwapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SwapType kind,
      Chain network,
      KeyPair keys,
      PreImage preimage,
      LBtcSwapScriptV2Str swapScript,
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
  $LBtcSwapScriptV2StrCopyWith<$Res> get swapScript;
}

/// @nodoc
class __$$LbtcLnV2SwapImplCopyWithImpl<$Res>
    extends _$LbtcLnV2SwapCopyWithImpl<$Res, _$LbtcLnV2SwapImpl>
    implements _$$LbtcLnV2SwapImplCopyWith<$Res> {
  __$$LbtcLnV2SwapImplCopyWithImpl(
      _$LbtcLnV2SwapImpl _value, $Res Function(_$LbtcLnV2SwapImpl) _then)
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
    return _then(_$LbtcLnV2SwapImpl(
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
              as LBtcSwapScriptV2Str,
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

class _$LbtcLnV2SwapImpl extends _LbtcLnV2Swap {
  const _$LbtcLnV2SwapImpl(
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
  final LBtcSwapScriptV2Str swapScript;
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
    return 'LbtcLnV2Swap(id: $id, kind: $kind, network: $network, keys: $keys, preimage: $preimage, swapScript: $swapScript, invoice: $invoice, outAmount: $outAmount, scriptAddress: $scriptAddress, blindingKey: $blindingKey, electrumUrl: $electrumUrl, boltzUrl: $boltzUrl, referralId: $referralId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LbtcLnV2SwapImpl &&
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
  _$$LbtcLnV2SwapImplCopyWith<_$LbtcLnV2SwapImpl> get copyWith =>
      __$$LbtcLnV2SwapImplCopyWithImpl<_$LbtcLnV2SwapImpl>(this, _$identity);
}

abstract class _LbtcLnV2Swap extends LbtcLnV2Swap {
  const factory _LbtcLnV2Swap(
      {required final String id,
      required final SwapType kind,
      required final Chain network,
      required final KeyPair keys,
      required final PreImage preimage,
      required final LBtcSwapScriptV2Str swapScript,
      required final String invoice,
      required final int outAmount,
      required final String scriptAddress,
      required final String blindingKey,
      required final String electrumUrl,
      required final String boltzUrl,
      final String? referralId}) = _$LbtcLnV2SwapImpl;
  const _LbtcLnV2Swap._() : super._();

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
  LBtcSwapScriptV2Str get swapScript;
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
  _$$LbtcLnV2SwapImplCopyWith<_$LbtcLnV2SwapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

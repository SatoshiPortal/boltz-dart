// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_definitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BtcLnSwapImpl _$$BtcLnSwapImplFromJson(Map<String, dynamic> json) =>
    _$BtcLnSwapImpl(
      id: json['id'] as String,
      kind: $enumDecode(_$SwapTypeEnumMap, json['kind']),
      network: $enumDecode(_$ChainEnumMap, json['network']),
      keys: KeyPair.fromJson(json['keys'] as Map<String, dynamic>),
      preimage: PreImage.fromJson(json['preimage'] as Map<String, dynamic>),
      redeemScript: json['redeemScript'] as String,
      invoice: json['invoice'] as String,
      scriptAddress: json['scriptAddress'] as String,
      outAmount: json['outAmount'] as int,
      electrumUrl: json['electrumUrl'] as String,
      boltzUrl: json['boltzUrl'] as String,
    );

Map<String, dynamic> _$$BtcLnSwapImplToJson(_$BtcLnSwapImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$SwapTypeEnumMap[instance.kind]!,
      'network': _$ChainEnumMap[instance.network]!,
      'keys': instance.keys,
      'preimage': instance.preimage,
      'redeemScript': instance.redeemScript,
      'invoice': instance.invoice,
      'scriptAddress': instance.scriptAddress,
      'outAmount': instance.outAmount,
      'electrumUrl': instance.electrumUrl,
      'boltzUrl': instance.boltzUrl,
    };

const _$SwapTypeEnumMap = {
  SwapType.Submarine: 'Submarine',
  SwapType.Reverse: 'Reverse',
};

const _$ChainEnumMap = {
  Chain.Testnet: 'Testnet',
  Chain.LiquidTestnet: 'LiquidTestnet',
};

_$KeyPairImpl _$$KeyPairImplFromJson(Map<String, dynamic> json) =>
    _$KeyPairImpl(
      secretKey: json['secretKey'] as String,
      publicKey: json['publicKey'] as String,
    );

Map<String, dynamic> _$$KeyPairImplToJson(_$KeyPairImpl instance) =>
    <String, dynamic>{
      'secretKey': instance.secretKey,
      'publicKey': instance.publicKey,
    };

_$LbtcLnSwapImpl _$$LbtcLnSwapImplFromJson(Map<String, dynamic> json) =>
    _$LbtcLnSwapImpl(
      id: json['id'] as String,
      kind: $enumDecode(_$SwapTypeEnumMap, json['kind']),
      network: $enumDecode(_$ChainEnumMap, json['network']),
      keys: KeyPair.fromJson(json['keys'] as Map<String, dynamic>),
      preimage: PreImage.fromJson(json['preimage'] as Map<String, dynamic>),
      redeemScript: json['redeemScript'] as String,
      invoice: json['invoice'] as String,
      outAmount: json['outAmount'] as int,
      scriptAddress: json['scriptAddress'] as String,
      blindingKey: json['blindingKey'] as String,
      electrumUrl: json['electrumUrl'] as String,
      boltzUrl: json['boltzUrl'] as String,
    );

Map<String, dynamic> _$$LbtcLnSwapImplToJson(_$LbtcLnSwapImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$SwapTypeEnumMap[instance.kind]!,
      'network': _$ChainEnumMap[instance.network]!,
      'keys': instance.keys,
      'preimage': instance.preimage,
      'redeemScript': instance.redeemScript,
      'invoice': instance.invoice,
      'outAmount': instance.outAmount,
      'scriptAddress': instance.scriptAddress,
      'blindingKey': instance.blindingKey,
      'electrumUrl': instance.electrumUrl,
      'boltzUrl': instance.boltzUrl,
    };

_$PreImageImpl _$$PreImageImplFromJson(Map<String, dynamic> json) =>
    _$PreImageImpl(
      value: json['value'] as String,
      sha256: json['sha256'] as String,
      hash160: json['hash160'] as String,
    );

Map<String, dynamic> _$$PreImageImplToJson(_$PreImageImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'sha256': instance.sha256,
      'hash160': instance.hash160,
    };

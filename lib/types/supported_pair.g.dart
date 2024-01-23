// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportedPairImpl _$$SupportedPairImplFromJson(Map<String, dynamic> json) =>
    _$SupportedPairImpl(
      name: json['name'] as String,
      hash: json['hash'] as String,
      rate: json['rate'] as int,
      limits: Limits.fromJson(json['limits'] as Map<String, dynamic>),
      fees: Fees.fromJson(json['fees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SupportedPairImplToJson(_$SupportedPairImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hash': instance.hash,
      'rate': instance.rate,
      'limits': instance.limits,
      'fees': instance.fees,
    };

_$FeesImpl _$$FeesImplFromJson(Map<String, dynamic> json) => _$FeesImpl(
      percentage: (json['percentage'] as num).toDouble(),
      percentageSwapIn: (json['percentageSwapIn'] as num).toDouble(),
      minerFees: MinerFees.fromJson(json['minerFees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeesImplToJson(_$FeesImpl instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'percentageSwapIn': instance.percentageSwapIn,
      'minerFees': instance.minerFees,
    };

_$MinerFeesImpl _$$MinerFeesImplFromJson(Map<String, dynamic> json) =>
    _$MinerFeesImpl(
      baseAsset: EAsset.fromJson(json['baseAsset'] as Map<String, dynamic>),
      quoteAsset: EAsset.fromJson(json['quoteAsset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MinerFeesImplToJson(_$MinerFeesImpl instance) =>
    <String, dynamic>{
      'baseAsset': instance.baseAsset,
      'quoteAsset': instance.quoteAsset,
    };

_$EAssetImpl _$$EAssetImplFromJson(Map<String, dynamic> json) => _$EAssetImpl(
      normal: json['normal'] as int,
      reverse: Reverse.fromJson(json['reverse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EAssetImplToJson(_$EAssetImpl instance) =>
    <String, dynamic>{
      'normal': instance.normal,
      'reverse': instance.reverse,
    };

_$ReverseImpl _$$ReverseImplFromJson(Map<String, dynamic> json) =>
    _$ReverseImpl(
      claim: json['claim'] as int,
      lockup: json['lockup'] as int,
    );

Map<String, dynamic> _$$ReverseImplToJson(_$ReverseImpl instance) =>
    <String, dynamic>{
      'claim': instance.claim,
      'lockup': instance.lockup,
    };

_$LimitsImpl _$$LimitsImplFromJson(Map<String, dynamic> json) => _$LimitsImpl(
      maximal: json['maximal'] as int,
      minimal: json['minimal'] as int,
      maximalZeroConf: MaximalZeroConf.fromJson(
          json['maximalZeroConf'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LimitsImplToJson(_$LimitsImpl instance) =>
    <String, dynamic>{
      'maximal': instance.maximal,
      'minimal': instance.minimal,
      'maximalZeroConf': instance.maximalZeroConf,
    };

_$MaximalZeroConfImpl _$$MaximalZeroConfImplFromJson(
        Map<String, dynamic> json) =>
    _$MaximalZeroConfImpl(
      baseAsset: json['baseAsset'] as int,
      quoteAsset: json['quoteAsset'] as int,
    );

Map<String, dynamic> _$$MaximalZeroConfImplToJson(
        _$MaximalZeroConfImpl instance) =>
    <String, dynamic>{
      'baseAsset': instance.baseAsset,
      'quoteAsset': instance.quoteAsset,
    };

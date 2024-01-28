import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supported_pair.freezed.dart';
part 'supported_pair.g.dart';

SupportedPair supportedPairFromJson(String str) => SupportedPair.fromJson(json.decode(str));

String supportedPairToJson(SupportedPair data) => json.encode(data.toJson());

@freezed
class SupportedPair with _$SupportedPair {
  const factory SupportedPair({
    required String name,
    required String hash,
    required int rate,
    required Limits limits,
    required Fees fees,
  }) = _SupportedPair;

  factory SupportedPair.fromJson(Map<String, dynamic> json) => _$SupportedPairFromJson(json);
}

@freezed
class Fees with _$Fees {
  const factory Fees({
    required double percentage,
    required double percentageSwapIn,
    required MinerFees minerFees,
  }) = _Fees;

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);
}

@freezed
class MinerFees with _$MinerFees {
  const factory MinerFees({
    required EAsset baseAsset,
    required EAsset quoteAsset,
  }) = _MinerFees;

  factory MinerFees.fromJson(Map<String, dynamic> json) => _$MinerFeesFromJson(json);
}

@freezed
class EAsset with _$EAsset {
  const factory EAsset({
    required int normal,
    required Reverse reverse,
  }) = _EAsset;

  factory EAsset.fromJson(Map<String, dynamic> json) => _$EAssetFromJson(json);
}

@freezed
class Reverse with _$Reverse {
  const factory Reverse({
    required int claim,
    required int lockup,
  }) = _Reverse;

  factory Reverse.fromJson(Map<String, dynamic> json) => _$ReverseFromJson(json);
}

@freezed
class Limits with _$Limits {
  const factory Limits({
    required int maximal,
    required int minimal,
    required MaximalZeroConf maximalZeroConf,
  }) = _Limits;

  factory Limits.fromJson(Map<String, dynamic> json) => _$LimitsFromJson(json);
}

@freezed
class MaximalZeroConf with _$MaximalZeroConf {
  const factory MaximalZeroConf({
    required int baseAsset,
    required int quoteAsset,
  }) = _MaximalZeroConf;

  factory MaximalZeroConf.fromJson(Map<String, dynamic> json) => _$MaximalZeroConfFromJson(json);
}

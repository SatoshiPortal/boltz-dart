// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwapStatusResponseImpl _$$SwapStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SwapStatusResponseImpl(
      status: $enumDecode(_$SwapStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$SwapStatusResponseImplToJson(
        _$SwapStatusResponseImpl instance) =>
    <String, dynamic>{
      'status': _$SwapStatusEnumMap[instance.status]!,
    };

const _$SwapStatusEnumMap = {
  SwapStatus.mempool: 'transaction.mempool',
  SwapStatus.claimed: 'transaction.claimed',
  SwapStatus.confirmed: 'transaction.confirmed',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwapStatusResponseImpl _$$SwapStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SwapStatusResponseImpl(
      id: json['id'] as String,
      status: $enumDecode(_$SwapStatusEnumMap, json['status']),
      failureReason: json['failureReason'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$SwapStatusResponseImplToJson(
        _$SwapStatusResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$SwapStatusEnumMap[instance.status]!,
      'failureReason': instance.failureReason,
      'error': instance.error,
    };

const _$SwapStatusEnumMap = {
  SwapStatus.swapCreated: 'swap.created',
  SwapStatus.swapExpired: 'swap.expired',
  SwapStatus.swapRefunded: 'swap.refunded',
  SwapStatus.swapError: 'swap.error',
  SwapStatus.txnMempool: 'transaction.mempool',
  SwapStatus.txnClaimPending: 'transaction.claim.pending',
  SwapStatus.txnClaimed: 'transaction.claimed',
  SwapStatus.txnConfirmed: 'transaction.confirmed',
  SwapStatus.txnRefunded: 'transaction.refunded',
  SwapStatus.txnFailed: 'transaction.failed',
  SwapStatus.txnLockupFailed: 'transaction.lockupFailed',
  SwapStatus.invoiceSet: 'invoice.set',
  SwapStatus.invoicePending: 'invoice.pending',
  SwapStatus.invoicePaid: 'invoice.paid',
  SwapStatus.invoiceFailedToPay: 'invoice.failedToPay',
  SwapStatus.invoiceSettled: 'invoice.settled',
  SwapStatus.invoiceExpired: 'invoice.expired',
  SwapStatus.minerfeePaid: 'minerfee.paid',
};

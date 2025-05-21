// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
      id: json['id'] as String,
      hex: json['hex'] as String,
      eta: (json['eta'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hex': instance.hex,
      'eta': instance.eta,
    };

_SwapStatusResponse _$SwapStatusResponseFromJson(Map<String, dynamic> json) =>
    _SwapStatusResponse(
      status: $enumDecode(_$SwapStatusEnumMap, json['status']),
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      failureReason: json['failureReason'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$SwapStatusResponseToJson(_SwapStatusResponse instance) =>
    <String, dynamic>{
      'status': _$SwapStatusEnumMap[instance.status]!,
      'transaction': instance.transaction,
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
  SwapStatus.txnServerMempool: 'transaction.server.mempool',
  SwapStatus.txnServerConfirmed: 'transaction.server.confirmed',
  SwapStatus.invoiceSet: 'invoice.set',
  SwapStatus.invoicePending: 'invoice.pending',
  SwapStatus.invoicePaid: 'invoice.paid',
  SwapStatus.invoiceFailedToPay: 'invoice.failedToPay',
  SwapStatus.invoiceSettled: 'invoice.settled',
  SwapStatus.invoiceExpired: 'invoice.expired',
  SwapStatus.minerfeePaid: 'minerfee.paid',
};

_SwapStreamStatus _$SwapStreamStatusFromJson(Map<String, dynamic> json) =>
    _SwapStreamStatus(
      id: json['id'] as String,
      status: $enumDecode(_$SwapStatusEnumMap, json['status']),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$SwapStreamStatusToJson(_SwapStreamStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$SwapStatusEnumMap[instance.status]!,
      'error': instance.error,
    };

import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

enum SwapStatus {
  @JsonValue('swap.created')
  swapCreated,

  @JsonValue('swap.expired')
  swapExpired,

  @JsonValue('transaction.mempool')
  mempool,

  @JsonValue('transaction.claimed')
  claimed,

  @JsonValue('transaction.confirmed')
  confirmed,

  @JsonValue('transaction.refunded')
  refunded,

  @JsonValue('transaction.failed')
  failed,

  @JsonValue('invoice.set')
  invoiceSet,

  @JsonValue('invoice.pending')
  invoicePending,

  @JsonValue('invoice.paid')
  invoicePaid,

  @JsonValue('invoice.failedToPay')
  invoiceFailedToPay,

  @JsonValue('invoice.settled')
  invoiceSettled,

  @JsonValue('invoice.expired')
  invoiceExpired,

  @JsonValue('minerfee.paid')
  minerfeePaid,
}

extension SwapStatusX on SwapStatus {
  String toJson() {
    switch (this) {
      case SwapStatus.swapCreated:
        return 'swap.created';
      case SwapStatus.swapExpired:
        return 'swap.expired';

      case SwapStatus.mempool:
        return 'transaction.mempool';
      case SwapStatus.claimed:
        return 'transaction.claimed';
      case SwapStatus.confirmed:
        return 'transaction.confirmed';
      case SwapStatus.refunded:
        return 'transaction.refunded';
      case SwapStatus.failed:
        return 'transaction.failed';

      case SwapStatus.invoiceSet:
        return 'invoice.set';
      case SwapStatus.invoicePending:
        return 'invoice.pending';
      case SwapStatus.invoicePaid:
        return 'invoice.paid';
      case SwapStatus.invoiceFailedToPay:
        return 'invoice.failedToPay';
      case SwapStatus.invoiceSettled:
        return 'invoice.invoiceSettled';
      case SwapStatus.invoiceExpired:
        return 'invoice.expired';

      case SwapStatus.minerfeePaid:
        return 'minerfee.paid';

      default:
        throw ArgumentError('Invalid SwapStatus: $this');
    }
  }
}

SwapStatus getSwapStatusFromString(String statusString) {
  for (var status in SwapStatus.values) {
    if (status.toJson() == statusString) {
      return status;
    }
  }
  throw ArgumentError('Invalid status string: $statusString');
}

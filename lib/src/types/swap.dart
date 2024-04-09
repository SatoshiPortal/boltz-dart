import 'package:freezed_annotation/freezed_annotation.dart';

enum SwapStatus {
  @JsonValue('swap.created')
  swapCreated,

  @JsonValue('swap.expired')
  swapExpired,

  @JsonValue('swap.refunded')
  swapRefunded,

  @JsonValue('swap.error')
  swapError,

  @JsonValue('transaction.mempool')
  txnMempool,

  @JsonValue('transaction.claim.pending')
  txnClaimPending,

  @JsonValue('transaction.claimed')
  txnClaimed,

  @JsonValue('transaction.confirmed')
  txnConfirmed,

  @JsonValue('transaction.refunded')
  txnRefunded,

  @JsonValue('transaction.failed')
  txnFailed,

  @JsonValue('transaction.lockupFailed')
  txnLockupFailed,

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
      case SwapStatus.swapRefunded:
        return 'swap.refunded';
      case SwapStatus.swapError:
        return 'swap.error';

      case SwapStatus.txnMempool:
        return 'transaction.mempool';
      case SwapStatus.txnClaimPending:
        return 'transaction.claim.pending';
      case SwapStatus.txnClaimed:
        return 'transaction.claimed';
      case SwapStatus.txnConfirmed:
        return 'transaction.confirmed';
      case SwapStatus.txnRefunded:
        return 'transaction.refunded';
      case SwapStatus.txnFailed:
        return 'transaction.failed';
      case SwapStatus.txnLockupFailed:
        return 'transaction.lockupFailed';

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

  String get asString {
    switch (this) {
      case SwapStatus.swapCreated:
        return 'Swap created';
      case SwapStatus.swapExpired:
        return 'Swap expired';
      case SwapStatus.swapRefunded:
        return 'Swap refunded';
      case SwapStatus.swapError:
        return 'Swap error';

      case SwapStatus.txnMempool:
        return 'Transaction mempool';
      case SwapStatus.txnClaimPending:
        return 'Transaction claim pending';
      case SwapStatus.txnClaimed:
        return 'Transaction claimed';
      case SwapStatus.txnConfirmed:
        return 'Transaction confirmed';
      case SwapStatus.txnRefunded:
        return 'Transaction refunded';
      case SwapStatus.txnFailed:
        return 'Transaction failed';
      case SwapStatus.txnLockupFailed:
        return 'Transaction lockup failed';

      case SwapStatus.invoiceSet:
        return 'Invoice set';
      case SwapStatus.invoicePending:
        return 'Invoice pending';
      case SwapStatus.invoicePaid:
        return 'Invoice paid';
      case SwapStatus.invoiceFailedToPay:
        return 'Invoice failed to pay';
      case SwapStatus.invoiceSettled:
        return 'Invoice invoice settled';
      case SwapStatus.invoiceExpired:
        return 'Invoice expired';

      case SwapStatus.minerfeePaid:
        return 'Minerfee paid';

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

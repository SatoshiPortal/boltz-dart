import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

enum SwapStatus {
  @JsonValue('transaction.mempool')
  mempool,

  @JsonValue('transaction.claimed')
  claimed,

  @JsonValue('transaction.confirmed')
  confirmed,
}

extension SwapStatusX on SwapStatus {
  String toJson() {
    switch (this) {
      case SwapStatus.mempool:
        return 'transaction.mempool';
      case SwapStatus.claimed:
        return 'transaction.claimed';
      case SwapStatus.confirmed:
        return 'transaction.confirmed';
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

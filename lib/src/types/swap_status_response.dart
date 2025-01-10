// import 'dart:convert';
import 'package:boltz/src/types/swap.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swap_status_response.freezed.dart';
part 'swap_status_response.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String hex,
    int? eta,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
class SwapStatusResponse with _$SwapStatusResponse {
  const factory SwapStatusResponse({
    required SwapStatus status,
    Transaction? transaction,
    String? failureReason,
    String? error,
  }) = _SwapStatusResponse;

  factory SwapStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SwapStatusResponseFromJson(json);
}

@freezed
class SwapStreamStatus with _$SwapStreamStatus {
  const factory SwapStreamStatus({
    required String id,
    required SwapStatus status,
    String? error,
  }) = _SwapStreamStatus;

  factory SwapStreamStatus.fromJson(Map<String, dynamic> json) =>
      _$SwapStreamStatusFromJson(json);
}

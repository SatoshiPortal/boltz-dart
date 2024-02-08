import 'dart:convert';
import 'package:boltz_dart/src/types/swap.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swap_status_response.freezed.dart';
part 'swap_status_response.g.dart';

// SwapStatusResponse swapStatusResponseFromJson(String str) =>
//     SwapStatusResponse.fromJson(json.decode(str));

// String swapStatusResponseToJson(SwapStatusResponse data) => json.encode(data.toJson());

@freezed
class SwapStatusResponse with _$SwapStatusResponse {
  const factory SwapStatusResponse({
    required SwapStatus status,
  }) = _SwapStatusResponse;

  factory SwapStatusResponse.fromJson(Map<String, dynamic> json) => _$SwapStatusResponseFromJson(json);
}

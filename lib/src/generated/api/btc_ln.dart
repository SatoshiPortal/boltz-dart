// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'error.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'types.dart';
part 'btc_ln.freezed.dart';

// These functions are ignored because they are not marked as `pub`: `extract_id`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `assert_receiver_is_total_eq`, `clone`, `eq`

/// Bitcoin-Lightning Swap Class
@freezed
class BtcLnSwap with _$BtcLnSwap {
  const BtcLnSwap._();
  const factory BtcLnSwap({
    required String id,
    required SwapType kind,
    required Chain network,
    required KeyPair keys,
    required BigInt keyIndex,
    required PreImage preimage,
    required BtcSwapScriptStr swapScript,
    required String invoice,
    required String scriptAddress,
    required BigInt outAmount,
    required String electrumUrl,
    required String boltzUrl,
    String? referralId,
  }) = _BtcLnSwap;

  /// Broadcast using boltz's electrum server
  Future<String> broadcastBoltz({required String signedHex}) => BoltzCore
      .instance.api
      .crateApiBtcLnBtcLnSwapBroadcastBoltz(that: this, signedHex: signedHex);

  /// Broadcast using your own electrum server that was used to create the swap
  Future<String> broadcastLocal({required String signedHex}) => BoltzCore
      .instance.api
      .crateApiBtcLnBtcLnSwapBroadcastLocal(that: this, signedHex: signedHex);

  /// Used to claim a reverse swap.
  Future<String> claim(
          {required String outAddress,
          required TxFee minerFee,
          required bool tryCooperate}) =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapClaim(
          that: this,
          outAddress: outAddress,
          minerFee: minerFee,
          tryCooperate: tryCooperate);

  /// After boltz completes a submarine swap, call this function to close the swap cooperatively using Musig.
  /// If this function is not called within ~1 hour, the swap will be closed via the script path.
  /// The benefit of a cooperative close is that the onchain footprint is smaller and makes the transaction look like a single sig tx, while the script path spend is clearly a swap tx.
  Future<void> coopCloseSubmarine() =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapCoopCloseSubmarine(
        that: this,
      );

  /// Parse from a JSON string.
  static Future<BtcLnSwap> fromJson({required String jsonStr}) =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapFromJson(jsonStr: jsonStr);

  /// Process swap based on status
  /// To be used with WebSocket Notification Stream
  Future<(SwapAction, SwapState)> getAction({required String status}) =>
      BoltzCore.instance.api
          .crateApiBtcLnBtcLnSwapGetAction(that: this, status: status);

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  /// Manually create the class. Primarily used when recovering a swap.
  static Future<BtcLnSwap> newInstance(
          {required String id,
          required SwapType kind,
          required Chain network,
          required KeyPair keys,
          required BigInt keyIndex,
          required PreImage preimage,
          required BtcSwapScriptStr swapScript,
          required String invoice,
          required String scriptAddress,
          required BigInt outAmount,
          required String electrumUrl,
          required String boltzUrl,
          String? referralId}) =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapNew(
          id: id,
          kind: kind,
          network: network,
          keys: keys,
          keyIndex: keyIndex,
          preimage: preimage,
          swapScript: swapScript,
          invoice: invoice,
          scriptAddress: scriptAddress,
          outAmount: outAmount,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
          referralId: referralId);

  /// Used to create the class when starting a reverse swap to receive Bitcoin via Lightning.
  /// Note: The mnemonic should be your wallets mnemonic, the library will derive the keys for the swap from the appropriate path.
  /// The client is expected to manage (increment) the use of index to ensure keys are not reused.
  static Future<BtcLnSwap> newReverse(
          {required String mnemonic,
          required BigInt index,
          required BigInt outAmount,
          String? outAddress,
          required Chain network,
          required String electrumUrl,
          required String boltzUrl,
          String? description,
          String? referralId}) =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapNewReverse(
          mnemonic: mnemonic,
          index: index,
          outAmount: outAmount,
          outAddress: outAddress,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
          description: description,
          referralId: referralId);

  /// Used to create the class when starting a submarine swap to pay a lightning invoice with Bitcoin.
  /// Note: The mnemonic should be your wallets mnemonic, the library will derive the keys for the swap from the appropriate path.
  /// The client is expected to manage (increment) the use of index to ensure keys are not reused.
  static Future<BtcLnSwap> newSubmarine(
          {required String mnemonic,
          required BigInt index,
          required String invoice,
          required Chain network,
          required String electrumUrl,
          required String boltzUrl,
          String? referralId}) =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapNewSubmarine(
          mnemonic: mnemonic,
          index: index,
          invoice: invoice,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
          referralId: referralId);

  /// Used to refund a failed submarine swap.
  Future<String> refund(
          {required String outAddress,
          required TxFee minerFee,
          required bool tryCooperate}) =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapRefund(
          that: this,
          outAddress: outAddress,
          minerFee: minerFee,
          tryCooperate: tryCooperate);

  /// Convert instance to a JSON string.
  Future<String> toJson() =>
      BoltzCore.instance.api.crateApiBtcLnBtcLnSwapToJson(
        that: this,
      );

  /// Get the size of the transaction. Can be used to estimate the absolute miner fees required, given a fee rate.
  Future<BigInt> txSize({required bool isCooperative}) => BoltzCore.instance.api
      .crateApiBtcLnBtcLnSwapTxSize(that: this, isCooperative: isCooperative);
}

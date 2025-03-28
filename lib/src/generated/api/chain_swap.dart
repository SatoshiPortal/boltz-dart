// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'error.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'types.dart';
part 'chain_swap.freezed.dart';

// These functions are ignored because they are not marked as `pub`: `extract_id`, `get_network`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `assert_receiver_is_total_eq`, `clone`, `eq`

/// Bitcoin-Liquid Swap Class
@freezed
class ChainSwap with _$ChainSwap {
  const ChainSwap._();
  const factory ChainSwap({
    required String id,
    required bool isTestnet,
    required ChainSwapDirection direction,
    required KeyPair refundKeys,
    required BigInt refundIndex,
    required KeyPair claimKeys,
    required BigInt claimIndex,
    required PreImage preimage,
    required BtcSwapScriptStr btcScriptStr,
    required LBtcSwapScriptStr lbtcScriptStr,
    required String scriptAddress,
    required BigInt outAmount,
    required String btcElectrumUrl,
    required String lbtcElectrumUrl,
    required String boltzUrl,
    String? referralId,
    required String blindingKey,
  }) = _ChainSwap;

  /// Broadcast a signed transaction using boltz's electrum server
  Future<String> broadcastBoltz(
          {required String signedHex, required SwapTxKind kind}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapBroadcastBoltz(
          that: this, signedHex: signedHex, kind: kind);

  /// Broadcast a signed transaction via your own electrum server used when the swap was created.
  Future<String> broadcastLocal(
          {required String signedHex, required SwapTxKind kind}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapBroadcastLocal(
          that: this, signedHex: signedHex, kind: kind);

  /// Claim a successful swap
  Future<String> claim(
          {required String outAddress,
          required String refundAddress,
          required TxFee minerFee,
          required bool tryCooperate}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapClaim(
          that: this,
          outAddress: outAddress,
          refundAddress: refundAddress,
          minerFee: minerFee,
          tryCooperate: tryCooperate);

  /// Parse from a JSON string.
  static Future<ChainSwap> fromJson({required String jsonStr}) =>
      BoltzCore.instance.api
          .crateApiChainSwapChainSwapFromJson(jsonStr: jsonStr);

  /// Get the transaction id of the server's lockup transaction
  Future<String> getServerLockup() =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapGetServerLockup(
        that: this,
      );

  /// Get the transaction id of the user's lockup transaction
  Future<String> getUserLockup() =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapGetUserLockup(
        that: this,
      );

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  /// Manually create the class. Primarily used when recovering a swap.
  static Future<ChainSwap> newInstance(
          {required String id,
          required bool isTestnet,
          required ChainSwapDirection direction,
          required KeyPair refundKeys,
          required BigInt refundIndex,
          required KeyPair claimKeys,
          required BigInt claimIndex,
          required PreImage preimage,
          required BtcSwapScriptStr btcScriptStr,
          required LBtcSwapScriptStr lbtcScriptStr,
          required String scriptAddress,
          required BigInt outAmount,
          required String btcElectrumUrl,
          required String lbtcElectrumUrl,
          required String boltzUrl,
          String? referralId,
          required String blindingKey}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapNew(
          id: id,
          isTestnet: isTestnet,
          direction: direction,
          refundKeys: refundKeys,
          refundIndex: refundIndex,
          claimKeys: claimKeys,
          claimIndex: claimIndex,
          preimage: preimage,
          btcScriptStr: btcScriptStr,
          lbtcScriptStr: lbtcScriptStr,
          scriptAddress: scriptAddress,
          outAmount: outAmount,
          btcElectrumUrl: btcElectrumUrl,
          lbtcElectrumUrl: lbtcElectrumUrl,
          boltzUrl: boltzUrl,
          referralId: referralId,
          blindingKey: blindingKey);

  /// Used to create the class when starting a chain swap between Bitcoin and Liquid.
  /// Note: The mnemonic should be your wallets mnemonic, the library will derive the keys for the swap from the appropriate path.
  /// The client is expected to manage (increment) the use of index to ensure keys are not reused.
  static Future<ChainSwap> newSwap(
          {required ChainSwapDirection direction,
          required String mnemonic,
          String? passphrase,
          required BigInt index,
          required BigInt amount,
          required bool isTestnet,
          required String btcElectrumUrl,
          required String lbtcElectrumUrl,
          required String boltzUrl,
          String? referralId}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapNewSwap(
          direction: direction,
          mnemonic: mnemonic,
          passphrase: passphrase,
          index: index,
          amount: amount,
          isTestnet: isTestnet,
          btcElectrumUrl: btcElectrumUrl,
          lbtcElectrumUrl: lbtcElectrumUrl,
          boltzUrl: boltzUrl,
          referralId: referralId);

  /// Refund a failed swap
  Future<String> refund(
          {required String refundAddress,
          required TxFee minerFee,
          required bool tryCooperate}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapRefund(
          that: this,
          refundAddress: refundAddress,
          minerFee: minerFee,
          tryCooperate: tryCooperate);

  /// Convert instance to a JSON string.
  Future<String> toJson() =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapToJson(
        that: this,
      );
}

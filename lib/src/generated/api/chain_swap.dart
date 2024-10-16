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
  Future<String> broadcastBoltz(
          {required String signedHex, required SwapTxKind kind}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapBroadcastBoltz(
          that: this, signedHex: signedHex, kind: kind);

  Future<String> broadcastLocal(
          {required String signedHex, required SwapTxKind kind}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapBroadcastLocal(
          that: this, signedHex: signedHex, kind: kind);

  Future<String> claim(
          {required String outAddress,
          required String refundAddress,
          required BigInt absFee,
          required bool tryCooperate}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapClaim(
          that: this,
          outAddress: outAddress,
          refundAddress: refundAddress,
          absFee: absFee,
          tryCooperate: tryCooperate);

  Future<String> getServerLockup() =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapGetServerLockup(
        that: this,
      );

  Future<String> getUserLockup() =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapGetUserLockup(
        that: this,
      );

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
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

  static Future<ChainSwap> newSwap(
          {required ChainSwapDirection direction,
          required String mnemonic,
          required BigInt index,
          required int amount,
          required bool isTestnet,
          required String btcElectrumUrl,
          required String lbtcElectrumUrl,
          required String boltzUrl,
          String? referralId}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapNewSwap(
          direction: direction,
          mnemonic: mnemonic,
          index: index,
          amount: amount,
          isTestnet: isTestnet,
          btcElectrumUrl: btcElectrumUrl,
          lbtcElectrumUrl: lbtcElectrumUrl,
          boltzUrl: boltzUrl,
          referralId: referralId);

  Future<String> refund(
          {required String refundAddress,
          required BigInt absFee,
          required bool tryCooperate}) =>
      BoltzCore.instance.api.crateApiChainSwapChainSwapRefund(
          that: this,
          refundAddress: refundAddress,
          absFee: absFee,
          tryCooperate: tryCooperate);
}

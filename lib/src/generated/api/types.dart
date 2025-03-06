// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'error.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'types.freezed.dart';

// These types are ignored because they are not used by any `pub` functions: `SwapState`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `fmt`, `fmt`, `from`, `from`, `from`, `from`, `from`, `into`, `into`, `into`, `into`, `into`, `into`, `try_into`, `try_into`, `try_into`, `try_into`

/// LNURL helper to validate an lnurl string
Future<bool> validateLnurl({required String lnurl}) =>
    BoltzCore.instance.api.crateApiTypesValidateLnurl(lnurl: lnurl);

/// LNURL helper to get an invoice from an lnurl string
Future<String> invoiceFromLnurl(
        {required String lnurl, required BigInt msats}) =>
    BoltzCore.instance.api
        .crateApiTypesInvoiceFromLnurl(lnurl: lnurl, msats: msats);

/// LNURL helper to get an lnurl-w voucher amount
Future<BigInt> getVoucherMaxAmount({required String lnurl}) =>
    BoltzCore.instance.api.crateApiTypesGetVoucherMaxAmount(lnurl: lnurl);

/// LNURL helper to claim an lnurl-w
Future<void> withdraw({required String lnurl, required String invoice}) =>
    BoltzCore.instance.api
        .crateApiTypesWithdraw(lnurl: lnurl, invoice: invoice);

/// Helper to store a BtcSwapScript and convert to a BtcSwapScript
@freezed
class BtcSwapScriptStr with _$BtcSwapScriptStr {
  const BtcSwapScriptStr._();
  const factory BtcSwapScriptStr({
    required SwapType swapType,
    String? fundingAddrs,
    required String hashlock,
    required String receiverPubkey,
    required int locktime,
    required String senderPubkey,
    Side? side,
  }) = _BtcSwapScriptStr;
  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<BtcSwapScriptStr> newInstance(
          {required SwapType swapType,
          String? fundingAddrs,
          required String hashlock,
          required String receiverPubkey,
          required int locktime,
          required String senderPubkey,
          Side? side}) =>
      BoltzCore.instance.api.crateApiTypesBtcSwapScriptStrNew(
          swapType: swapType,
          fundingAddrs: fundingAddrs,
          hashlock: hashlock,
          receiverPubkey: receiverPubkey,
          locktime: locktime,
          senderPubkey: senderPubkey,
          side: side);
}

enum Chain {
  bitcoin,
  bitcoinTestnet,
  liquid,
  liquidTestnet,
  ;
}

enum ChainSwapDirection {
  btcToLbtc,
  lbtcToBtc,
  ;
}

/// Helper to handle Lightning invoices
@freezed
class DecodedInvoice with _$DecodedInvoice {
  const DecodedInvoice._();
  const factory DecodedInvoice({
    required BigInt msats,
    required BigInt expiry,
    required BigInt expiresIn,
    required BigInt expiresAt,
    required bool isExpired,
    required String network,
    required BigInt cltvExpDelta,
    String? bip21,
    required String preimageHash,
  }) = _DecodedInvoice;

  /// Add boltz_url & chain for route hint check
  static Future<DecodedInvoice> fromString(
          {required String s, String? boltzUrl}) =>
      BoltzCore.instance.api
          .crateApiTypesDecodedInvoiceFromString(s: s, boltzUrl: boltzUrl);
}

@freezed
class KeyPair with _$KeyPair {
  const KeyPair._();
  const factory KeyPair({
    required String secretKey,
    required String publicKey,
  }) = _KeyPair;

  /// Used internally to create a KeyPair for swaps
  static Future<KeyPair> generate(
          {required String mnemonic,
          required Chain network,
          required BigInt index,
          required SwapType swapType}) =>
      BoltzCore.instance.api.crateApiTypesKeyPairGenerate(
          mnemonic: mnemonic,
          network: network,
          index: index,
          swapType: swapType);

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  /// Used internally to create a KeyPair for swaps
  static Future<KeyPair> newInstance(
          {required String secretKey, required String publicKey}) =>
      BoltzCore.instance.api
          .crateApiTypesKeyPairNew(secretKey: secretKey, publicKey: publicKey);
}

/// Helper to store a LBtcSwapScript and convert to a LBtcSwapScript
@freezed
class LBtcSwapScriptStr with _$LBtcSwapScriptStr {
  const LBtcSwapScriptStr._();
  const factory LBtcSwapScriptStr({
    required SwapType swapType,
    String? fundingAddrs,
    required String hashlock,
    required String receiverPubkey,
    required int locktime,
    required String senderPubkey,
    required String blindingKey,
    Side? side,
  }) = _LBtcSwapScriptStr;
  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<LBtcSwapScriptStr> newInstance(
          {required SwapType swapType,
          String? fundingAddrs,
          required String hashlock,
          required String receiverPubkey,
          required int locktime,
          required String senderPubkey,
          required String blindingKey,
          Side? side}) =>
      BoltzCore.instance.api.crateApiTypesLBtcSwapScriptStrNew(
          swapType: swapType,
          fundingAddrs: fundingAddrs,
          hashlock: hashlock,
          receiverPubkey: receiverPubkey,
          locktime: locktime,
          senderPubkey: senderPubkey,
          blindingKey: blindingKey,
          side: side);
}

/// Used internally to create a secret - PreImage for swaps
@freezed
class PreImage with _$PreImage {
  const PreImage._();
  const factory PreImage({
    required String value,
    required String sha256,
    required String hash160,
  }) = _PreImage;
  static Future<PreImage> generate() =>
      BoltzCore.instance.api.crateApiTypesPreImageGenerate();

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<PreImage> newInstance(
          {required String value,
          required String sha256,
          required String hash160}) =>
      BoltzCore.instance.api.crateApiTypesPreImageNew(
          value: value, sha256: sha256, hash160: hash160);
}

/// Used for chain-swaps only. The side is based on which transaction is being made by the user.
/// When a swap is created the user must first make a Lockup.
/// Once the swap is completed, the user must make a Claim.
enum Side {
  lockup,
  claim,
  ;
}

enum SwapAction {
  wait,
  coopSign,
  claim,
  refund,
  close,
  ;
}

enum SwapTxKind {
  claim,
  refund,
  ;
}

enum SwapType {
  submarine,
  reverse,
  chain,
  ;
}

@freezed
sealed class TxFee with _$TxFee {
  const TxFee._();

  const factory TxFee.absolute(
    BigInt field0,
  ) = TxFee_Absolute;
  const factory TxFee.relative(
    double field0,
  ) = TxFee_Relative;
}

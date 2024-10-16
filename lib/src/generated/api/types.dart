// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'error.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'types.freezed.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `assert_receiver_is_total_eq`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `clone`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `eq`, `fmt`, `fmt`, `from`, `from`, `from`, `from`, `from`, `into`, `into`, `into`, `into`, `into`, `try_into`, `try_into`, `try_into`, `try_into`

Future<bool> validateLnurl({required String lnurl}) =>
    BoltzCore.instance.api.crateApiTypesValidateLnurl(lnurl: lnurl);

Future<String> invoiceFromLnurl(
        {required String lnurl, required BigInt msats}) =>
    BoltzCore.instance.api
        .crateApiTypesInvoiceFromLnurl(lnurl: lnurl, msats: msats);

Future<BigInt> getVoucherMaxAmount({required String lnurl}) =>
    BoltzCore.instance.api.crateApiTypesGetVoucherMaxAmount(lnurl: lnurl);

Future<void> withdraw({required String lnurl, required String invoice}) =>
    BoltzCore.instance.api
        .crateApiTypesWithdraw(lnurl: lnurl, invoice: invoice);

@freezed
class BtcSwapScriptStr with _$BtcSwapScriptStr {
  const BtcSwapScriptStr._();
  const factory BtcSwapScriptStr.raw({
    required SwapType swapType,
    String? fundingAddrs,
    required String hashlock,
    required String receiverPubkey,
    required int locktime,
    required String senderPubkey,
    Side? side,
  }) = _BtcSwapScriptStr;
  factory BtcSwapScriptStr(
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
  const factory KeyPair.raw({
    required String secretKey,
    required String publicKey,
  }) = _KeyPair;
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

  factory KeyPair({required String secretKey, required String publicKey}) =>
      BoltzCore.instance.api
          .crateApiTypesKeyPairNew(secretKey: secretKey, publicKey: publicKey);
}

@freezed
class LBtcSwapScriptStr with _$LBtcSwapScriptStr {
  const LBtcSwapScriptStr._();
  const factory LBtcSwapScriptStr.raw({
    required SwapType swapType,
    String? fundingAddrs,
    required String hashlock,
    required String receiverPubkey,
    required int locktime,
    required String senderPubkey,
    required String blindingKey,
    Side? side,
  }) = _LBtcSwapScriptStr;
  factory LBtcSwapScriptStr(
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

@freezed
class PreImage with _$PreImage {
  const PreImage._();
  const factory PreImage.raw({
    required String value,
    required String sha256,
    required String hash160,
  }) = _PreImage;
  static Future<PreImage> generate() =>
      BoltzCore.instance.api.crateApiTypesPreImageGenerate();

  factory PreImage(
          {required String value,
          required String sha256,
          required String hash160}) =>
      BoltzCore.instance.api.crateApiTypesPreImageNew(
          value: value, sha256: sha256, hash160: hash160);
}

enum Side {
  lockup,
  claim,
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

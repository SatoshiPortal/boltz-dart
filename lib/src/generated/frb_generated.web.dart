// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.31.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/btc_ln.dart';
import 'api/error.dart';
import 'api/lbtc_ln.dart';
import 'api/types.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';

abstract class BoltzCoreApiImplPlatform extends BaseApiImpl<BoltzCoreWire> {
  BoltzCoreApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  AllFees dco_decode_all_fees(dynamic raw);

  @protected
  BoltzError dco_decode_boltz_error(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  BtcLnV1Swap dco_decode_box_autoadd_btc_ln_v_1_swap(dynamic raw);

  @protected
  BtcLnV2Swap dco_decode_box_autoadd_btc_ln_v_2_swap(dynamic raw);

  @protected
  BtcSwapScriptV2Str dco_decode_box_autoadd_btc_swap_script_v_2_str(
      dynamic raw);

  @protected
  KeyPair dco_decode_box_autoadd_key_pair(dynamic raw);

  @protected
  LBtcSwapScriptV2Str dco_decode_box_autoadd_l_btc_swap_script_v_2_str(
      dynamic raw);

  @protected
  LbtcLnV1Swap dco_decode_box_autoadd_lbtc_ln_v_1_swap(dynamic raw);

  @protected
  LbtcLnV2Swap dco_decode_box_autoadd_lbtc_ln_v_2_swap(dynamic raw);

  @protected
  PreImage dco_decode_box_autoadd_pre_image(dynamic raw);

  @protected
  BtcLnV1Swap dco_decode_btc_ln_v_1_swap(dynamic raw);

  @protected
  BtcLnV2Swap dco_decode_btc_ln_v_2_swap(dynamic raw);

  @protected
  BtcSwapScriptV2Str dco_decode_btc_swap_script_v_2_str(dynamic raw);

  @protected
  Chain dco_decode_chain(dynamic raw);

  @protected
  DecodedInvoice dco_decode_decoded_invoice(dynamic raw);

  @protected
  double dco_decode_f_64(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  KeyPair dco_decode_key_pair(dynamic raw);

  @protected
  LBtcSwapScriptV2Str dco_decode_l_btc_swap_script_v_2_str(dynamic raw);

  @protected
  LbtcLnV1Swap dco_decode_lbtc_ln_v_1_swap(dynamic raw);

  @protected
  LbtcLnV2Swap dco_decode_lbtc_ln_v_2_swap(dynamic raw);

  @protected
  Limits dco_decode_limits(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  PreImage dco_decode_pre_image(dynamic raw);

  @protected
  ReverseSwapFees dco_decode_reverse_swap_fees(dynamic raw);

  @protected
  SubmarineSwapFees dco_decode_submarine_swap_fees(dynamic raw);

  @protected
  SwapType dco_decode_swap_type(dynamic raw);

  @protected
  int dco_decode_u_32(dynamic raw);

  @protected
  int dco_decode_u_64(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  int dco_decode_usize(dynamic raw);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  AllFees sse_decode_all_fees(SseDeserializer deserializer);

  @protected
  BoltzError sse_decode_boltz_error(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  BtcLnV1Swap sse_decode_box_autoadd_btc_ln_v_1_swap(
      SseDeserializer deserializer);

  @protected
  BtcLnV2Swap sse_decode_box_autoadd_btc_ln_v_2_swap(
      SseDeserializer deserializer);

  @protected
  BtcSwapScriptV2Str sse_decode_box_autoadd_btc_swap_script_v_2_str(
      SseDeserializer deserializer);

  @protected
  KeyPair sse_decode_box_autoadd_key_pair(SseDeserializer deserializer);

  @protected
  LBtcSwapScriptV2Str sse_decode_box_autoadd_l_btc_swap_script_v_2_str(
      SseDeserializer deserializer);

  @protected
  LbtcLnV1Swap sse_decode_box_autoadd_lbtc_ln_v_1_swap(
      SseDeserializer deserializer);

  @protected
  LbtcLnV2Swap sse_decode_box_autoadd_lbtc_ln_v_2_swap(
      SseDeserializer deserializer);

  @protected
  PreImage sse_decode_box_autoadd_pre_image(SseDeserializer deserializer);

  @protected
  BtcLnV1Swap sse_decode_btc_ln_v_1_swap(SseDeserializer deserializer);

  @protected
  BtcLnV2Swap sse_decode_btc_ln_v_2_swap(SseDeserializer deserializer);

  @protected
  BtcSwapScriptV2Str sse_decode_btc_swap_script_v_2_str(
      SseDeserializer deserializer);

  @protected
  Chain sse_decode_chain(SseDeserializer deserializer);

  @protected
  DecodedInvoice sse_decode_decoded_invoice(SseDeserializer deserializer);

  @protected
  double sse_decode_f_64(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  KeyPair sse_decode_key_pair(SseDeserializer deserializer);

  @protected
  LBtcSwapScriptV2Str sse_decode_l_btc_swap_script_v_2_str(
      SseDeserializer deserializer);

  @protected
  LbtcLnV1Swap sse_decode_lbtc_ln_v_1_swap(SseDeserializer deserializer);

  @protected
  LbtcLnV2Swap sse_decode_lbtc_ln_v_2_swap(SseDeserializer deserializer);

  @protected
  Limits sse_decode_limits(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  PreImage sse_decode_pre_image(SseDeserializer deserializer);

  @protected
  ReverseSwapFees sse_decode_reverse_swap_fees(SseDeserializer deserializer);

  @protected
  SubmarineSwapFees sse_decode_submarine_swap_fees(
      SseDeserializer deserializer);

  @protected
  SwapType sse_decode_swap_type(SseDeserializer deserializer);

  @protected
  int sse_decode_u_32(SseDeserializer deserializer);

  @protected
  int sse_decode_u_64(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_usize(SseDeserializer deserializer);

  @protected
  String cst_encode_String(String raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return raw;
  }

  @protected
  List<dynamic> cst_encode_all_fees(AllFees raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_limits(raw.btcLimits),
      cst_encode_limits(raw.lbtcLimits),
      cst_encode_submarine_swap_fees(raw.btcSubmarine),
      cst_encode_reverse_swap_fees(raw.btcReverse),
      cst_encode_submarine_swap_fees(raw.lbtcSubmarine),
      cst_encode_reverse_swap_fees(raw.lbtcReverse),
      cst_encode_String(raw.btcPairHash),
      cst_encode_String(raw.lbtcPairHash)
    ];
  }

  @protected
  List<dynamic> cst_encode_boltz_error(BoltzError raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [cst_encode_String(raw.kind), cst_encode_String(raw.message)];
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_btc_ln_v_1_swap(BtcLnV1Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_btc_ln_v_1_swap(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_btc_ln_v_2_swap(BtcLnV2Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_btc_ln_v_2_swap(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_btc_swap_script_v_2_str(
      BtcSwapScriptV2Str raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_btc_swap_script_v_2_str(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_key_pair(KeyPair raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_key_pair(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_l_btc_swap_script_v_2_str(
      LBtcSwapScriptV2Str raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_l_btc_swap_script_v_2_str(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_lbtc_ln_v_1_swap(LbtcLnV1Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_lbtc_ln_v_1_swap(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_lbtc_ln_v_2_swap(LbtcLnV2Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_lbtc_ln_v_2_swap(raw);
  }

  @protected
  List<dynamic> cst_encode_box_autoadd_pre_image(PreImage raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return cst_encode_pre_image(raw);
  }

  @protected
  List<dynamic> cst_encode_btc_ln_v_1_swap(BtcLnV1Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_String(raw.id),
      cst_encode_swap_type(raw.kind),
      cst_encode_chain(raw.network),
      cst_encode_key_pair(raw.keys),
      cst_encode_pre_image(raw.preimage),
      cst_encode_String(raw.redeemScript),
      cst_encode_String(raw.invoice),
      cst_encode_String(raw.scriptAddress),
      cst_encode_u_64(raw.outAmount),
      cst_encode_String(raw.electrumUrl),
      cst_encode_String(raw.boltzUrl)
    ];
  }

  @protected
  List<dynamic> cst_encode_btc_ln_v_2_swap(BtcLnV2Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_String(raw.id),
      cst_encode_swap_type(raw.kind),
      cst_encode_chain(raw.network),
      cst_encode_key_pair(raw.keys),
      cst_encode_pre_image(raw.preimage),
      cst_encode_btc_swap_script_v_2_str(raw.swapScript),
      cst_encode_String(raw.invoice),
      cst_encode_String(raw.scriptAddress),
      cst_encode_u_64(raw.outAmount),
      cst_encode_String(raw.electrumUrl),
      cst_encode_String(raw.boltzUrl)
    ];
  }

  @protected
  List<dynamic> cst_encode_btc_swap_script_v_2_str(BtcSwapScriptV2Str raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_swap_type(raw.swapType),
      cst_encode_opt_String(raw.fundingAddrs),
      cst_encode_String(raw.hashlock),
      cst_encode_String(raw.receiverPubkey),
      cst_encode_u_32(raw.locktime),
      cst_encode_String(raw.senderPubkey)
    ];
  }

  @protected
  List<dynamic> cst_encode_decoded_invoice(DecodedInvoice raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_u_64(raw.msats),
      cst_encode_u_64(raw.expiry),
      cst_encode_u_64(raw.expiresIn),
      cst_encode_u_64(raw.expiresAt),
      cst_encode_bool(raw.isExpired),
      cst_encode_String(raw.network),
      cst_encode_u_64(raw.cltvExpDelta)
    ];
  }

  @protected
  List<dynamic> cst_encode_key_pair(KeyPair raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [cst_encode_String(raw.secretKey), cst_encode_String(raw.publicKey)];
  }

  @protected
  List<dynamic> cst_encode_l_btc_swap_script_v_2_str(LBtcSwapScriptV2Str raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_swap_type(raw.swapType),
      cst_encode_opt_String(raw.fundingAddrs),
      cst_encode_String(raw.hashlock),
      cst_encode_String(raw.receiverPubkey),
      cst_encode_u_32(raw.locktime),
      cst_encode_String(raw.senderPubkey),
      cst_encode_String(raw.blindingKey)
    ];
  }

  @protected
  List<dynamic> cst_encode_lbtc_ln_v_1_swap(LbtcLnV1Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_String(raw.id),
      cst_encode_swap_type(raw.kind),
      cst_encode_chain(raw.network),
      cst_encode_key_pair(raw.keys),
      cst_encode_pre_image(raw.preimage),
      cst_encode_String(raw.redeemScript),
      cst_encode_String(raw.invoice),
      cst_encode_u_64(raw.outAmount),
      cst_encode_String(raw.scriptAddress),
      cst_encode_String(raw.blindingKey),
      cst_encode_String(raw.electrumUrl),
      cst_encode_String(raw.boltzUrl)
    ];
  }

  @protected
  List<dynamic> cst_encode_lbtc_ln_v_2_swap(LbtcLnV2Swap raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_String(raw.id),
      cst_encode_swap_type(raw.kind),
      cst_encode_chain(raw.network),
      cst_encode_key_pair(raw.keys),
      cst_encode_pre_image(raw.preimage),
      cst_encode_l_btc_swap_script_v_2_str(raw.swapScript),
      cst_encode_String(raw.invoice),
      cst_encode_u_64(raw.outAmount),
      cst_encode_String(raw.scriptAddress),
      cst_encode_String(raw.blindingKey),
      cst_encode_String(raw.electrumUrl),
      cst_encode_String(raw.boltzUrl)
    ];
  }

  @protected
  List<dynamic> cst_encode_limits(Limits raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [cst_encode_u_64(raw.minimal), cst_encode_u_64(raw.maximal)];
  }

  @protected
  Uint8List cst_encode_list_prim_u_8_strict(Uint8List raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return raw;
  }

  @protected
  String? cst_encode_opt_String(String? raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return raw == null ? null : cst_encode_String(raw);
  }

  @protected
  List<dynamic> cst_encode_pre_image(PreImage raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_String(raw.value),
      cst_encode_String(raw.sha256),
      cst_encode_String(raw.hash160)
    ];
  }

  @protected
  List<dynamic> cst_encode_reverse_swap_fees(ReverseSwapFees raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_f_64(raw.boltzFeesRate),
      cst_encode_u_64(raw.lockupFees),
      cst_encode_u_64(raw.claimFeesEstimate)
    ];
  }

  @protected
  List<dynamic> cst_encode_submarine_swap_fees(SubmarineSwapFees raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return [
      cst_encode_f_64(raw.boltzFeesRate),
      cst_encode_u_64(raw.claimFees),
      cst_encode_u_64(raw.lockupFeesEstimate)
    ];
  }

  @protected
  Object cst_encode_u_64(int raw) {
    // Codec=Cst (C-struct based), see doc to use other codecs
    return castNativeBigInt(raw);
  }

  @protected
  bool cst_encode_bool(bool raw);

  @protected
  int cst_encode_chain(Chain raw);

  @protected
  double cst_encode_f_64(double raw);

  @protected
  int cst_encode_i_32(int raw);

  @protected
  int cst_encode_swap_type(SwapType raw);

  @protected
  int cst_encode_u_32(int raw);

  @protected
  int cst_encode_u_8(int raw);

  @protected
  void cst_encode_unit(void raw);

  @protected
  int cst_encode_usize(int raw);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_all_fees(AllFees self, SseSerializer serializer);

  @protected
  void sse_encode_boltz_error(BoltzError self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_btc_ln_v_1_swap(
      BtcLnV1Swap self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_btc_ln_v_2_swap(
      BtcLnV2Swap self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_btc_swap_script_v_2_str(
      BtcSwapScriptV2Str self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_key_pair(KeyPair self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_l_btc_swap_script_v_2_str(
      LBtcSwapScriptV2Str self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_lbtc_ln_v_1_swap(
      LbtcLnV1Swap self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_lbtc_ln_v_2_swap(
      LbtcLnV2Swap self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_pre_image(
      PreImage self, SseSerializer serializer);

  @protected
  void sse_encode_btc_ln_v_1_swap(BtcLnV1Swap self, SseSerializer serializer);

  @protected
  void sse_encode_btc_ln_v_2_swap(BtcLnV2Swap self, SseSerializer serializer);

  @protected
  void sse_encode_btc_swap_script_v_2_str(
      BtcSwapScriptV2Str self, SseSerializer serializer);

  @protected
  void sse_encode_chain(Chain self, SseSerializer serializer);

  @protected
  void sse_encode_decoded_invoice(
      DecodedInvoice self, SseSerializer serializer);

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_key_pair(KeyPair self, SseSerializer serializer);

  @protected
  void sse_encode_l_btc_swap_script_v_2_str(
      LBtcSwapScriptV2Str self, SseSerializer serializer);

  @protected
  void sse_encode_lbtc_ln_v_1_swap(LbtcLnV1Swap self, SseSerializer serializer);

  @protected
  void sse_encode_lbtc_ln_v_2_swap(LbtcLnV2Swap self, SseSerializer serializer);

  @protected
  void sse_encode_limits(Limits self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_pre_image(PreImage self, SseSerializer serializer);

  @protected
  void sse_encode_reverse_swap_fees(
      ReverseSwapFees self, SseSerializer serializer);

  @protected
  void sse_encode_submarine_swap_fees(
      SubmarineSwapFees self, SseSerializer serializer);

  @protected
  void sse_encode_swap_type(SwapType self, SseSerializer serializer);

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_64(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(int self, SseSerializer serializer);
}

// Section: wire_class

class BoltzCoreWire implements BaseWire {
  BoltzCoreWire.fromExternalLibrary(ExternalLibrary lib);

  void wire_btc_ln_v_1_swap_claim(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee) =>
      wasmModule.wire_btc_ln_v_1_swap_claim(port_, that, out_address, abs_fee);

  void wire_btc_ln_v_1_swap_new(
          NativePortType port_,
          String id,
          int kind,
          int network,
          List<dynamic> keys,
          List<dynamic> preimage,
          String redeem_script,
          String invoice,
          String script_address,
          Object out_amount,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_btc_ln_v_1_swap_new(
          port_,
          id,
          kind,
          network,
          keys,
          preimage,
          redeem_script,
          invoice,
          script_address,
          out_amount,
          electrum_url,
          boltz_url);

  void wire_btc_ln_v_1_swap_new_reverse(
          NativePortType port_,
          String mnemonic,
          Object index,
          Object out_amount,
          int network,
          String electrum_url,
          String boltz_url,
          String pair_hash) =>
      wasmModule.wire_btc_ln_v_1_swap_new_reverse(port_, mnemonic, index,
          out_amount, network, electrum_url, boltz_url, pair_hash);

  void wire_btc_ln_v_1_swap_new_submarine(
          NativePortType port_,
          String mnemonic,
          Object index,
          String invoice,
          int network,
          String electrum_url,
          String boltz_url,
          String pair_hash) =>
      wasmModule.wire_btc_ln_v_1_swap_new_submarine(port_, mnemonic, index,
          invoice, network, electrum_url, boltz_url, pair_hash);

  void wire_btc_ln_v_1_swap_refund(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee) =>
      wasmModule.wire_btc_ln_v_1_swap_refund(port_, that, out_address, abs_fee);

  void wire_btc_ln_v_1_swap_tx_size(NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_btc_ln_v_1_swap_tx_size(port_, that);

  void wire_btc_ln_v_2_swap_claim(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee, bool cooperate) =>
      wasmModule.wire_btc_ln_v_2_swap_claim(
          port_, that, out_address, abs_fee, cooperate);

  void wire_btc_ln_v_2_swap_new(
          NativePortType port_,
          String id,
          int kind,
          int network,
          List<dynamic> keys,
          List<dynamic> preimage,
          List<dynamic> swap_script,
          String invoice,
          String script_address,
          Object out_amount,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_btc_ln_v_2_swap_new(
          port_,
          id,
          kind,
          network,
          keys,
          preimage,
          swap_script,
          invoice,
          script_address,
          out_amount,
          electrum_url,
          boltz_url);

  void wire_btc_ln_v_2_swap_new_reverse(
          NativePortType port_,
          String mnemonic,
          Object index,
          Object out_amount,
          int network,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_btc_ln_v_2_swap_new_reverse(
          port_, mnemonic, index, out_amount, network, electrum_url, boltz_url);

  void wire_btc_ln_v_2_swap_new_submarine(
          NativePortType port_,
          String mnemonic,
          Object index,
          String invoice,
          int network,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_btc_ln_v_2_swap_new_submarine(
          port_, mnemonic, index, invoice, network, electrum_url, boltz_url);

  void wire_btc_ln_v_2_swap_refund(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee) =>
      wasmModule.wire_btc_ln_v_2_swap_refund(port_, that, out_address, abs_fee);

  void wire_btc_ln_v_2_swap_tx_size(NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_btc_ln_v_2_swap_tx_size(port_, that);

  void wire_boltz_error_new(
          NativePortType port_, String kind, String message) =>
      wasmModule.wire_boltz_error_new(port_, kind, message);

  void wire_lbtc_ln_v_1_swap_claim(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee) =>
      wasmModule.wire_lbtc_ln_v_1_swap_claim(port_, that, out_address, abs_fee);

  void wire_lbtc_ln_v_1_swap_new(
          NativePortType port_,
          String id,
          int kind,
          int network,
          List<dynamic> keys,
          List<dynamic> preimage,
          String redeem_script,
          String invoice,
          Object out_amount,
          String out_address,
          String blinding_key,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_lbtc_ln_v_1_swap_new(
          port_,
          id,
          kind,
          network,
          keys,
          preimage,
          redeem_script,
          invoice,
          out_amount,
          out_address,
          blinding_key,
          electrum_url,
          boltz_url);

  void wire_lbtc_ln_v_1_swap_new_reverse(
          NativePortType port_,
          String mnemonic,
          Object index,
          Object out_amount,
          int network,
          String electrum_url,
          String boltz_url,
          String pair_hash) =>
      wasmModule.wire_lbtc_ln_v_1_swap_new_reverse(port_, mnemonic, index,
          out_amount, network, electrum_url, boltz_url, pair_hash);

  void wire_lbtc_ln_v_1_swap_new_submarine(
          NativePortType port_,
          String mnemonic,
          Object index,
          String invoice,
          int network,
          String electrum_url,
          String boltz_url,
          String pair_hash) =>
      wasmModule.wire_lbtc_ln_v_1_swap_new_submarine(port_, mnemonic, index,
          invoice, network, electrum_url, boltz_url, pair_hash);

  void wire_lbtc_ln_v_1_swap_refund(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee) =>
      wasmModule.wire_lbtc_ln_v_1_swap_refund(
          port_, that, out_address, abs_fee);

  void wire_lbtc_ln_v_1_swap_tx_size(
          NativePortType port_, List<dynamic> swap) =>
      wasmModule.wire_lbtc_ln_v_1_swap_tx_size(port_, swap);

  void wire_lbtc_ln_v_2_swap_claim(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee, bool cooperate) =>
      wasmModule.wire_lbtc_ln_v_2_swap_claim(
          port_, that, out_address, abs_fee, cooperate);

  void wire_lbtc_ln_v_2_swap_new(
          NativePortType port_,
          String id,
          int kind,
          int network,
          List<dynamic> keys,
          List<dynamic> preimage,
          List<dynamic> swap_script,
          String invoice,
          Object out_amount,
          String out_address,
          String blinding_key,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_lbtc_ln_v_2_swap_new(
          port_,
          id,
          kind,
          network,
          keys,
          preimage,
          swap_script,
          invoice,
          out_amount,
          out_address,
          blinding_key,
          electrum_url,
          boltz_url);

  void wire_lbtc_ln_v_2_swap_new_reverse(
          NativePortType port_,
          String mnemonic,
          Object index,
          Object out_amount,
          int network,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_lbtc_ln_v_2_swap_new_reverse(
          port_, mnemonic, index, out_amount, network, electrum_url, boltz_url);

  void wire_lbtc_ln_v_2_swap_new_submarine(
          NativePortType port_,
          String mnemonic,
          Object index,
          String invoice,
          int network,
          String electrum_url,
          String boltz_url) =>
      wasmModule.wire_lbtc_ln_v_2_swap_new_submarine(
          port_, mnemonic, index, invoice, network, electrum_url, boltz_url);

  void wire_lbtc_ln_v_2_swap_refund(NativePortType port_, List<dynamic> that,
          String out_address, Object abs_fee) =>
      wasmModule.wire_lbtc_ln_v_2_swap_refund(
          port_, that, out_address, abs_fee);

  void wire_lbtc_ln_v_2_swap_tx_size(
          NativePortType port_, List<dynamic> that) =>
      wasmModule.wire_lbtc_ln_v_2_swap_tx_size(port_, that);

  void wire_all_fees_fetch(NativePortType port_, String boltz_url) =>
      wasmModule.wire_all_fees_fetch(port_, boltz_url);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_btc_swap_script_v_2_str_new(
              int swap_type,
              String? funding_addrs,
              String hashlock,
              String receiver_pubkey,
              int locktime,
              String sender_pubkey) =>
          wasmModule.wire_btc_swap_script_v_2_str_new(swap_type, funding_addrs,
              hashlock, receiver_pubkey, locktime, sender_pubkey);

  void wire_decoded_invoice_from_string(NativePortType port_, String s) =>
      wasmModule.wire_decoded_invoice_from_string(port_, s);

  void wire_key_pair_generate(NativePortType port_, String mnemonic,
          int network, Object index, int swap_type) =>
      wasmModule.wire_key_pair_generate(
          port_, mnemonic, network, index, swap_type);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_key_pair_new(String secret_key, String public_key) =>
          wasmModule.wire_key_pair_new(secret_key, public_key);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_l_btc_swap_script_v_2_str_new(
              int swap_type,
              String? funding_addrs,
              String hashlock,
              String receiver_pubkey,
              int locktime,
              String sender_pubkey,
              String blinding_key) =>
          wasmModule.wire_l_btc_swap_script_v_2_str_new(
              swap_type,
              funding_addrs,
              hashlock,
              receiver_pubkey,
              locktime,
              sender_pubkey,
              blinding_key);

  void wire_pre_image_generate(NativePortType port_) =>
      wasmModule.wire_pre_image_generate(port_);

  dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_pre_image_new(String value, String sha256, String hash160) =>
          wasmModule.wire_pre_image_new(value, sha256, hash160);
}

@JS('wasm_bindgen')
external BoltzCoreWasmModule get wasmModule;

@JS()
@anonymous
class BoltzCoreWasmModule implements WasmModule {
  @override
  external Object /* Promise */ call([String? moduleName]);

  @override
  external BoltzCoreWasmModule bind(dynamic thisArg, String moduleName);

  external void wire_btc_ln_v_1_swap_claim(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee);

  external void wire_btc_ln_v_1_swap_new(
      NativePortType port_,
      String id,
      int kind,
      int network,
      List<dynamic> keys,
      List<dynamic> preimage,
      String redeem_script,
      String invoice,
      String script_address,
      Object out_amount,
      String electrum_url,
      String boltz_url);

  external void wire_btc_ln_v_1_swap_new_reverse(
      NativePortType port_,
      String mnemonic,
      Object index,
      Object out_amount,
      int network,
      String electrum_url,
      String boltz_url,
      String pair_hash);

  external void wire_btc_ln_v_1_swap_new_submarine(
      NativePortType port_,
      String mnemonic,
      Object index,
      String invoice,
      int network,
      String electrum_url,
      String boltz_url,
      String pair_hash);

  external void wire_btc_ln_v_1_swap_refund(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee);

  external void wire_btc_ln_v_1_swap_tx_size(
      NativePortType port_, List<dynamic> that);

  external void wire_btc_ln_v_2_swap_claim(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee, bool cooperate);

  external void wire_btc_ln_v_2_swap_new(
      NativePortType port_,
      String id,
      int kind,
      int network,
      List<dynamic> keys,
      List<dynamic> preimage,
      List<dynamic> swap_script,
      String invoice,
      String script_address,
      Object out_amount,
      String electrum_url,
      String boltz_url);

  external void wire_btc_ln_v_2_swap_new_reverse(
      NativePortType port_,
      String mnemonic,
      Object index,
      Object out_amount,
      int network,
      String electrum_url,
      String boltz_url);

  external void wire_btc_ln_v_2_swap_new_submarine(
      NativePortType port_,
      String mnemonic,
      Object index,
      String invoice,
      int network,
      String electrum_url,
      String boltz_url);

  external void wire_btc_ln_v_2_swap_refund(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee);

  external void wire_btc_ln_v_2_swap_tx_size(
      NativePortType port_, List<dynamic> that);

  external void wire_boltz_error_new(
      NativePortType port_, String kind, String message);

  external void wire_lbtc_ln_v_1_swap_claim(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee);

  external void wire_lbtc_ln_v_1_swap_new(
      NativePortType port_,
      String id,
      int kind,
      int network,
      List<dynamic> keys,
      List<dynamic> preimage,
      String redeem_script,
      String invoice,
      Object out_amount,
      String out_address,
      String blinding_key,
      String electrum_url,
      String boltz_url);

  external void wire_lbtc_ln_v_1_swap_new_reverse(
      NativePortType port_,
      String mnemonic,
      Object index,
      Object out_amount,
      int network,
      String electrum_url,
      String boltz_url,
      String pair_hash);

  external void wire_lbtc_ln_v_1_swap_new_submarine(
      NativePortType port_,
      String mnemonic,
      Object index,
      String invoice,
      int network,
      String electrum_url,
      String boltz_url,
      String pair_hash);

  external void wire_lbtc_ln_v_1_swap_refund(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee);

  external void wire_lbtc_ln_v_1_swap_tx_size(
      NativePortType port_, List<dynamic> swap);

  external void wire_lbtc_ln_v_2_swap_claim(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee, bool cooperate);

  external void wire_lbtc_ln_v_2_swap_new(
      NativePortType port_,
      String id,
      int kind,
      int network,
      List<dynamic> keys,
      List<dynamic> preimage,
      List<dynamic> swap_script,
      String invoice,
      Object out_amount,
      String out_address,
      String blinding_key,
      String electrum_url,
      String boltz_url);

  external void wire_lbtc_ln_v_2_swap_new_reverse(
      NativePortType port_,
      String mnemonic,
      Object index,
      Object out_amount,
      int network,
      String electrum_url,
      String boltz_url);

  external void wire_lbtc_ln_v_2_swap_new_submarine(
      NativePortType port_,
      String mnemonic,
      Object index,
      String invoice,
      int network,
      String electrum_url,
      String boltz_url);

  external void wire_lbtc_ln_v_2_swap_refund(NativePortType port_,
      List<dynamic> that, String out_address, Object abs_fee);

  external void wire_lbtc_ln_v_2_swap_tx_size(
      NativePortType port_, List<dynamic> that);

  external void wire_all_fees_fetch(NativePortType port_, String boltz_url);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_btc_swap_script_v_2_str_new(
          int swap_type,
          String? funding_addrs,
          String hashlock,
          String receiver_pubkey,
          int locktime,
          String sender_pubkey);

  external void wire_decoded_invoice_from_string(
      NativePortType port_, String s);

  external void wire_key_pair_generate(NativePortType port_, String mnemonic,
      int network, Object index, int swap_type);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_key_pair_new(String secret_key, String public_key);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_l_btc_swap_script_v_2_str_new(
          int swap_type,
          String? funding_addrs,
          String hashlock,
          String receiver_pubkey,
          int locktime,
          String sender_pubkey,
          String blinding_key);

  external void wire_pre_image_generate(NativePortType port_);

  external dynamic /* flutter_rust_bridge::for_generated::WireSyncRust2DartDco */
      wire_pre_image_new(String value, String sha256, String hash160);
}

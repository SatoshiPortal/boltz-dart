import 'dart:io';
import 'package:boltz_dart/src/utils/loader.dart';
import 'generated/bridge_definitions.dart' as bridge;
import 'generated/bridge_definitions.dart';

// m/84'/0'/0'/<0;1>/index (segwit wallet; address index handled by bdk)
// m/84'/0'/21'/<0;1>/index (sub swap wallet; address index handled by client)
// m/84'/0'/42'/<0;1>/index (sub swap wallet; address index handled by client)

Future<void> setCurrentDirectory() async {
  try {
    await Dylib.downloadUnitTestDylib(Directory.current.path);
  } catch (e) {
    print(e.toString());
  }
}

class BtcLnBoltzSwap {
  final bridge.BtcLnSwap _btcLnSwap;

  BtcLnBoltzSwap(this._btcLnSwap);

  bridge.BtcLnSwap get btcLnSwap => _btcLnSwap;

  static Future<BtcLnBoltzSwap> newSubmarine(
      {required String mnemonic,
      required int index,
      required String invoice,
      required bridge.Chain network,
      required String electrumUrl,
      required String boltzUrl,
          required String pairHash,

      dynamic hint}) async {
    try {
      final res = await ffi.newBtcLnSubmarineStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
        pairHash: pairHash,
      );
      return BtcLnBoltzSwap(res);
    } catch (e) {
      rethrow;
    }
  }

  static Future<BtcLnBoltzSwap> newReverse(
      {required String mnemonic,
      required int index,
      required int outAmount,
      required bridge.Chain network,
      required String electrumUrl,
      required String boltzUrl,
          required String pairHash,

      dynamic hint}) async {
    try {
      final res = await ffi.newBtcLnReverseStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        outAmount: outAmount,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
        pairHash: pairHash,
      );
      return BtcLnBoltzSwap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> size() async {
    try {
      final res = await ffi.btcLnTxSizeStaticMethodApi(
        swap: _btcLnSwap,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> claim(
      {required String outAddress, required int absFee}) async {
    try {
      final res = await ffi.btcLnReverseClaimStaticMethodApi(
        swap: _btcLnSwap,
        outAddress: outAddress,
        absFee: absFee,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
  
  Future<String> refund(
      {required String outAddress, required int absFee}) async {
    try {
      final res = await ffi.btcLnSubmarineRefundStaticMethodApi(
        swap: _btcLnSwap,
        outAddress: outAddress,
        absFee: absFee,
      );

      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> status({dynamic hint}) async {
    try {
      final res = await ffi.swapStatusStaticMethodApi(
        boltzUrl: _btcLnSwap.boltzUrl,
        id: _btcLnSwap.id,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> paymentDetails({dynamic hint}) async {
    try {
      final swapType = _btcLnSwap.kind;
      if (swapType == bridge.SwapType.Submarine) {
        return "${_btcLnSwap.scriptAddress}:${_btcLnSwap.outAmount}";
      }
      return _btcLnSwap.invoice;
    } catch (e) {
      rethrow;
    }
  }
}

class LbtcLnBoltzSwap {
  final bridge.LbtcLnSwap _lbtcLnSwap;

  LbtcLnBoltzSwap(this._lbtcLnSwap);

  bridge.LbtcLnSwap get lbtcLnSwap => _lbtcLnSwap;

  static Future<LbtcLnBoltzSwap> newSubmarine({
    required String mnemonic,
    required int index,
    required String invoice,
    required bridge.Chain network,
    required String electrumUrl,
    required String boltzUrl,
    required String pairHash,

  }) async {
    try {
      final res = await ffi.newLbtcLnSubmarineStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
        pairHash: pairHash,
      );

      return LbtcLnBoltzSwap(res);
    } catch (e) {
      rethrow;
    }
  }

  static Future<LbtcLnBoltzSwap> newReverse({
    required String mnemonic,
    required int index,
    required int outAmount,
    required bridge.Chain network,
    required String electrumUrl,
    required String boltzUrl,
    required String pairHash,
  }) async {
    try {
      final res = await ffi.newLbtcLnReverseStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        outAmount: outAmount,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
        pairHash: pairHash,
      );

      return LbtcLnBoltzSwap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> size() async {
    try {
      final res = await ffi.lbtcLnTxSizeStaticMethodApi(
        swap: _lbtcLnSwap,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> claim(
      {required String outAddress, required int absFee}) async {
    try {
      final res = await ffi.lbtcLnReverseClaimStaticMethodApi(
        swap: _lbtcLnSwap,
        outAddress: outAddress,
        absFee: absFee,
      );

      return res;
    } catch (e) {
      rethrow;
    }
  }

    Future<String> refund(
      {required String outAddress, required int absFee}) async {
    try {
      final res = await ffi.lbtcLnSubmarineRefundStaticMethodApi(
        swap: _lbtcLnSwap,
        outAddress: outAddress,
        absFee: absFee,
      );

      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> status() async {
    try {
      final res = await ffi.swapStatusStaticMethodApi(
        boltzUrl: _lbtcLnSwap.boltzUrl,
        id: _lbtcLnSwap.id,
      );

      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> paymentDetails() async {
    try {
      final swapType = _lbtcLnSwap.kind;
      if (swapType == bridge.SwapType.Submarine) {
        return "${_lbtcLnSwap.scriptAddress}:${_lbtcLnSwap.outAmount}";
      }
      return _lbtcLnSwap.invoice;
    } catch (e) {
      rethrow;
    }
  }
}

class AllSwapFees {
  static Future<AllFees> estimateFee(
      {required String boltzUrl, required int outputAmount}) async {
    try {
      final res = await ffi.swapFeesStaticMethodApi(
          boltzUrl: boltzUrl, outputAmount: outputAmount);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}

class Bolt11Invoice {
  static Future<DecodedInvoice> decode({required String invoice}) async {
    try{
      final res = await ffi.decodeInvoiceStaticMethodApi(invoiceStr: invoice);
      return res;
    }
    catch (e){
      rethrow;
    }
  }
}
// done
  // new submarine swap
  // new reverse swap
  // status
  // claim

    // payment details
  // // reverse - invoice
  // // submarine - outAmount, onchainAddress
  // refund
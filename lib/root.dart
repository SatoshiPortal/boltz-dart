import 'bridge_definitions.dart' as bridge;
import 'ffi.dart';

class BtcLnSwap {
  final bridge.BtcLnSwap _btcLnSwap;

  BtcLnSwap._(this._btcLnSwap);

  bridge.BtcLnSwap get btcLnSwap => _btcLnSwap;

  static Future<BtcLnSwap> newSubmarine(
      {required String mnemonic,
      required int index,
      required String invoice,
      required bridge.Chain network,
      required String electrumUrl,
      required String boltzUrl,
      dynamic hint}) async {
    try {
      final res = await ffi.newBtcLnSubmarineStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
      );

      return BtcLnSwap._(res);
    } catch (e) {
      rethrow;
    }
  }

  static Future<BtcLnSwap> newReverse(
      {required String mnemonic,
      required int index,
      required int outAmount,
      required bridge.Chain network,
      required String electrumUrl,
      required String boltzUrl,
      dynamic hint}) async {
    try {
      final res = await ffi.newBtcLnReverseStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        outAmount: outAmount,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
      );

      return BtcLnSwap._(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> claim({required int absFee}) async {
    try {
      final res = await ffi.btcLnReverseClaimStaticMethodApi(
        swap: _btcLnSwap,
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
        return "${_btcLnSwap.outAddress}:${_btcLnSwap.outAmount}";
      }

      return _btcLnSwap.invoice;
    } catch (e) {
      rethrow;
    }
  }
}

class LbtcLnSwap {
  final bridge.LbtcLnSwap _lbtcLnSwap;

  LbtcLnSwap._(this._lbtcLnSwap);

  bridge.LbtcLnSwap get lbtcLnSwap => _lbtcLnSwap;

  static Future<LbtcLnSwap> newSubmarine({
    required String mnemonic,
    required int index,
    required String invoice,
    required bridge.Chain network,
    required String electrumUrl,
    required String boltzUrl,
  }) async {
    try {
      final res = await ffi.newLbtcLnSubmarineStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
      );

      return LbtcLnSwap._(res);
    } catch (e) {
      rethrow;
    }
  }

  static Future<LbtcLnSwap> newReverse({
    required String mnemonic,
    required int index,
    required int outAmount,
    required bridge.Chain network,
    required String electrumUrl,
    required String boltzUrl,
  }) async {
    try {
      final res = await ffi.newLbtcLnReverseStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        outAmount: outAmount,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
      );

      return LbtcLnSwap._(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> claim({required int absFee}) async {
    try {
      final res = await ffi.lbtcLnReverseClaimStaticMethodApi(
        swap: _lbtcLnSwap,
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
        return "${_lbtcLnSwap.outAddress}:${_lbtcLnSwap.outAmount}";
      }

      return _lbtcLnSwap.invoice;
    } catch (e) {
      rethrow;
    }
  }
}

class SwapFees {
  static Future<({double btc, double lbtc})> estimateFee(
      {required String boltzUrl}) async {
    try {
      final res = await ffi.swapFeesStaticMethodApi(boltzUrl: boltzUrl);
      return (btc: res.$1, lbtc: res.$2);
    } catch (e) {
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
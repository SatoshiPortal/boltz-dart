import 'bridge_definitions.dart' as bridge;
import 'ffi.dart';

class BtcLnSwap {
  final bridge.BtcLnSwap _btcLnSwap;

  BtcLnSwap._(this._btcLnSwap);

  static Future<BtcLnSwap> newSubmarine(
      {required String mnemonic,
      required int index,
      required String invoice,
      required bridge.Network network,
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
      required bridge.Network network,
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

  Future<String> claim({required int fee}) async {
    try {
      final res = await ffi.btcLnReverseClaimStaticMethodApi(
        swap: _btcLnSwap,
        fee: fee,
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
        return "${_btcLnSwap.onchainAddress}:${_btcLnSwap.outAmount}";
      }

      return _btcLnSwap.invoice;
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
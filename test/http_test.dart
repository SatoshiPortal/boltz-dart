import 'dart:async';
import 'dart:convert';

// import 'package:boltz_dart/http.dart';
// import 'package:boltz_dart/types/swap.dart';
// import 'package:boltz_dart/types/swap_status_response.dart';
import 'package:boltz_dart/src/types/swap.dart';
import 'package:boltz_dart/src/types/swap_status_response.dart';
import 'package:boltz_dart/src/utils/http.dart';
import 'package:test/test.dart';

void main() {
  // test('playground', () async {
  //   String str = 'data: {"status":"transaction.claimed"}';
  //   var jsonMap = jsonDecode(str);
  //   print(jsonMap);
  // });

  test('Version', () async {
    final api = await BoltzApi.newBoltzApi();
    final version = await api.getBackendVersion();

    expect(version, startsWith('3.4.0'));
  });

  test('Get pairs', () async {
    final api = await BoltzApi.newBoltzApi();
    final pairs = await api.getSupportedPairs();
    // print(pairs);

    expect(pairs.length, equals(3));
  });

  test('Get status', () async {
    final api = await BoltzApi.newBoltzApi();
    final status = await api.getSwapStatus('5Nke2TZdZLZ5');

    expect(status, equals(SwapStatus.claimed));
  });

  // TODO: Flows for
  // btc to ln-btc - Success
  //   invoiceSet
  //   mempool
  //   confirmed
  //   invoicePending
  //   invoicePaid
  //   claimed

  // btc to ln-btc - Failure (Not enough inbound liquidity)  / Refund
  //   invoiceSet
  //   mempool
  //   confirmed
  //   invoicePending (Attempt refund 1. before this, 2. after this)
  //   waiting

  // ln-btc to btc
  // l-btc to ln-btc
  //   invoiceSet
  //   mempool
  //   invoicePending
  //   invoicePaid
  //   claimed
  // ln-btc to l-btc
  //
  // Try with sending mismatching amounts
  test('Get status stream', () async {
    final api = await BoltzApi.newBoltzApi();

    // const swapId = 'M4RTmRP9ukCH'; // Send / Liquidity problem. Boltz cannot send lightning payment
    // const swapId = 'Dvrz92';
    const swapId = 'JCzhae';
    Stream<SwapStatusResponse> eventStream = api.getSwapStatusStream(swapId);

    // Define a timeout for the test to avoid it running indefinitely
    var timeout = Duration(minutes: 120);

    // A list to store received events
    var receivedEvents = <SwapStatusResponse>[];

    // Completer to signal the end of the test
    var completer = Completer();

    // Listen to the stream
    var subscription = eventStream.listen(
      (event) {
        receivedEvents.add(event);

        // Optionally, you can set a condition to complete the test
        // For example, if a specific event is received
        //if (event == 'specific_event') {
        //  completer.complete();
        //}
      },
      onError: (e) {
        completer.completeError(e);
      },
    );

    await Future.any([
      completer.future,
      Future.delayed(timeout).then((_) => completer.complete()),
    ]);

    // Cancel the subscription after completion
    // await subscription.cancel();

    print('receivedEvents: $receivedEvents');
    SwapStatusResponse firstEvent = receivedEvents.first;

    expect(firstEvent.status, equals(SwapStatus.claimed));
  }, timeout: const Timeout(Duration(minutes: 120)));
}

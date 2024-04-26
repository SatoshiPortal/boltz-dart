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
    final api = await BoltzApi.newBoltzApi(testnetBaseUrl);
    final version = await api.getBackendVersion();

    expect(version, startsWith('3.4.0'));
  }, skip: true);

  test('Get pairs', () async {
    final api = await BoltzApi.newBoltzApi(testnetBaseUrl);
    final pairs = await api.getSupportedPairs();
    // print(pairs);

    expect(pairs.length, equals(3));
  });

  test('Get status', () async {
    final api = await BoltzApi.newBoltzApi(testnetBaseUrl);
    final status = await api.getSwapStatus('5Nke2TZdZLZ5');

    expect(status, equals(SwapStatus.txnClaimed));
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
  //test('Get status stream', () async {
  //  final api = await BoltzApi.newBoltzApi(testnetBaseUrl);

  //  // const swapId = 'kuaECCcK4ZJ9'; // #2
  //  // const swapId = 'TSMILwPf2HCu'; // #3
  //  // const swapId = 'c9A3aEaQz1Iu'; // #4
  //  // const swapId = 'dhbn5n2ypzBC'; // #5
  //  const swapId = 'QbkqhN9ed2zQ'; // #6
  //  Stream<SwapStatusResponse> eventStream = api.getSwapStatusStream(swapId);

  //  var receivedEvents = <SwapStatusResponse>[];

  //  var completer = Completer();

  //  var subscription = eventStream.listen((event) {
  //    receivedEvents.add(event);

  //    // Optionally, you can set a condition to complete the test
  //    // For example, if a specific event is received
  //    //if (event == 'specific_event') {
  //    //  completer.complete();
  //    //}
  //  }, onError: (e) {
  //    completer.completeError(e);
  //  }, onDone: () {
  //    completer.complete();
  //  });

  //  await completer.future;

  //  await subscription.cancel();

  //  print('receivedEvents: $receivedEvents');
  //  SwapStatusResponse firstEvent = receivedEvents.first;

  //  expect(firstEvent.status, equals(SwapStatus.txnClaimed));
  //}, skip: true, timeout: const Timeout(Duration(minutes: 120)));

  // test('Get status stream multiple', () async {
  //   final api = await BoltzApi.newBoltzApi(testnetBaseUrl);

  //   const List<String> swapIds = ['QbkqhN9ed2zQ', 'dhbn5n2ypzBC', 'kuaECCcK4ZJ9', 'EXVCx6', 'grWI22', 'invalid'];
  //   Stream<SwapStatusResponse> eventStream = api.getSwapStatusStreamMultiple(swapIds);

  //   var receivedEvents = <SwapStatusResponse>[];

  //   var completer = Completer();

  //   var subscription = eventStream.listen((event) {
  //     receivedEvents.add(event);

  //     print(event);

  //     // Optionally, you can set a condition to complete the test
  //     // For example, if a specific event is received
  //     //if (event == 'specific_event') {
  //     //  completer.complete();
  //     //}
  //   }, onError: (e) {
  //     print('onError');
  //     completer.completeError(e);
  //   }, onDone: () {
  //     print('onDone');
  //     completer.complete();
  //   });

  //   await completer.future;

  //   await subscription.cancel();

  //   print('receivedEvents: $receivedEvents');
  // }, skip: true, timeout: const Timeout(Duration(minutes: 120)));

  test('SwapStatus to string', () async {
    print(SwapStatus.invoicePaid.toJson());
    print(
        SwapStatusResponse(id: 'abc', status: SwapStatus.invoicePaid).toJson());
    print(SwapStatusResponse.fromJson(
        jsonDecode('{"id":"abc","status":"invoice.paid"}')));
  });

  test('Get status stream multiple: Creaet, Update, Close', () async {
    final api = await BoltzApi.newBoltzApi(testnetBaseUrl);

    api.initialize(testnetBaseUrl);

    // const List<String> swapIds = ['QbkqhN9ed2zQ', 'dhbn5n2ypzBC', 'kuaECCcK4ZJ9', 'EXVCx6', 'grWI22', 'invalid'];
    const List<String> swapIds = ['67ptET'];
    Stream<SwapStatusResponse> eventStream = api.subscribeSwapStatus(swapIds);

    var receivedEvents = <SwapStatusResponse>[];

    var completer = Completer();

    var subscription = eventStream.listen((event) {
      receivedEvents.add(event);

      print(event);
    }, onError: (e) {
      print('onError');
      completer.completeError(e);
    }, onDone: () {
      print('onDone');
      completer.complete();
    });

    await completer.future;

    await subscription.cancel();

    print('receivedEvents: $receivedEvents');
  }, skip: true, timeout: const Timeout(Duration(minutes: 120)));

  test('Get status stream multiple; Multiple calls to update', () async {
    final api = await BoltzApi.newBoltzApi(testnetBaseUrl);

    var receivedEvents = <SwapStatusResponse>[];

    // const List<String> swapIds = ['QbkqhN9ed2zQ', 'dhbn5n2ypzBC', 'kuaECCcK4ZJ9', 'EXVCx6', 'grWI22', 'invalid'];
    const List<String> swapIds1 = ['67ptET'];
    Stream<SwapStatusResponse> eventStream1 = api.subscribeSwapStatus(swapIds1);

    var completer1 = Completer();

    var sub1 = eventStream1.listen((event) {
      receivedEvents.add(event);
      print('Listen data');
      print(event);
      completer1.complete();
    });

    await completer1.future;
    await sub1.cancel();

    const List<String> swapIds2 = ['EXVCx6'];
    Stream<SwapStatusResponse> eventStream2 = api.subscribeSwapStatus(swapIds2);

    var completer2 = Completer();

    var sub2 = eventStream2.listen((event) {
      receivedEvents.add(event);
      print('Listen2 data');
      print(event);
      completer2.complete();
    });

    await completer2.future;
    await sub2.cancel();

    // print('receivedEvents: $receivedEvents');
  }, skip: true, timeout: const Timeout(Duration(minutes: 120)));
}

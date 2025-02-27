import 'dart:async';
import 'dart:convert';

import 'package:boltz/boltz.dart';
import 'package:test/test.dart';

void main() {
  test('SwapStatus to string', () async {
    print(SwapStatus.invoicePaid.toJson());
    print(SwapStreamStatus(id: 'abc', status: SwapStatus.invoicePaid).toJson());
    print(SwapStatusResponse.fromJson(jsonDecode('{"status":"invoice.paid"}')));
  });

  test('Get status stream multiple: Creaet, Update, Close', () async {
    final stream = await BoltzStream.create(mainnetBaseUrl);
    stream.initialize(mainnetBaseUrl);

    const List<String> swapIds = [
      'h3BNw2',
      'dhbn5n2ypzBC',
      'kuaECCcK4ZJ9',
      'EXVCx6',
      'grWI22',
      'invalid'
    ];

    Stream<SwapStreamStatus> eventStream = stream.subscribe(swapIds);

    var receivedEvents = <SwapStreamStatus>[];
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
    final api = await BoltzStream.create(testnetBaseUrl);
    var receivedEvents = <SwapStreamStatus>[];
    // const List<String> swapIds = ['QbkqhN9ed2zQ', 'dhbn5n2ypzBC', 'kuaECCcK4ZJ9', 'EXVCx6', 'grWI22', 'invalid'];
    const List<String> swapIds1 = ['67ptET'];
    Stream<SwapStreamStatus> eventStream1 = api.subscribe(swapIds1);

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
    Stream<SwapStreamStatus> eventStream2 = api.subscribe(swapIds2);

    var completer2 = Completer();

    var sub2 = eventStream2.listen((event) {
      receivedEvents.add(event);
      print('Listen2 data');
      print(event);
      completer2.complete();
    });

    await completer2.future;
    await sub2.cancel();
  }, skip: true, timeout: const Timeout(Duration(minutes: 120)));
}

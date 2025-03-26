import 'dart:async';
import 'dart:convert';

import 'package:boltz/boltz.dart';
import 'package:boltz/src/utils/stream.dart';
import 'package:test/test.dart';
const boltzUrl = 'https://api.testnet.boltz.exchange/v2';

void main() {
  test('SwapStatus to string', () async {
    print(SwapStatus.invoicePaid.toJson());
    print(SwapStreamStatus(id: 'abc', status: SwapStatus.invoicePaid).toJson());
    print(SwapStatusResponse.fromJson(jsonDecode('{"status":"invoice.paid"}')));
  });

  test('Get status stream multiple: Creaet, Update, Close', () async {
    final boltzWs = BoltzWebSocket.create(boltzUrl);
    // stream.initialize(mainnetBaseUrl);

    const List<String> swapIds = [
      '67ptET',
      'EXVCx6',
      'kuaECCcK4ZJ9',
      'EXVCx6',
      'grWI22',
      'invalid'
    ];

    boltzWs.subscribe(swapIds);
    var eventStream = boltzWs.stream;

    var receivedEvents = <SwapStreamStatus>[];
    var completer = Completer();
    var subscription = eventStream.listen((event) {
      receivedEvents.add(event);
      print(event);
      completer.complete();
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
    final boltzWs = BoltzWebSocket.create(boltzUrl);
    var receivedEvents = <SwapStreamStatus>[];
    // const List<String> swapIds = ['QbkqhN9ed2zQ', 'dhbn5n2ypzBC', 'kuaECCcK4ZJ9', 'EXVCx6', 'grWI22', 'invalid'];
    const List<String> swapIds1 = ['67ptET'];
    boltzWs.subscribe(swapIds1);
    var eventStream = boltzWs.stream;

    var completer1 = Completer();
    var sub1 = eventStream.listen((event) {
      receivedEvents.add(event);
      print('Listen data');
      print(event);
      completer1.complete();
    });

    await completer1.future;
    // await sub1.cancel();
    const List<String> swapIds2 = ['EXVCx6'];

    boltzWs.subscribe(swapIds2);

    // var completer2 = Completer();

    // var sub2 = eventStream.listen((event) {
    //   receivedEvents.add(event);
    //   print('Listen2 data');
    //   print(event);
    //   completer2.complete();
    // });

    // await completer2.future;
    // await sub2.cancel();
  }, skip: true, timeout: const Timeout(Duration(minutes: 120)));
}

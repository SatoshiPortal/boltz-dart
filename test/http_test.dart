import 'dart:async';
import 'dart:convert';

import 'package:boltz_dart/http.dart';
import 'package:boltz_dart/types/swap.dart';
import 'package:boltz_dart/types/swap_status_response.dart';
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

  test('Get status stream', () async {
    final api = await BoltzApi.newBoltzApi();

    Stream<SwapStatusResponse> eventStream = api.getSwapStatusStream('5Nke2TZdZLZ5');

    // Define a timeout for the test to avoid it running indefinitely
    var timeout = Duration(seconds: 10);

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
  });
}

import 'dart:async';
import 'dart:convert';

import 'package:boltz/src/types/swap_status.dart';
import 'package:web_socket_channel/io.dart';

final String mainnetBaseUrl = 'api.boltz.exchange/v2';
final String testnetBaseUrl = 'api.testnet.boltz.exchange/v2';

class BoltzStream {
  // final Dio _dio;
  IOWebSocketChannel? channel;
  StreamController<SwapStreamStatus>? _broadcastController;
  StreamSubscription? _channelSubscription;

  BoltzStream._();

  static Future<BoltzStream> create(String boltzUrl) async {
    try {
      BoltzStream stream = BoltzStream._();
      stream.initialize(boltzUrl);
      return stream;
    } catch (e) {
      rethrow;
    }
  }

  void initialize(String baseUrl) {
    channel = IOWebSocketChannel.connect(wssProtocolCheck('$baseUrl/ws'));
    _broadcastController = StreamController<SwapStreamStatus>.broadcast();
    _channelSubscription = channel!.stream.listen((msg) {
      final resp = jsonDecode(msg);
      if (resp['error'] != null) {
        _broadcastController!.add(SwapStreamStatus(
            id: '', status: SwapStatus.swapError, error: resp['error']));
      } else if (resp['event'] == 'update') {
        final swapList = resp['args'];
        for (final swap in swapList) {
          if (swap['error'] == null) {
            // print(swap);
            _broadcastController!.add(SwapStreamStatus.fromJson(swap));
          } else {
            _broadcastController!.add(SwapStreamStatus(
                id: swap['id'],
                status: SwapStatus.swapError,
                error: swap['error']));
          }
        }
      }
    }, onError: (error) {
      _broadcastController!.addError(error);
    });
  }

  Stream<SwapStreamStatus> subscribe(List<String> swapIds) {
    Map<String, dynamic> payload = {
      'op': 'subscribe',
      'channel': 'swap.update',
      'args': swapIds
    };
    channel!.sink.add(jsonEncode(payload));
    return _broadcastController!.stream;
  }

  Stream<SwapStreamStatus> unsubscribe(List<String> swapIds) {
    Map<String, dynamic> payload = {
      'op': 'unsubscribe',
      'channel': 'swap.update',
      'args': swapIds
    };
    channel!.sink.add(jsonEncode(payload));
    return _broadcastController!.stream;
  }

  void dispose() {
    _channelSubscription?.cancel();
    _broadcastController?.close();
    channel!.sink.close();
  }

  bool isSwapStatusChannelOpen() {
    return channel != null;
  }
}

// String httpProtocolCheck(String url) {
//   const List<String> protocols = ['http://', 'https://'];
//   for (var protocol in protocols) {
//     if (url.startsWith(protocol)) {
//       return url;
//     }
//   }
//   return 'https://$url';
// }

String wssProtocolCheck(String url) {
  const List<String> wsProtocols = ['wss://', 'ws://'];
  const List<String> httpProtocols = ['http://', 'https://'];
  for (var protocol in httpProtocols) {
    if (url.startsWith(protocol)) {
      url = url.substring(protocol.length);
      break;
    }
  }
  for (var protocol in wsProtocols) {
    if (url.startsWith(protocol)) {
      return url;
    }
  }
  return 'wss://$url';
}

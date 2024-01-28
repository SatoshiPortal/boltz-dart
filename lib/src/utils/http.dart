// create a API client using dio for following endpoints:
// - https://docs.boltz.exchange/v/api/api#backend-version
// - https://docs.boltz.exchange/v/api/api#supported-pairs
// - Got for testnet base url

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:boltz_dart/src/types/supported_pair.dart';
import 'package:boltz_dart/src/types/swap.dart';
import 'package:boltz_dart/src/types/swap_status_response.dart';
import 'package:dio/dio.dart';

final String baseUrl = 'https://api.testnet.boltz.exchange';

class BoltzApi {
  final Dio _dio;

  BoltzApi._(this._dio);

  static Future<BoltzApi> newBoltzApi() async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          // connectTimeout: 5000,
          // receiveTimeout: 3000,
        ),
      );
      return BoltzApi._(dio);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getBackendVersion() async {
    try {
      final res = await _dio.get('/version');
      return res.data['version'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SupportedPair>> getSupportedPairs() async {
    try {
      final res = await _dio.get('/getpairs');
      final List<SupportedPair> list = [];

      final Map<String, dynamic> pairs = res.data['pairs'];
      for (String key in pairs.keys) {
        pairs[key]['name'] = key;
        SupportedPair pair = SupportedPair.fromJson(pairs[key]);
        list.add(pair);
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<SwapStatus> getSwapStatus(String swapId) async {
    try {
      final res = await _dio.post('/swapstatus', data: {'id': swapId});
      return getSwapStatusFromString(res.data['status']);
    } catch (e) {
      rethrow;
    }
  }

  // Future<String> getSwapStatusStream(String swapId) async {
  Stream<SwapStatusResponse> getSwapStatusStream(String swapId) async* {
    try {
      Response<dynamic> rs = await _dio.get('/streamswapstatus?id=$swapId',
          options: Options(headers: {
            "Accept": "text/event-stream",
            "Cache-Control": "no-cache",
          }, responseType: ResponseType.stream));
      // .timeout(const Duration(seconds: 10));

      StreamTransformer<Uint8List, List<int>> unit8Transformer = StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(List<int>.from(data));
        },
      );

      await for (var line in rs.data!.stream
          .transform(unit8Transformer)
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())) {
        // print('event: $line');

        if (line.startsWith('data: ')) {
          var jsonString = line.substring(6);
          var jsonMap = json.decode(jsonString) as Map<String, dynamic>;
          SwapStatusResponse resp = SwapStatusResponse.fromJson(jsonMap);
          //print(jsonMap);
          //print(SwapStatusResponse.fromJson(jsonMap));
          yield resp;
          // yield const SwapStatusResponse(status: SwapStatus.confirmed);
          // yield jsonMap; // Emit the event as a Map
        }

        // yield const SwapStatusResponse(status: SwapStatus.confirmed);
      }
    } catch (e) {
      rethrow;
    }
  }
}

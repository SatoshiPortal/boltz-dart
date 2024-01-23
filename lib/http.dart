// create a API client using dio for following endpoints:
// - https://docs.boltz.exchange/v/api/api#backend-version
// - https://docs.boltz.exchange/v/api/api#supported-pairs
// - Got for testnet base url

import 'package:boltz_dart/types/supported_pair.dart';
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
}

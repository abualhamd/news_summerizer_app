import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioHelper {
  static late Dio dio;
  static String? weatherApiKey = dotenv.env['API_KEY'];
  static const String baseURL = 'https://newsdata.io/api/1/news';
  static const String summerizerUrl = 'https://portal.ayfie.com/api/summarize';
  static String? summerizerApiKey = dotenv.env['SUMMERIZER_API_KEY'];

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response<dynamic>> getDataOfCategory(
      {required Map<String, dynamic> categoryParams}) async {
    categoryParams.addAll({'apiKey': weatherApiKey, 'language': 'en'});
    return await dio.get(baseURL, queryParameters: categoryParams);
  }

  static Future<Response<dynamic>> getDataOfSearch(
      {required String query}) async {
    Map<String, dynamic> queryParams = {
      'q': query,
      'apiKey': weatherApiKey,
      'language': 'en'
    };
    return await dio.get(baseURL, queryParameters: queryParams);
  }

  static Future<String> summerizeContent(
      {required String content}) async {
    final res = await dio.post(summerizerUrl,
        options: Options(headers: {
          'X-API-KEY': summerizerApiKey
        }),
        data: {
          "min_length": 5,
          "max_length": 200,
          "text": content,
        });
    // if (res.statusCode == 200) {
    //   if (kDebugMode) {
    //     print(res.data['result']);
    //   }
    // }
    return res.data['result'];
  }
}

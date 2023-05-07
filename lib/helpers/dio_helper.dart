import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioHelper {
  static late Dio dio;
  static String? weatherApiKey = dotenv.env['API_KEY'];
  static const String baseURL = 'https://newsapi.org/';
  static const String urlCategory = 'v2/top-headlines';
  static const String urlSearch = 'v2/everything';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        queryParameters: {},
      ),
    );
  }

  static Future<Response<dynamic>> getDataOfCategory(
      {required Map<String, dynamic> category}) async {
    Map<String, dynamic> queryParams = {
      // 'country': 'eg',//us
      'language': 'en',
      'apiKey': weatherApiKey
    };
    queryParams.addAll(category);
    return await dio.get(urlCategory, queryParameters: queryParams);
  }

  static Future<Response<dynamic>> getDataOfSearch(
      {required String query}) async {
    Map<String, dynamic> queryParams = {'q': query, 'apiKey': weatherApiKey};
    return await dio.get(urlCategory, queryParameters: queryParams);
  }
}

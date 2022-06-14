import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static const String weatherApiKey = '982c398a781a4365b9633e046fc2d001';
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
      'country': 'eg',
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

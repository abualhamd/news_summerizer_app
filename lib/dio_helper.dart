import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static const String weatherApiKey = '982c398a781a4365b9633e046fc2d001';
  static const String baseURL = 'https://newsapi.org/';
  static const String url = 'v2/top-headlines';

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      queryParameters: {},
    ));
  }

  static Future<Response<dynamic>> getData (
      {required Map<String, dynamic> category}) async{
    Map<String,dynamic> queryParams = {'country': 'eg','apiKey': weatherApiKey};
    queryParams.addAll(category);
    return await dio.get(url, queryParameters: queryParams);
  }
}

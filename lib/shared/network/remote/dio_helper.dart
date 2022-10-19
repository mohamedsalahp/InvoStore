import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl: 'https://www.invostoreapi.invoacdmy.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String , dynamic>? query ,
    String? token,
    String? lang = 'en',
  }) async
  {
    dio.options.headers = {
      // 'api_password':'invoworkhard',
      // 'lang':lang,
      'Authorization':token??'' ,
    };
    return await dio.get(
      url,
      queryParameters: {
        'api_password':'invoworkhard',
        'lang':'en'
      },
    );
  }

  static Future<Response> postData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang="en",
        String? token
      }) async
  {
    dio.options.headers =
    {
     // 'Content-Type': 'application/json',
      //'lang': lang,
      'Authorization': token ??'',
      'api_password' : 'invoworkhard',
    };
    return  await dio.post(
        url,
        queryParameters: {
          'api_password' : 'invoworkhard',
        },
        data: data
    );
  }

  static Future<Response> putData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang="en",
        String? token}) async
  {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ??''
    };
    return dio.put(
        url,
        queryParameters: query,
        data: data
    );
  }
}
import 'package:app_flutter/tools/plugin.dart';
import 'package:dio/dio.dart';


class Network {

  static final Dio _dio = Dio()
    ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            options.headers["token"] = NativePlugin.token;
          }
        )
    );

  static Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String method = "GET"
  }) async {
      if (method == "GET") {
        return await _dio.get(url, queryParameters: params);
      } else if (method == "POST") {
        return await _dio.post(url, data: body, queryParameters: params);
      } else {
        throw Exception("unsupported method $method, use GET or POST");
      }
  }

}
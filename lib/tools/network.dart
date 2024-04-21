import 'package:app_flutter/plugin/base/lib/base_platform_interface.dart';
import 'package:app_flutter/tools/logger.dart';
import 'package:app_flutter/tools/plugin.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;


class Network {

  static final Dio _dio = Dio()
    ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            options.headers["token"] = NativePlugin.token;
            handler.next(options);
          }
        )
    );

  static Future<Response<dynamic>> request({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String method = "GET"
  }) async {
      if (NativePlugin.remoteIP.isBlank ?? true) {
        NativePlugin.remoteIP = await BasePlatform.instance.getRemoteIP() ?? "";
      }
      String url = "http://${NativePlugin.remoteIP}:8880/demo/$path";
      if (method == "GET") {
        dynamic resp = await _dio.get(url, queryParameters: params);
        return resp;
      } else if (method == "POST") {
        return await _dio.post(url, data: body, queryParameters: params);
      } else {
        throw Exception("unsupported method $method, use GET or POST");
      }
  }

}
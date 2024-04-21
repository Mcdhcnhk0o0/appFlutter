

import 'package:app_flutter/tools/network.dart';
import 'package:app_flutter/tools/plugin.dart';
import 'package:dio/dio.dart';

class ChatRepository {

  var pageNum = 1;
  var pageSize = 20;

  Future<Response<dynamic>> getChatHistory({
    required String userId
  }) async {
    var result = Network.request(
        path: "chat/record/get",
        params: {
          "userId": userId,
          "pageNum": pageNum,
          "pageSize": pageSize
        }
    );
    return result;
  }

  Future<dynamic> sendMessageSync(String message) {
    dynamic result = Network.request(
        path: "llm/send/sync",
        params: {"message": message}
    );
    return result;
  }

}
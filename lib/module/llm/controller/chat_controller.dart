
import 'package:app_flutter/get/controller.dart';
import 'package:app_flutter/module/llm/repository/chat_repo.dart';
import 'package:app_flutter/tools/logger.dart';
import 'package:app_flutter/tools/plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../model/message.dart';

class ChatController extends BaseController {

  final repository = ChatRepository();

  final inputController = TextEditingController();

  final RxList<ChatMessage> messageList = RxList.empty(growable: true);
  final RxList<ChatMessage> historyList = RxList.empty(growable: true);

  void sendOutCurrentMessage() async {
    String message = inputController.text;
    if (message.isBlank!) {
      return;
    }
    messageList.add(ChatMessage(role: "user", content: message));
    inputController.text = "";
    var result = await repository.sendMessageSync(message);
    messageList.add(ChatMessage(role: "assistant", content: result.data["data"]));
  }

  void queryChatHistory() async {
    String userId = await NativePlugin.acquiredUserId();
    var resp = await repository.getChatHistory(userId: userId);
    List<ChatMessage> currentHistory = [];
    if (resp.data is Map && resp.data["data"] != null) {
      for (var each in resp.data["data"]) {
        currentHistory.add(ChatMessage.fromChatHistory(each));
      }
    }
    historyList.addAll(currentHistory);
    Log.d(resp);
  }

}
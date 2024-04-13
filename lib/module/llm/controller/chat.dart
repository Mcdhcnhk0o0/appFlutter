
import 'package:app_flutter/get/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatController extends BaseController {

  final inputController = TextEditingController();

  final RxList<ChatMessage> messageList = RxList.empty(growable: true);

  void sendOutCurrentMessage() {
    String message = inputController.text;
    messageList.add(ChatMessage(role: "user", content: message));
    messageList.add(ChatMessage(role: "assistant", content: "I received!!!"));
  }

}
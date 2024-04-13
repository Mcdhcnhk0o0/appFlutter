

import 'package:app_flutter/get/binding.dart';
import 'package:app_flutter/module/llm/controller/chat.dart';
import 'package:get/get.dart';


class LLMBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
        () => ChatController()
    );
  }

}
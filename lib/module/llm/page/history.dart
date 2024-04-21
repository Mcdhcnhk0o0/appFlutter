

import 'package:app_flutter/get/binding.dart';
import 'package:app_flutter/module/llm/binding/binding.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common/immersive.dart';
import '../../../get/view.dart';
import '../controller/chat_controller.dart';
import '../view/message_box.dart';

class LLMHistoryPage extends BindingView<ChatController> {

  LLMHistoryPage({super.key}) {

  }

  @override
  Widget build(BuildContext context) {
    controller.queryChatHistory();
    return ImmersivePage(
        body: body()
    );
  }

  Widget body() {
    return Column(
      children: [
        Container(height: 40,),
        Expanded(child: chatList())
      ],
    );
  }

  Widget chatList() {
    return Obx(() =>
        ListView.builder(
            itemCount: controller.historyList.length,
            itemBuilder: (context, index) {
              var item = controller.historyList[index];
              var sentBySelf = item.role == "user";
              if (sentBySelf) {
                return queryBox(context, item.content ?? "");
              } else {
                return replyBox(context, item.content ?? "");
              }
            }
        )
    );
  }

  @override
  BaseBinding createBinding() => LLMBinding();

}

import 'package:app_flutter/get/binding.dart';
import 'package:app_flutter/get/view.dart';
import 'package:app_flutter/module/llm/binding/binding.dart';
import 'package:app_flutter/module/llm/controller/chat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:get/get.dart';

import '../../../common/immersive.dart';
import '../view/message_box.dart';


class LLMMainPage extends BindingView<ChatController> {

  LLMMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImmersivePage(
      body: body()
    );
  }

  Widget body() {
    return Column(
      children: [
        innerTitle(),
        divider(),
        Expanded(child: chatList()),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Row(
            children: [
              Expanded(child: inputBox()),
              Container(width: 12),
              sendButton()
            ],
          ),
        )
      ],
    );
  }

  Widget innerTitle() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Chat with TongYi",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          GestureDetector(
            child: const Icon(Icons.history),
            onTap: () {
              BoostNavigator.instance.push("flutter://llm_history");
            },
          )
        ]
      ),
    );
  }

  Widget divider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 1,
      color: Colors.grey[400],
    );
  }

  Widget chatList() {
    return Obx(() =>
        ListView.builder(
            itemCount: controller.messageList.length,
            itemBuilder: (context, index) {
              var item = controller.messageList[index];
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

  Widget inputBox() {
    return TextField(
      controller: controller.inputController,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        border: OutlineInputBorder(),
        labelText: "请输入内容",
        labelStyle: TextStyle(fontSize: 14)
      ),
      maxLines: 1,
      style: const TextStyle(fontSize: 15, height: 1.5)
    );
  }

  Widget sendButton() {
    return SizedBox(
      height: 40,
      width: 80,
      child: ElevatedButton(
        child: const Text("发送"),
        onPressed: () {
          controller.sendOutCurrentMessage();
          controller.queryChatHistory();
        },
      ),
    );
  }

  @override
  BaseBinding createBinding() => LLMBinding();

}

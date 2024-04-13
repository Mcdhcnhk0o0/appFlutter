
import 'package:app_flutter/get/binding.dart';
import 'package:app_flutter/get/view.dart';
import 'package:app_flutter/module/llm/binding/binding.dart';
import 'package:app_flutter/module/llm/controller/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LLMMainPage extends BindingView<ChatController> {

  LLMMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(child: chatList()),
        Row(
          children: [
            Expanded(child: inputBox()),
            sendButton()
          ],
        )
      ],
    );
  }

  Widget chatList() {
    return ListView.builder(
        itemCount: controller.messageList.length,
        itemBuilder: (context, index) {
          var item = controller.messageList[index];
          return Container(
            height: 40,
            child: Text("${item.content}"),
          );
        }
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
    return Container(
      height: 40,
      width: 80,
      child: ElevatedButton(
        child: const Text("发送"),
        onPressed: () {
          controller.sendOutCurrentMessage();
        },
      ),
    );
  }

  @override
  BaseBinding createBinding() => LLMBinding();

}

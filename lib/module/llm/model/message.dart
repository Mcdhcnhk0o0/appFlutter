

import 'package:app_flutter/tools/plugin.dart';

class ChatMessage {

  String? role;
  String? content;
  String? timestamp;
  Map<String, Object>? extendInfo;

  ChatMessage({
    required this.role,
    required this.content
  }) {
    timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  }

  ChatMessage.fromJson(Map? json) {
    if (json?["role"] is String) role = json?["role"];
    if (json?["content"] is String) content = json?["content"];
    if (json?["timestamp"] is String) timestamp = json?["timestamp"];
    if (json?["extendInfo"] is Map) extendInfo = json?["extendInfo"];
  }

  ChatMessage.fromChatHistory(Map? json) {
    int userId = int.parse(NativePlugin.userId);
    if (json?["fromWho"] is int) role = json?["fromWho"] == userId ? "user" : "assistant";
    if (json?["message"] is String) content = json?["message"];
    if (json?["gmtCreate"] is String) timestamp = json?["gmtCreate"];
  }

}
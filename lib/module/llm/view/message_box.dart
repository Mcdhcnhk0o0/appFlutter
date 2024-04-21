import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget queryBox(BuildContext context, String message) {
  var maxWidth = MediaQuery.of(context).size.width * 0.8;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
            )
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(message, style: const TextStyle(color: Colors.black),)
        ),
      )
    ],
  );
}


Widget replyBox(BuildContext context, String message) {
  var maxWidth = MediaQuery.of(context).size.width * 0.8;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: const BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
            )
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(message, style: const TextStyle(color: Colors.white),)
        ),
      )
    ],
  );
}
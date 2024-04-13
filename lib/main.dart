import 'package:app_flutter/tools/plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'boost/binding.dart';
import 'module.dart';


void main() {

  // 分Module注册
  registerModule();

  // Boost Binding
  CustomFlutterBinding();

  // Plugin注册
  NativePlugin.init();

  // 分Module初始化
  MultiModule.initialize();

  // start
  runApp(const MyApp());

}


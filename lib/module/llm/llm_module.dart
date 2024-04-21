import 'package:app_flutter/boost/module.dart';
import 'package:app_flutter/boost/router.dart';
import 'package:app_flutter/module/llm/page/history.dart';
import 'package:app_flutter/module/llm/page/main.dart';


class LLMModule extends FlutterModule {

  @override
  List<SimpleRoute> supplyPages() {
    return [
      SimpleRoute(url: "flutter://llm_main", page: LLMMainPage()),
      SimpleRoute(url: "flutter://llm_history", page: LLMHistoryPage()),
    ];
  }

}
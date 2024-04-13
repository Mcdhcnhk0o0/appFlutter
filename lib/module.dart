import 'package:app_flutter/module/llm/llm_module.dart';
import 'boost/module.dart';
import 'module/ext/ext_module.dart';


class MultiModule {

  static List<FlutterModule> modules = [];

  static void register({required FlutterModule module}) {
    modules.add(module);
  }

  static void initialize() {
    for (var module in modules) {
      module.init();
    }
  }

}


void registerModule() {
  MultiModule.register(module: ExtModule());
  MultiModule.register(module: LLMModule());
}
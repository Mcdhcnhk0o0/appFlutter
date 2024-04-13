
import 'package:app_flutter/plugin/base/lib/base_platform_interface.dart';
import 'package:app_flutter/tools/logger.dart';


class NativePlugin {

  static String token = "";
  static String envSetting = "release";

  static String userId = "";

  static void init() async {
    try {
      token = await BasePlatform.instance.getUserToken() ?? "";
      userId = await BasePlatform.instance.getUserId() ?? "";
      envSetting = await BasePlatform.instance.getBaseUrlSetting() ?? "release";
    } catch (e) {
      Log.e("[Plugin] errors: ${e.toString()}");
    }

  }

}
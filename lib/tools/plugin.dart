
import 'package:app_flutter/plugin/base/lib/base_platform_interface.dart';


class NativePlugin {

  static String token = "";
  static String envSetting = "release";

  static int userId = -1;

  static void init() async {
    token = await BasePlatform.instance.getUserToken() ?? "";
    userId = await BasePlatform.instance.getUserId() ?? -1;
    envSetting = await BasePlatform.instance.getBaseUrlSetting() ?? "release";
  }

}
import 'package:app_flutter/plugin/base/lib/base_platform_interface.dart';
import 'package:app_flutter/tools/logger.dart';

class NativePlugin {
  static bool initialized = false;

  static String token = "";
  static String envSetting = "release";

  static String userId = "";

  static String remoteIP = "";
  static String localIP = "";

  static void init() async {
    try {
      token = await BasePlatform.instance.getUserToken() ?? "";
      userId = await BasePlatform.instance.getUserId() ?? "";
      envSetting = await BasePlatform.instance.getBaseUrlSetting() ?? "release";
      localIP = await BasePlatform.instance.getLocalIP() ?? "";
      remoteIP = await BasePlatform.instance.getRemoteIP() ?? "";
      initialized = true;
    } catch (e) {
      Log.e("[Plugin] errors: ${e.toString()}");
    }
  }

  static Future<String> acquiredUserId() async {
    if (!initialized) {
      return await BasePlatform.instance.getUserId() ?? "";
    }
    return userId;
  }
}

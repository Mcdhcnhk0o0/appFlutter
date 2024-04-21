import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_platform_interface.dart';


class MethodChannelBase extends BasePlatform {

  @visibleForTesting
  final methodChannel = const MethodChannel('base');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getBaseUrlSetting() async {
    return await methodChannel.invokeMethod<String>("getBaseUrlSetting");
  }

  @override
  Future<String?> getUserId() async {
    return await methodChannel.invokeMethod<String>("getUserId");
  }

  @override
  Future<String?> getUserToken() async {
    return await methodChannel.invokeMethod<String>("getToken");
  }

  @override
  Future<String?> getLocalIP() async {
    return await methodChannel.invokeMethod<String>("getLocalIP");
  }

  @override
  Future<String?> getRemoteIP() async {
    return await methodChannel.invokeMethod<String>("getRemoteIP");
  }

}

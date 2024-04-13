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
  Future<int?> getUserId() async {
    return await methodChannel.invokeMethod<int>("getUserId");
  }

  @override
  Future<String?> getUserToken() async {
    return await methodChannel.invokeMethod<String>("getToken");
  }

}

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_method_channel.dart';

abstract class BasePlatform extends PlatformInterface {

  BasePlatform() : super(token: _token);

  static final Object _token = Object();

  static BasePlatform _instance = MethodChannelBase();

  static BasePlatform get instance => _instance;

  static set instance(BasePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getUserToken();

  Future<int?> getUserId();

  Future<String?> getBaseUrlSetting();

}

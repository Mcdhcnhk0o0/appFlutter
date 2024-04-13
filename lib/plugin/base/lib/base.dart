
import 'base_platform_interface.dart';

class Base {
  Future<String?> getPlatformVersion() {
    return BasePlatform.instance.getPlatformVersion();
  }
}

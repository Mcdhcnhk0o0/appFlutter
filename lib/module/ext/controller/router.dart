

import 'package:app_flutter/boost/router.dart';
import 'package:app_flutter/get/controller.dart';
import 'package:app_flutter/tools/plugin.dart';

class RouterController extends BaseController {

  var routeList = BoostRouterManager.instance().queryAllRoute();

  var userId = NativePlugin.userId;

  var token = NativePlugin.token;

  var env = NativePlugin.envSetting;

}
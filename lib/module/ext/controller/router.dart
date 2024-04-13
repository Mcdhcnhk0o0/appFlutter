

import 'package:app_flutter/boost/router.dart';
import 'package:app_flutter/get/controller.dart';

class RouterController extends BaseController {

  var routeList = BoostRouterManager.instance().queryAllRoute();

}
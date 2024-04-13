import 'package:app_flutter/boost/router.dart';


abstract class FlutterModule {

  void init() {
    for (var route in supplyPages()) {
      BoostRouterManager.instance().registerRoute(route);
    }
  }

  List<SimpleRoute> supplyPages();

}
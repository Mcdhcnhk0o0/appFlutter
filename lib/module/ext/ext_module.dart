

import 'package:app_flutter/boost/module.dart';
import 'package:app_flutter/boost/router.dart';
import 'package:app_flutter/module/ext/page/router_center.dart';

class ExtModule extends FlutterModule {
  
  @override
  List<SimpleRoute> supplyPages() {
    return [
      SimpleRoute(url: "flutter://router_center", page: RouterCenterPage())
    ];
  }
  
}
import 'package:app_flutter/boost/error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../tools/logger.dart';


class SimpleRoute {

  String url;
  Widget page;

  SimpleRoute({
    required this.url,
    required this.page
  });

}



class BoostRouterManager {

  BoostRouterManager._();

  static final BoostRouterManager _instance = BoostRouterManager._();

  static BoostRouterManager instance() => _instance;

  final Set<SimpleRoute> _routeSet = {};
  final Map<String, FlutterBoostRouteFactory> _routeMap = {};

  void registerRoute(SimpleRoute route) {
    if (_routeSet.contains(route)) {
      throw Exception("duplicated route!");
    }
    _routeSet.add(route);
    _routeMap[route.url] = (RouteSettings settings, String? uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            return route.page;
          });
    };
  }

  Route<dynamic>? provideRouteFactory(RouteSettings settings, String? uniqueId) {
    if (!_routeMap.containsKey(settings.name)) {
      Log.e("[Failure] Page with name=${settings.name} not found!");
      return ErrorPage.error(settings);
    }
    var factory = _routeMap[settings.name] as FlutterBoostRouteFactory;
    Log.d("[Route] Page with name=${settings.name} found!");
    return factory(settings, uniqueId);
  }

  List<SimpleRoute> queryAllRoute() {
    return _routeSet.toList();
  }

}


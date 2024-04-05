import 'package:app_flutter/boost/error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'boost/demo_page.dart';

void main() {
  CustomFlutterBinding();
  runApp(const MyApp());
}

class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding { }


class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  Map<String, FlutterBoostRouteFactory> routeMap = {
    'flutter://demo1': (RouteSettings settings, String? uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) {
          return const DemoPage();
        }
      );
    }
  };
  
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    if (!routeMap.containsKey(settings.name)) {
      var errorMsg = "router ${settings.name} not found!!!";
      debugPrint(errorMsg);
      return CupertinoPageRoute(
          settings: settings,
          builder: (_) {
            return ErrorPage(errorMessage: errorMsg);
          }
      );
    }
    var factory = routeMap[settings.name] as FlutterBoostRouteFactory;
    return factory(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,
      builder: (context, widget) {
        return home;
      }
    );
  }
  
}


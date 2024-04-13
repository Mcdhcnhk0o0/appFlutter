import 'package:app_flutter/boost/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';


class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    var routeFactory = BoostRouterManager.instance().provideRouteFactory;
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
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


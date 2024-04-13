
import 'package:app_flutter/get/view.dart';
import 'package:app_flutter/module/ext/controller/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_boost/flutter_boost.dart';


class RouterCenterPage extends ControllerView<RouterController> {

  RouterCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: controller.routeList.length,
          itemBuilder: (context, index) {
            var item = controller.routeList[index];
            return ElevatedButton(
                onPressed: () {
                  BoostNavigator.instance.push(item.url, withContainer: true);
                },
                child: Text(item.url)
            );
          },
          separatorBuilder: (_, __) {
            return Container(
              height: 1,
              color: Colors.black12,
            );
          }
      ),
    );
  }

  @override
  RouterController createController() => RouterController();

}

import 'package:app_flutter/common/immersive.dart';
import 'package:app_flutter/get/view.dart';
import 'package:app_flutter/module/ext/controller/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_boost/flutter_boost.dart';


class RouterCenterPage extends ControllerView<RouterController> {

  RouterCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ImmersivePage(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            pluginBoard(),
            Expanded(child: routerList())
          ],
        ),
      )
    );
  }
  
  Widget pluginBoard() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("用户信息", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 2)),
          Text("UserId: ${controller.userId}", ),
          Text("UserToken: ${controller.token}", maxLines: 1, overflow: TextOverflow.ellipsis),
          Text("Environment: ${controller.env}"),
          Container(height: 20),
          const Text("路由信息", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 2))
        ],
      ),
    );
  }
  
  Widget routerList() {
    return ListView.separated(
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
    );
  }

  @override
  RouterController createController() => RouterController();

}
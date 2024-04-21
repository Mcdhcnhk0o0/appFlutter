

import 'package:app_flutter/common/app_bar.dart';
import 'package:app_flutter/get/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class ImmersivePage extends BaseView {

  final PreferredSizeWidget? appBar;
  final Widget body;

  const ImmersivePage({
    super.key,
    this.appBar,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
    var bar = appBar ?? safePaddingOnlyTitleBar();
    return Container(
      color: Colors.white,
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                  image: AssetImage("asset/page_background.webp")
              )
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: bar,
              body: body
          )
      ),
    );
  }

  PreferredSizeWidget safePaddingOnlyTitleBar() {
    return ImmersiveBar(
        title: Container(),
        leftAction: Container(),
        height: 0
    );
  }

}
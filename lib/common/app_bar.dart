import 'package:app_flutter/get/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_boost/flutter_boost.dart';

class ImmersiveBar extends BaseView implements PreferredSizeWidget {
  final Widget title;
  final Widget? leftAction;
  final List<Widget>? rightActions;

  final double? height;

  const ImmersiveBar(
      {super.key,
      required this.title,
      this.height = 44.0,
      this.leftAction = const DefaultBackArrow(),
      this.rightActions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: true, bottom: false, child: barContent());
  }

  Widget barContent() {
    List<Widget> actions = rightActions ?? [];
    return Container(
      color: Colors.transparent,
      height: height!,
      child: Row(
        children: [leftAction!, Expanded(child: title), ...actions],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}

class DefaultBackArrow extends BaseView {
  const DefaultBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const Icon(Icons.keyboard_arrow_left),
        onTap: () {
          BoostNavigator.instance.pop();
        });
  }
}

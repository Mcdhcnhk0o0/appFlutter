

import 'package:flutter/cupertino.dart';

class FragmentWrapper extends StatelessWidget {

  static const double bottomNavigationHeight = 56;

  final Widget child;

  const FragmentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: bottomNavigationHeight),
      child: child
    );
  }

}

import 'package:app_flutter/fragment/fragment_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterFragment extends StatefulWidget {

  const FlutterFragment({super.key});

  @override
  State<StatefulWidget> createState() => _FlutterFragmentState();

}


class _FlutterFragmentState extends State<FlutterFragment> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return FragmentWrapper(
        child: GestureDetector(
          child: Container(
              alignment: Alignment.center,
              child: Material(
                  child: Text("Flutter Fragment!!\n$_counter",
                      style: const TextStyle(fontSize: 24)
                  )
              )
          ),
          onTap: () {
            setState(() {
              _counter++;
            });
          },
        )
    );
  }

}
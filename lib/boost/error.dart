import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ErrorPage extends StatefulWidget {

  final String? errorMessage;

  const ErrorPage({super.key, this.errorMessage});

  @override
  State<StatefulWidget> createState() => _ErrorPageState();

  static Route<dynamic> error(RouteSettings settings) {
    var errorMsg = "router ${settings.name} not found!!!";
    return CupertinoPageRoute(
        settings: settings,
        builder: (_) {
          return ErrorPage(errorMessage: errorMsg);
        }
    );
  }

}


class _ErrorPageState extends State<ErrorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You see this page because there are some errors in flutter"),
            Container(height: 20),
            Text("${widget.errorMessage}")
          ],
        ),
      )
    );
  }

}
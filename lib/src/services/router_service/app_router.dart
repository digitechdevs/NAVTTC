import 'package:flutter/material.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navKey.currentContext!;

  static Future<void> push(Widget page) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<void> pushReplace(Widget page) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<void> pushAndRemoveUntil(Widget page) async {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static void pop() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

pushBack([dynamic data]) {
  return Navigator.of(navigatorKey.currentContext!).pop(data);
}

push(Widget child) {
  return Navigator.of(navigatorKey.currentContext!).push(
      MaterialPageRoute(builder: (context) => child,),);
}
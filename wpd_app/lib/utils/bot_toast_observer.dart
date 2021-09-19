import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class BotToastObserver extends BotToastNavigatorObserver
    implements RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page page) {}
}

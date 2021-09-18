import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/screens/home_screen.dart';
import 'package:wpd_app/ui/screens/splash_screen.dart';

abstract class AppStartup {
  static Future<void> setup() async {
    final _requestRest = serviceLocator<RequestREST>();

    if (kReleaseMode) {
      _requestRest.setUpLogger();
    }

    await Future.delayed(
      const Duration(seconds: 5),
    );
  }
}

class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  _StartUpPageState createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  late Future<void> startUpFuture;

  @override
  void initState() {
    super.initState();

    startUpFuture = AppStartup.setup();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: startUpFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const HomeScreen();
        }

        return const SplashScreen();
      },
    );
  }
}

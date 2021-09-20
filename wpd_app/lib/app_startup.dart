import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/screens/splash_screen.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';

abstract class AppStartup {
  static Future<void> setup() async {
    final _requestRest = serviceLocator<RequestREST>();

    if (kReleaseMode) {
      _requestRest.setUpLogger();
    }

    _requestRest.setUpErrorInterceptor();

    await Future.delayed(
      const Duration(seconds: 2),
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
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            final appState = context.read(AuthStateViewModelProvider.provider);
            appState.splashing = false;
          });
        }

        return const SplashScreen();
      },
    );
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/utils/app_theme.dart';
import 'package:wpd_app/utils/bot_toast_observer.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  setupServiceLocator(sharedPreferences: sharedPreferences);

  Routemaster.setPathUrlStrategy();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      DevicePreview(
        // enabled: !kReleaseMode,
        enabled: false,
        builder: (context) => const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final appState = ref.watch(AuthStateViewModelProvider.provider);
        final botToastBuilder = BotToastInit();

        return MaterialApp.router(
          title: 'WPD',
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: (context, child) {
            child = DevicePreview.appBuilder(context, child);
            child = botToastBuilder(context, child);

            return child;
          },
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) {
              if (appState.splashing) {
                return StartUpAppRoutes.routes;
              }

              return appState.isLoggedIn
                  ? AppRoutes.routes
                  : LogoutAppRoutes.routes;
            },
            observers: [BotToastObserver()],
          ),
          routeInformationParser: const RoutemasterParser(),
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}

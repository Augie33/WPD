import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/utils/app_theme.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  setupServiceLocator(sharedPreferences: sharedPreferences);

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final appState = watch(AuthStateViewModelProvider.provider);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) {
              return appState.isLoggedIn
                  ? AppRoutes.routes
                  : LogoutAppRoutes.routes;
            },
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

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/app_startup.dart';
import 'package:wpd_app/ui/screens/home_screen.dart';
import 'package:wpd_app/ui/screens/login_screen.dart';
import 'package:wpd_app/ui/screens/more_screen.dart';
import 'package:wpd_app/ui/screens/profile_screen.dart';
import 'package:wpd_app/ui/widgets/bottom_nav.dart';

abstract class AppRoutes {
  static final routes = RouteMap(routes: {
    // '/': (_) => const MaterialPage(child: StartUpPage()),
    '/': (_) => const CupertinoTabPage(
          child: BottomNav(),
          paths: ['/home', '/profile', '/more'],
        ),
    '/home': (_) => const MaterialPage(child: HomeScreen()),
    '/profile': (_) => const MaterialPage(child: ProfileScreen()),
    '/more': (_) => const MaterialPage(child: MoreScreen()),
    '/login': (_) => MaterialPage(child: LoginScreen()),
    // '/settings': (_) => MaterialPage(child: SettingsPage()),
    // '/feed/profile/:id': (info) =>
    //     MaterialPage(child: ProfilePage(id: info.pathParameters['id'])),
  });
}

abstract class LogoutAppRoutes {
  static final routes = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (_) => MaterialPage(child: LoginScreen()),
    },
  );
}

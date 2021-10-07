import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/app_startup.dart';
import 'package:wpd_app/ui/screens/add_case_screen.dart';
import 'package:wpd_app/ui/screens/edit_profile_screen.dart';
import 'package:wpd_app/ui/screens/favorite_screen.dart';
import 'package:wpd_app/ui/screens/home_screen.dart';
import 'package:wpd_app/ui/screens/login_screen.dart';
import 'package:wpd_app/ui/screens/more_screen.dart';
import 'package:wpd_app/ui/screens/profile_screen.dart';
import 'package:wpd_app/ui/screens/search_screen.dart';
import 'package:wpd_app/ui/screens/single_case_screen.dart';
import 'package:wpd_app/ui/widgets/bottom_nav.dart';

abstract class AppRoutes {
  static final routes = RouteMap(
    routes: {
      '/': (_) => const CupertinoTabPage(
            child: BottomNav(),
            paths: ['/home', '/favorite', '/profile', '/more'],
          ),
      '/home': (_) => const MaterialPage(child: HomeScreen()),
      '/favorite': (_) => const MaterialPage(child: FavoriteScreen()),
      '/profile': (_) => const MaterialPage(child: ProfileScreen()),
      '/more': (_) => const MaterialPage(child: MoreScreen()),
      '/login': (_) => MaterialPage(child: LoginScreen()),
      '/home/add': (_) => MaterialPage(child: AddCaseScreen()),
      '/home/search': (_) => const MaterialPage(child: SearchCasesScreen()),
      '/profile/edit': (_) => const MaterialPage(child: EditProfileScreen()),
      '/case/:id': (info) => MaterialPage(
            child: SingleCaseScreen(caseId: info.pathParameters['id']),
          ),
      '/case/:id/qr': (info) => const MaterialPage(child: QRScreen()),
      '/case/:id/email': (info) => MaterialPage(child: EmailScreen()),
    },
    onUnknownRoute: (_) => const Redirect('/'),
  );
}

abstract class StartUpAppRoutes {
  static final routes = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (_) => const MaterialPage(child: StartUpPage()),
    },
  );
}

abstract class LogoutAppRoutes {
  static final routes = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (_) => MaterialPage(child: LoginScreen()),
    },
  );
}

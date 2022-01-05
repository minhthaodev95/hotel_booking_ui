import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/homepage.dart';
import 'package:online_learning_huweii/src/login_screen.dart';
import 'package:online_learning_huweii/src/splash_screen.dart';
import 'package:online_learning_huweii/src/walk_thourgh.dart';
import 'package:online_learning_huweii/src/widgets/date_selected.dart';
import 'package:online_learning_huweii/src/widgets/location_selected.dart';

import '../../signup_screen.dart';

class AppRoutes {
  static Route? onGenarateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const SplashScreen());
      case '/home':
        return _materialRoute(HomePage());
      case '/login':
        return _materialRoute(const LoginScreen());
      case '/signup':
        return _materialRoute(const SignupScreen());
      case '/walk_through':
        return _materialRoute(const WalkThrough());
      // case '/location_selected':
      //   return _materialRoute(LocationSelected());

      // case '/date_selected':
      //   return _materialRoute(const DateSelected());
    }
  }

  static Route? _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

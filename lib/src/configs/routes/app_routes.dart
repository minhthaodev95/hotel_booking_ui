import 'package:flutter/material.dart';
import 'package:hotel_booking/src/screens/homepage.dart';
import 'package:hotel_booking/src/screens/hotels_listing.dart';
import 'package:hotel_booking/src/screens/login_screen.dart';
import 'package:hotel_booking/src/screens/walk_thourgh.dart';

import '../../screens/signup_screen.dart';

class AppRoutes {
  static Route? onGenarateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(HomePage());
      case '/home':
        return _materialRoute(HomePage());
      case '/login':
        return _materialRoute(const LoginScreen());
      case '/signup':
        return _materialRoute(const SignupScreen());
      case '/walk_through':
        return _materialRoute(const WalkThrough());
      case '/hotel_listing':
        return _materialRoute(const HotelsListing());
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

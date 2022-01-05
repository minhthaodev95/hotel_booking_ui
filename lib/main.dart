import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/configs/routes/app_routes.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      onGenerateRoute: AppRoutes.onGenarateRoutes,
    );
  }
}

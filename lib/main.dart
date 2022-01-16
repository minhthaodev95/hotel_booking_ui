import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/models/info_hotel_searching.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_learning_huweii/src/configs/routes/app_routes.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory tempDir = await getTemporaryDirectory();
  await Hive.initFlutter(tempDir.path);
  Hive.registerAdapter(InfoHotelSearchingAdapter());
  await Hive.openBox('infoBox');

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

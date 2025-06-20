import 'package:flutter/material.dart';
import 'package:one_for_all_example/navigation/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavigationRoutes.splash,
      onGenerateRoute: AppNavigation.onGenerateRoute,
      navigatorKey: AppNavigation.navigatorKey,
      


    );
  }
}

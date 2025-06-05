import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all_example/navigation/app_navigation.dart';
import 'package:one_for_all_example/utils/app_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Create storage
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    try {
      Future.delayed(const Duration(milliseconds: 2500), () async {
        if (mounted) {
          _navigatorPage();
        }
      });
    } catch (e) {
      lg(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Center(
          child: Image.network(
            "https://media.gettyimages.com/id/2197735898/photo/majestic-lioness-observing-the-serengeti-plains.jpg?s=2048x2048&w=gi&k=20&c=lJ_TV2ZBjlrEJhRscNlOsxYdNYZX9VY2y0jGROHy-Ek=",
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }

  Future<void> _navigatorPage() async {
    try {
      AppNavigation.goToHomeScreen();
    } catch (e) {
      AppNavigation.goToHomeScreen();
    }
  }
}

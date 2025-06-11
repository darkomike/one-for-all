import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all_example/screens/battery_screen.dart';
import 'package:one_for_all_example/screens/device_screen.dart';
import 'package:one_for_all_example/screens/home_screen.dart';
import 'package:one_for_all_example/screens/network_screen.dart';
import 'package:one_for_all_example/screens/splash_screen.dart';

class AppNavigationRoutes {
  AppNavigationRoutes._();
  static const splash = "/splash";
  static const home = "/home";
  static const batteryInfo = "/batteryInfo";
  static const deviceInfo = "/deviceInfo";
  static const networkInfo = "/networkInfo";
}

class AppNavigation {
  static final navigatorKey = GlobalKey<NavigatorState>();

  AppNavigation._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return openRoute(
      widget: _buildWidget(route: settings.name, data: settings.arguments),
      settings: settings,
    );
  }

  static _buildWidget({String? route, dynamic data}) {
    switch (route) {
      case AppNavigationRoutes.splash:
        return const SplashScreen();
      case AppNavigationRoutes.home:
        return const HomeScreen();
      case AppNavigationRoutes.batteryInfo:
        return const BatteryScreen();
      case AppNavigationRoutes.deviceInfo:
        return const DeviceScreen();
      case AppNavigationRoutes.networkInfo:
          return const NetworkScreen();
        
      default:
        return Text(
          "No route defined for $route",
        );
    }
  }

  static openRoute({required Widget widget, RouteSettings? settings}) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (context) => widget,
            settings: settings,
          )
        : MaterialPageRoute(builder: (context) => widget, settings: settings);
  }

  static push<T extends Object?>(
    String route, {
    dynamic arguments,
    bool replace = false,
    bool clearStack = false,
    String? clearUntilRoute,
  }) {
    if (clearStack) {
      clearUntilRoute = "";
    }
    if (clearUntilRoute != null) {
      return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        route,
        (route) => clearUntilRoute?.isEmpty == true
            ? false
            : route.settings.name == clearUntilRoute,
        arguments: arguments,
      );
    } else {
      if (replace) {
        return navigatorKey.currentState?.pushReplacementNamed(
          route,
          arguments: arguments,
        );
      }
      return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
    }
  }

  static pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      return Navigator.pop(context, result);
    }
    SystemNavigator.pop();
  }
 
//Home
  static goToHomeScreen() {
    push(AppNavigationRoutes.home, clearStack: true, replace: true);
  }

  //Battery Info
  static goToBatteryInfoScreen() {
    push(AppNavigationRoutes.batteryInfo, clearStack: false, replace: false); 
  }

  // Device Info
  static goToDeviceInfoScreen() {
    push(AppNavigationRoutes.deviceInfo, clearStack: false, replace: false);  

  }

  // Network Info
  static goToNetworkInfoScreen() {
    push(AppNavigationRoutes.networkInfo, clearStack: false, replace: false);  
  }
  
}

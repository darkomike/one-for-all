import 'package:flutter/material.dart';
import 'package:one_for_all_example/navigation/app_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One For All Plugin App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  AppNavigation.goToBatteryInfoScreen();
                },
                child: const Text('Get Battery Info')),
            TextButton(

                onPressed: () {
                  AppNavigation.goToDeviceInfoScreen();
                },
                child: const Text('Get Device Info')),
                
          ],
        ),
      ),
    );
  }
}

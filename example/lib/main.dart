import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:one_for_all/device/battery_info.dart';
import 'package:one_for_all/device/device_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _batteryLevel = 0;
  bool _isCharging = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    int batteryLevel = 0;
    bool isCharging = false;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await DeviceInfo.instance.getPlatformVersion() ??
          'Unknown platform version';
      batteryLevel = await BatteryInfo.instance.getBatteryInfo();

      isCharging = await BatteryInfo.instance.isBatteryCharging();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      batteryLevel = 0;
      isCharging = false;
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _batteryLevel = batteryLevel;
      _isCharging = isCharging;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('One For All Plugin app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('Battery level: $_batteryLevel\n'),
              Text("Battery Charging: $_isCharging\n"),
            ],
          ),
        ),
      ),
    );
  }
}

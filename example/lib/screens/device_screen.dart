import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all_platform/device/device.dart';
import 'package:one_for_all_platform/device/model/device_info.dart';
import 'package:one_for_all_example/navigation/app_navigation.dart';
import 'package:one_for_all_example/utils/app_utils.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  DeviceInfo _deviceInfo = DeviceInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    DeviceInfo deviceInfo = DeviceInfo();
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      deviceInfo = await Device.instance.getDeviceInfo();
    } on PlatformException {
      lg('Failed to get battery info.');
    }

    if (!mounted) return;

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AppNavigation.goToHomeScreen();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Device Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Device manufacturer : ${_deviceInfo.manufacturer}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device model : ${_deviceInfo.model}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device brand : ${_deviceInfo.brand}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device device : ${_deviceInfo.device}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device version sdk : ${_deviceInfo.versionSdk}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device version release : ${_deviceInfo.versionRelease}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device android id : ${_deviceInfo.androidId}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device app version : ${_deviceInfo.appVersion}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device package name : ${_deviceInfo.packageName}\n',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

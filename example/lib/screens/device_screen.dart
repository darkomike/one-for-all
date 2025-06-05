import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all/battery/battery.dart';
import 'package:one_for_all/battery/model/battery_info.dart';
import 'package:one_for_all/device/device.dart';
import 'package:one_for_all/device/model/device_info.dart';
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

    if (!mounted) return ;

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Device manufacturer : ${_deviceInfo.manufacturer}\n'),
            Text('Device model : ${_deviceInfo.model}\n'),
            Text('Device brand : ${_deviceInfo.brand}\n'),
            Text('Device device : ${_deviceInfo.device}\n'),
            Text('Device version sdk : ${_deviceInfo.versionSdk}\n'),
            Text('Device version release : ${_deviceInfo.versionRelease}\n'),
            Text('Device android id : ${_deviceInfo.androidId}\n'),
            Text('Device app version : ${_deviceInfo.appVersion}\n'),
            Text('Device package name : ${_deviceInfo.packageName}\n'),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all/battery/battery.dart';
import 'package:one_for_all/battery/model/battery_info.dart';
import 'package:one_for_all/device/device.dart';
import 'package:one_for_all_example/utils/app_utils.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  BatteryInfo _batteryInfo = BatteryInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    BatteryInfo batteryInfo = BatteryInfo();
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      batteryInfo = await Battery.instance.getBatteryInfo();
    } on PlatformException {
      lg('Failed to get battery info.');
    }

    if (!mounted) return ;

    setState(() {
      _batteryInfo = batteryInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Battery level: ${_batteryInfo.level}\n'),
            Text("Battery Charging: ${_batteryInfo.chargingStatus}\n"),
            Text('Battery Health: ${_batteryInfo.health}\n'),
            Text('Battery Technology: ${_batteryInfo.technology}\n'),
            Text('Battery Voltage: ${_batteryInfo.voltage}\n'), 
            
            Text('Battery Temperature: ${_batteryInfo.temperature}\n'),
            Text('Battery Capacity: ${_batteryInfo.chargingSource}\n'),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all_platform/device/device.dart';
import 'package:one_for_all_platform/device/model/device_info.dart';
import 'package:one_for_all_example/navigation/app_navigation.dart';
import 'package:one_for_all_example/utils/app_utils.dart';
import 'package:one_for_all_platform/network/model/network_info.dart';
import 'package:one_for_all_platform/network/network.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  NetworkInfo _networkInfo = NetworkInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    NetworkInfo networkInfo = NetworkInfo();
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      networkInfo = await Network.instance.getNetworkInfo();
    } on PlatformException {
      lg('Failed to get battery info.');
    }

    if (!mounted) return;

    setState(() {
      _networkInfo = networkInfo;
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
        title: const Text('Network Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Network Connection Type : ${_networkInfo.connectionType}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Network Connection Status : ${_networkInfo.isConnected}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Device IP Address : ${_networkInfo.ipAddress}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Network Operator Name : ${_networkInfo.networkOperatorName}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Network Roaming Status : ${_networkInfo.isRoaming}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Network Wifi SSID : ${_networkInfo.wifiSSID}\n',
              textAlign: TextAlign.center,
            ),
            Text(
              'Network Type : ${_networkInfo.networkType}\n',
              textAlign: TextAlign.center,
            ),
           
          ],
        ),
      ),
    );
  }
}



   
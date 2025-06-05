import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:one_for_all/battery/model/battery_info.dart';
import 'package:one_for_all/device/model/device_info.dart';
import 'package:one_for_all/utils/utils.dart';
import 'one_for_all_platform_interface.dart';

/// An implementation of [OneForAllPlatform] that uses method channels.
class MethodChannelOneForAll extends OneForAllPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(
      'com.mikesoftstudio.one_for_all.one_for_all_sdk.methods');


  
  @override
  Future<DeviceInfo> getDeviceInfo() async {
    final deviceInfoMap = await methodChannel.invokeMethod('getDeviceInfo');

    final deviceInfo =
        DeviceInfo.fromJson(castToMapStringDynamic(deviceInfoMap));
    return deviceInfo;
  }

  @override
  Future<BatteryInfo> getBatteryInfo() async {
    final batteryInfoMap = await methodChannel.invokeMethod('getBatteryInfo');
    final batteryInfo =
        BatteryInfo.fromJson(castToMapStringDynamic(batteryInfoMap));
    log('Battery Info: ${batteryInfo.toString()}');
    return batteryInfo;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'one_for_all_platform_interface.dart';

/// An implementation of [OneForAllPlatform] that uses method channels.
class MethodChannelOneForAll extends OneForAllPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.mikesoftstudio.one_for_all.one_for_all_sdk.methods');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> getBatteryLevel() async {
    final batteryLevel = await methodChannel.invokeMethod<int>('getBatteryLevel');
    return batteryLevel;
  }

  @override
  Future<bool?> isBatteryCharging() async {
    final isCharging = await methodChannel.invokeMethod<bool>('isBatteryCharging');
    return isCharging;
  }
}

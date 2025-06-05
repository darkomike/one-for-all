

import 'package:one_for_all/one_for_all_platform_interface.dart';

class DeviceInfo {
  DeviceInfo._();

  static final DeviceInfo _instance = DeviceInfo._();
  static DeviceInfo get instance => _instance;

   Future<String?> getPlatformVersion() {
    return OneForAllPlatform.instance.getPlatformVersion();
  }
}
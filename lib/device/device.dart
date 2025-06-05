

import 'package:one_for_all/device/model/device_info.dart';
import 'package:one_for_all/one_for_all_platform_interface.dart';

class Device{
  Device._();

  static final Device _instance = Device._();
  static Device get instance => _instance;

   Future<DeviceInfo> getDeviceInfo() {
    return OneForAllPlatform.instance.getDeviceInfo();
  }
}
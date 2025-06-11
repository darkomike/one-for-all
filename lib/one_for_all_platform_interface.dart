import 'package:one_for_all_platform/battery/model/battery_info.dart';
import 'package:one_for_all_platform/device/model/device_info.dart';
import 'package:one_for_all_platform/network/model/network_info.dart';
import 'package:one_for_all_platform/network/network.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'one_for_all_method_channel.dart';

abstract class OneForAllPlatform extends PlatformInterface {
  /// Constructs a OneForAllPlatform.
  OneForAllPlatform() : super(token: _token);

  static final Object _token = Object();

  static OneForAllPlatform _instance = MethodChannelOneForAll();

  /// The default instance of [OneForAllPlatform] to use.
  ///
  /// Defaults to [MethodChannelOneForAll].
  static OneForAllPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OneForAllPlatform] when
  /// they register themselves.
  static set instance(OneForAllPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<DeviceInfo> getDeviceInfo() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<BatteryInfo> getBatteryInfo() {
    throw UnimplementedError('getBatteryInfo() has not been implemented.');
  }
 
  Future<NetworkInfo> getNetworkInfo() {
    throw UnimplementedError('getBatteryInfo() has not been implemented.');
  }

  
}

import 'package:one_for_all_platform/battery/model/battery_info.dart';
import 'package:one_for_all_platform/one_for_all_platform_interface.dart';

class Battery {
  /// Singleton instance of [Battery]
  /// Use [Battery.instance] to access the singleton instance.
  Battery._();

  static final Battery _instance = Battery._();
  static Battery get instance => _instance;

  BatteryInfo _batteryInfo = BatteryInfo();

  /// Gets the current battery information.
  /// Returns a [BatteryInfo] object containing the battery level, charging status, health, and technology.
  /// Throws an [UnimplementedError] if the platform does not implement this method.
  BatteryInfo get batteryInfo => _batteryInfo;
  Future<BatteryInfo> getBatteryInfo() async {
    _batteryInfo = await OneForAllPlatform.instance.getBatteryInfo();
    return _batteryInfo;
  }

  /// Returns a [String] representing the platform version.
  /// Throws an [UnimplementedError] if the platform does not implement this method.
  @override
  String toString() {
    return 'BatteryInfo(level: ${_batteryInfo.level}, isCharging: $_batteryInfo.isCharging, health: ${_batteryInfo.health}, technology: ${_batteryInfo.technology})';
  }
}

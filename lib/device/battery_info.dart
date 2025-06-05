import 'package:one_for_all/one_for_all_platform_interface.dart';

class BatteryInfo {
  BatteryInfo._();

  static final BatteryInfo _instance = BatteryInfo._();
    static BatteryInfo get instance => _instance;


   bool _isCharging = false;
  int _level = 0;



  get isCharging => _isCharging;
  get level => _level;

   Future<int> getBatteryInfo()async {
    _level = await  OneForAllPlatform.instance.getBatteryLevel() ?? 0;
    return _level;
  }

  Future<bool> isBatteryCharging() async {
    _isCharging = await OneForAllPlatform.instance.isBatteryCharging() ?? false;
    return _isCharging;
  }



  @override
  String toString() {
    return 'BatteryInfo(level: $level, isCharging: $isCharging)';
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:one_for_all_platform/battery/model/battery_info.dart';
import 'package:one_for_all_platform/device/device.dart';
import 'package:one_for_all_platform/device/model/device_info.dart';
import 'package:one_for_all_platform/network/model/network_info.dart';
import 'package:one_for_all_platform/one_for_all_platform_interface.dart';
import 'package:one_for_all_platform/one_for_all_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOneForAllPlatform
    with MockPlatformInterfaceMixin
    implements OneForAllPlatform {

  @override
  Future<DeviceInfo> getDeviceInfo() => Future.value(DeviceInfo());

  @override
  Future<BatteryInfo> getBatteryInfo() => Future.value(BatteryInfo());

  @override
  Future<NetworkInfo> getNetworkInfo() => Future.value(NetworkInfo());
}

void main() {
  final OneForAllPlatform initialPlatform = OneForAllPlatform.instance;

  test('$MethodChannelOneForAll is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOneForAll>());
  });

  test('getPlatformVersion', () async {
    MockOneForAllPlatform fakePlatform = MockOneForAllPlatform();
    OneForAllPlatform.instance = fakePlatform;

    expect((await Device.instance.getDeviceInfo()).appVersion, '42');
  });
}

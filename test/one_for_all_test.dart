import 'package:flutter_test/flutter_test.dart';
import 'package:one_for_all/device/device_info.dart';
import 'package:one_for_all/one_for_all_platform_interface.dart';
import 'package:one_for_all/one_for_all_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOneForAllPlatform
    with MockPlatformInterfaceMixin
    implements OneForAllPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int?> getBatteryLevel() => Future.value(0);

  @override
  Future<bool?> isBatteryCharging() => Future.value(false);
}

void main() {
  final OneForAllPlatform initialPlatform = OneForAllPlatform.instance;

  test('$MethodChannelOneForAll is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOneForAll>());
  });

  test('getPlatformVersion', () async {
    MockOneForAllPlatform fakePlatform = MockOneForAllPlatform();
    OneForAllPlatform.instance = fakePlatform;

    expect(await DeviceInfo.instance.getPlatformVersion(), '42');
  });
}

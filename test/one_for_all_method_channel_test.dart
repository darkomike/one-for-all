import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_for_all/one_for_all_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelOneForAll platform = MethodChannelOneForAll();
  const MethodChannel channel = MethodChannel('one_for_all');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect((await platform.getDeviceInfo()).appVersion, '42');
  });
}

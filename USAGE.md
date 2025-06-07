# Device and Battery API Usage

This document explains how to use the Device and Battery APIs provided by the `one_for_all_platform` Flutter plugin.

## Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  one_for_all_platform: 0.0.1
    
```

Import the required classes in your Dart file:

```dart
import 'package:one_for_all_platform/device/device.dart';
import 'package:one_for_all_platform/battery/battery.dart';
```

---

## Device API

### Get Device Information

Use the `Device` singleton to fetch device information:

```dart
final deviceInfo = await Device.instance.getDeviceInfo();
print('Manufacturer: \\${deviceInfo.manufacturer}');
print('Model: \\${deviceInfo.model}');
print('Brand: \\${deviceInfo.brand}');
print('Device: \\${deviceInfo.device}');
print('SDK Version: \\${deviceInfo.versionSdk}');
print('Release Version: \\${deviceInfo.versionRelease}');
print('Android ID: \\${deviceInfo.androidId}');
print('App Version: \\${deviceInfo.appVersion}');
print('Package Name: \\${deviceInfo.packageName}');
```

---

## Battery API

### Get Battery Information

Use the `Battery` singleton to fetch battery information:

```dart
final batteryInfo = await Battery.instance.getBatteryInfo();
print('Level: \\${batteryInfo.level}%');
print('Charging Status: \\${batteryInfo.chargingStatus}');
print('Charging Source: \\${batteryInfo.chargingSource}');
print('Health: \\${batteryInfo.health}');
print('Temperature: \\${batteryInfo.temperature}°C');
print('Voltage: \\${batteryInfo.voltage}mV');
print('Technology: \\${batteryInfo.technology}');
```

---

## Example

```dart
import 'package:one_for_all_platform/device/device.dart';
import 'package:one_for_all_platform/battery/battery.dart';

void main() async {
  final deviceInfo = await Device.instance.getDeviceInfo();
  final batteryInfo = await Battery.instance.getBatteryInfo();
  print(deviceInfo);
  print(batteryInfo);
}
```

---

For more details, see the API documentation or the example app in the `example/` directory.

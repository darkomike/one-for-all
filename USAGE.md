# Device and Battery API Usage

This document explains how to use the Device and Battery APIs provided by the `one_for_all_platform` Flutter plugin.

## Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  one_for_all_platform:
    git:
      url: https://github.com/darkomike/one-for-all.git
      ref: v0.0.2

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

## Network API

### Get Network Information

> **Note:** The Network API currently supports **Android**. Support for other platforms will be added in future updates.

Use the `Network` singleton to fetch network information:

```dart
import 'package:one_for_all/network/network.dart';

final networkInfo = await Network.instance.getNetworkInfo();
print('Network Connection Type : ${_networkInfo.connectionType}\n');
print('Device IP Address : ${_networkInfo.ipAddress}\n');
print('Network Operator Name : ${_networkInfo.networkOperatorName}\n',);
print('Network Roaming Status : ${_networkInfo.isRoaming}\n',);
print('Network Wifi SSID : ${_networkInfo.wifiSSID}\n');
print('Network Connection Status : ${_networkInfo.isConnected}\n')
print('Network Type : ${_networkInfo.networkType}\n')



```

---

## Android Permissions

Add the following permissions to your `android/app/src/main/AndroidManifest.xml` file:

```xml
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
```

---

## Example

```dart
import 'package:one_for_all_platform/device/device.dart';
import 'package:one_for_all_platform/battery/battery.dart';

void main() async {
  final deviceInfo = await Device.instance.getDeviceInfo();
  final batteryInfo = await Battery.instance.getBatteryInfo();
  final networkInfo = await Network.instance.getNetworkInfo();
  print(deviceInfo);
  print(batteryInfo);
  print(networkInfo);
}
```

---

For more details, see the API documentation or the example app in the `example/` directory.

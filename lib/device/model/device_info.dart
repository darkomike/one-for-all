class DeviceInfo {
  
//   {
//   "deviceModel": "iPhone",
//   "manufacturer": "Apple",
//   "osVersion": "17.4.1",
//   "sdkVersion": 17,
//   "identifier": "A1B2-C3D4-E5F6-G7H8",
//   "appVersion": "1.0.0",
//   "packageName": "com.example.myapp"
// }

  final String manufacturer;
  final String model;
  final String brand;
  final String device;
  final String versionSdk;
  final String versionRelease;
  final String androidId;
  final String appVersion;
  final String packageName;

  DeviceInfo({
    this.manufacturer = 'Unknown',
    this.model = 'Unknown',
    this.brand = 'Unknown',
    this.device = 'Unknown',
    this.versionSdk = 'Unknown',
    this.versionRelease = 'Unknown',
    this.androidId = 'Unknown',
    this.appVersion = 'Unknown',
    this.packageName = 'Unknown',
  });

  DeviceInfo copyWith({
    String? manufacturer,
    String? model,
    String? brand,
    String? device,
    String? versionSdk,
    String? versionRelease,
    String? androidId,
    String? appVersion,
    String? packageName,
  }) {
    return DeviceInfo(
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      device: device ?? this.device,
      versionSdk: versionSdk ?? this.versionSdk,
      versionRelease: versionRelease ?? this.versionRelease,
      androidId: androidId ?? this.androidId,
      appVersion: appVersion ?? this.appVersion,
      packageName: packageName ?? this.packageName,
    );
  }

  DeviceInfo.fromJsonAndroid(Map<String, dynamic> json)
      : manufacturer = json['manufacturer'] ?? 'Unknown',
        model = json['model'] ?? 'Unknown',
        brand = json['brand'] ?? 'Unknown',
        device = json['device'] ?? 'Unknown',
        versionSdk = json['version_sdk'] ?? 'Unknown',
        versionRelease = json['version_release'] ?? 'Unknown',
        androidId = json['android_id'] ?? 'Unknown',
        appVersion = json['app_version'] ?? 'Unknown',
        packageName = json['package_name'] ?? 'Unknown';

  DeviceInfo.fromJsonIOS(Map<String, dynamic> json)
      : manufacturer = json['manufacturer'] ?? 'Unknown',
        model = json['deviceModel'] ?? 'Unknown',
        brand = json['deviceModel'] ?? 'Unknown',
        device = json['deviceModel'] ?? 'Unknown',
        versionSdk = json['version_sdk']?.toString() ?? 'Unknown',
        versionRelease = json['osVersion'] ?? 'Unknown',
        androidId = json['identifier'] ?? 'Unknown',
        appVersion = json['app_version'] ?? 'Unknown',
        packageName = json['package_name'] ?? 'Unknown';




  Map<String, dynamic> toJson() {
    return {
      'manufacturer': manufacturer,
      'model': model,
      'brand': brand,
      'device': device,
      'version_sdk': versionSdk,
      'version_release': versionRelease,
      'android_id': androidId,
      'app_version': appVersion,
      'package_name': packageName,
    };
  }

  @override
  String toString() {
    return 'DeviceInfo(manufacturer: $manufacturer, model: $model, brand: $brand, device: $device, versionSdk: $versionSdk, versionRelease: $versionRelease, androidId: $androidId, appVersion: $appVersion, packageName: $packageName)';
  }
}

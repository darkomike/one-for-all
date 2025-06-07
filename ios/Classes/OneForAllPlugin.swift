import Flutter
import UIKit

public class OneForAllPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.mikesoftstudio.one_for_all.one_for_all_sdk.methods", binaryMessenger: registrar.messenger())
    let instance = OneForAllPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDeviceInfo":
        result(self.getDeviceInfo())
    case "getBatteryInfo":
        result(self.getBatteryInfo())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    
    private func getDeviceInfo() -> [String: Any] {
      let device = UIDevice.current
      let bundle = Bundle.main

      let appVersion = bundle.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
      let packageName = bundle.bundleIdentifier ?? "Unknown"
      let osVersion = device.systemVersion
      let sdkVersion = ProcessInfo().operatingSystemVersion.majorVersion

      return [
        "deviceModel": device.model,
        "manufacturer": "Apple",
        "osVersion": osVersion,
        "version_sdk": sdkVersion,
        "identifier": device.identifierForVendor?.uuidString ?? "Unknown",
        "app_version": appVersion,
        "package_name": packageName
      ]
    }
    
    
    private func getBatteryInfo() -> [String: Any] {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true

      let level = Int(device.batteryLevel * 100)
      let status: String
      switch device.batteryState {
      case .charging:
        status = "Charging"
      case .full:
        status = "Full"
      case .unplugged:
        status = "Unplugged"
      default:
        status = "Unknown"
      }

      return [
        "level": level,
        "status": status,
        "source": "Unavailable",         // iOS does not expose USB/Wireless
        "health": "Unavailable",         // iOS does not expose battery health
        "temperature": 0.0,    // iOS does not expose temperature
        "voltage": 0,        // iOS does not expose voltage
        "technology": "Li-ion"           // Assumed technology for modern iPhones
      ]
    }
    
    
}

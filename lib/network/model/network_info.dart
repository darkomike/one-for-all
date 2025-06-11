

import 'dart:developer';

class NetworkInfo {

  final String connectionType;
  final bool isConnected;
  final String wifiSSID;
  final String ipAddress;
  final String networkOperatorName;
  final bool isRoaming;
  final String networkType;

  NetworkInfo({
     this.connectionType = 'Unknown',
    this.isConnected = false,
    this.wifiSSID = 'Unknown',
    this.ipAddress = 'Unknown',
    this.networkOperatorName = 'Unknown',
    this.isRoaming = false,
    this.networkType = 'Unknown',
  });

  factory NetworkInfo.fromJson(Map<String, dynamic> json) {
    log('NetworkInfo.fromJson: $json');
    return NetworkInfo(
      connectionType: json['connectionType'] ?? 'Unknown',
      isConnected: json['isConnected'] ?? false,
      wifiSSID: checkWiFiSSID(json['wifiSSID']),
      ipAddress: json['ipAddress'] ?? 'Unknown',
      networkOperatorName: json['networkOperatorName'] ?? 'Unknown',
      isRoaming: json['isRoaming'] ?? false,
      networkType: json['networkType'] ?? 'Unknown',
    );
  }
   

  Map<String, dynamic> toJson() {
    return {
      'connectionType': connectionType,
      'isConnected': isConnected,
      'wifiSSID': wifiSSID,
      'ipAddress': ipAddress,
      'networkOperatorName': networkOperatorName,
      'isRoaming': isRoaming,
      'networkType': networkType,
    };
  }

  NetworkInfo copyWith({
    String? connectionType,
    bool? isConnected,
    String? wifiSSID,
    String? ipAddress,
    String? networkOperatorName,
    bool? isRoaming,
    String? networkType,
  }) {
    return NetworkInfo(
      connectionType: connectionType ?? this.connectionType,
      isConnected: isConnected ?? this.isConnected,
      wifiSSID: wifiSSID ?? this.wifiSSID,
      ipAddress: ipAddress ?? this.ipAddress,
      networkOperatorName: networkOperatorName ?? this.networkOperatorName,
      isRoaming: isRoaming ?? this.isRoaming,
      networkType: networkType ?? this.networkType,
    );
  }


 static String checkWiFiSSID (String value) {
    if(value.trim() == "<unknown ssid>"){
      return "Unknown";
    } else {
      return value;
    }
  }

  @override
  String toString() {
    return 'NetworkInfo{connectionType: $connectionType, isConnected: $isConnected, wifiSSID: $wifiSSID, ipAddress: $ipAddress, networkOperatorName: $networkOperatorName, isRoaming: $isRoaming, networkType: $networkType}';
  }
}
class BatteryInfo {
  final int level;
  final String chargingStatus;
  final String chargingSource;
  final String health;
  final double temperature;
  final int voltage;
  final String technology;

  BatteryInfo({
     this.level = 0,
    this.chargingStatus = 'unknown',
    this.chargingSource = 'unknown',
    this.health = 'unknown',
    this.temperature = 0.0,
    this.voltage = 0,
    this.technology = 'unknown', 
  });

  BatteryInfo copyWith({
    int? level,
    String? chargingStatus,
    String? chargingSource,
    String? health,
    double? temperature,
    int? voltage,
    String? technology,
  }) {
    return BatteryInfo(
      level: level ?? this.level,
      chargingStatus: chargingStatus ?? this.chargingStatus,
      chargingSource: chargingSource ?? this.chargingSource,
      health: health ?? this.health,
      temperature: temperature ?? this.temperature,
      voltage: voltage ?? this.voltage,
      technology: technology ?? this.technology,
    );
  }

  BatteryInfo.fromJson(Map<String, dynamic> json)
      : level = json['level'] ?? 0,
        chargingStatus = json['status'] ?? 'unknown',
        chargingSource = json['source'] ?? 'unknown',
        health = json['health'] ?? 'unknown',
        temperature = (json['temperature'] as num?)?.toDouble() ?? 0.0,
        voltage = json['voltage'] ?? 0,
        technology = json['technology'] ?? 'unknown';

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'status': chargingStatus,
      'source': chargingSource,
      'health': health,
      'temperature': temperature,
      'voltage': voltage,
      'technology': technology,
    };
  }

  @override
  String toString() {
    return 'BatteryInfo(level: $level, chargingStatus: $chargingStatus, chargingSource: $chargingSource, health: $health, temperature: $temperature, voltage: $voltage, technology: $technology)';
  }
}

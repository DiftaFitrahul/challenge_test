class BatteryInfo {
  int? capacity;
  int? level;
  int? chargeTimeRemaining;
  String? chargingStatus;
  int? currentAverage;
  int? currentNow;
  String? health;
  int? temperature;
  int? voltage;

  BatteryInfo(
      {this.capacity,
      this.chargeTimeRemaining,
      this.chargingStatus,
      this.currentAverage,
      this.currentNow,
      this.health,
      this.level,
      this.temperature,
      this.voltage});
}

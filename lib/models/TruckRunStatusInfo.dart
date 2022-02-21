import 'package:flutter/material.dart';

class TruckRunStatusInfo {
  final String? runName;
  final String? userName;
  final int? stops;
  final int? count;
  final Color? color;
  final String? truckRego;
  final Icon? icon;

  TruckRunStatusInfo(
      {this.runName,
      this.color,
      this.truckRego,
      this.stops,
      this.count,
      this.userName,
      this.icon});
}

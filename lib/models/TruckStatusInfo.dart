import 'package:flutter/material.dart';

class TruckStatusInfo {
  final List<String>? truckInService;
  final int? value;
  final DateTime? oldestIncompleteIssue;
  final Color? color;
  final String? title;
  final Icon? icon;

  TruckStatusInfo(
      {this.truckInService,
      this.color,
      this.oldestIncompleteIssue,
      this.value,
      this.title,
      this.icon});
}

List truckStatus = [
  TruckStatusInfo(
      truckInService: [],
      value: 1328,
      color: Colors.red,
      title: 'Number of Issues Reported Last 7 Days',
      icon: Icon(Icons.report, color: Colors.red)),
  TruckStatusInfo(
      truckInService: [],
      value: 13,
      color: Colors.green,
      title: 'Number of Issues Fixed Last 7 Days',
      icon: Icon(Icons.recommend, color: Colors.green)),
  TruckStatusInfo(
      truckInService: [],
      value: 2,
      color: Colors.grey,
      title: 'Number of Truck Off Road',
      icon: Icon(Icons.car_repair_rounded, color: Colors.blue)),
  TruckStatusInfo(
      truckInService: [],
      value: 73,
      color: Colors.yellow,
      title: 'Incomplete Issues',
      icon: Icon(Icons.thumb_down_rounded, color: Colors.yellow)),
];

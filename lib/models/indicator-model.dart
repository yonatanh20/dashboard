import 'package:flutter/material.dart';

import '../providers/single-provider.dart';

class IndicatorModel {
  Type provider;
  int min;
  int mid;
  int max;
  IconData icon;
  String text;
  IndicatorModel(
      {required this.provider,
      required this.min,
      required this.mid,
      required this.max,
      required this.icon,
      required this.text});
}

List<IndicatorModel> indicators = [
  IndicatorModel(
      provider: InverterLMotorTemp,
      min: 0,
      mid: 50,
      max: 100,
      icon: Icons.thermostat,
      text: "Left Motor"),
  IndicatorModel(
      provider: InverterRMotorTemp,
      min: 0,
      mid: 50,
      max: 100,
      icon: Icons.thermostat,
      text: "Right Motor"),
  IndicatorModel(
      provider: InverterLTemp,
      min: 0,
      mid: 50,
      max: 100,
      icon: Icons.thermostat,
      text: "Left Inverter"),
  IndicatorModel(
      provider: InverterRTemp,
      min: 0,
      mid: 50,
      max: 100,
      icon: Icons.thermostat,
      text: "Right Inverter"),
];

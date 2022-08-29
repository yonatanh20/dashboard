import 'package:flutter/material.dart';

import '../providers/single-provider.dart';

class IndicatorModel {
  final int min;
  final int mid;
  final int max;
  final IconData icon;
  final String text;
  IndicatorModel(
      {required this.min,
      required this.mid,
      required this.max,
      required this.icon,
      required this.text});
}

Map<Type, IndicatorModel> indicators = {
  Power: IndicatorModel(
      min: 0, mid: 70000, max: 80000, icon: Icons.thermostat, text: "Watt"),
  MotorLTemp: IndicatorModel(
      min: 0, mid: 50, max: 100, icon: Icons.thermostat, text: "Left Motor"),
  MotorRTemp: IndicatorModel(
      min: 0, mid: 50, max: 100, icon: Icons.thermostat, text: "Right Motor"),
  InverterLTemp: IndicatorModel(
      min: 0, mid: 50, max: 100, icon: Icons.thermostat, text: "Left Inverter"),
  InverterRTemp: IndicatorModel(
      min: 0,
      mid: 50,
      max: 100,
      icon: Icons.thermostat,
      text: "Right Inverter"),
};

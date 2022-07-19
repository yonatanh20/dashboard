import 'package:flutter/material.dart';

class FrameData with ChangeNotifier {
  //Driver Node
  int heatEvac;
  //Pedal Node
  int gas;
  int breaking;
  int oilPressure;
  int steeringAngle;
  //ECU
  int errorState;
  int drivingState;
  //BMS
  int stateOfCharge;
  int bmsTemp;

  //Inverters
  int inverterLRPM;
  int inverterRRPM;

  int inverterLMotorTemp;
  int inverterRMotorTemp;

  int inverterLTemp;
  int inverterRTemp;

  FrameData({
    // required this.heatEvac,
    // required this.gas,
    // required this.breaking,
    // required this.oilPressure,
    // required this.steeringAngle,
    // required this.errorState,
    // required this.drivingState,
    // required this.stateOfCharge,
    // required this.bmsTemp,
    // required this.inverterLRPM,
    // required this.inverterRRPM,
    // required this.inverterLMotorTemp,
    // required this.inverterRMotorTemp,
    // required this.inverterLTemp,
    // required this.inverterRTemp,

    this.heatEvac,
    this.gas,
    this.breaking,
    this.oilPressure,
    this.steeringAngle,
    this.errorState,
    this.drivingState,
    this.stateOfCharge,
    this.bmsTemp,
    this.inverterLRPM,
    this.inverterRRPM,
    this.inverterLMotorTemp,
    this.inverterRMotorTemp,
    this.inverterLTemp,
    this.inverterRTemp,
  });

  void updateData() {
    notifyListeners();
  }

  static var defaultFrame = FrameData(
      heatEvac: 3,
      gas: 0,
      breaking: 0,
      oilPressure: 0,
      steeringAngle: 0,
      errorState: 0,
      drivingState: 2,
      stateOfCharge: 0,
      bmsTemp: 0,
      inverterLRPM: 0,
      inverterRRPM: 0,
      inverterLMotorTemp: 0,
      inverterRMotorTemp: 30,
      inverterLTemp: 0,
      inverterRTemp: 0);
}

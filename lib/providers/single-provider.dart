import 'package:dashboard/providers/complex-provider.dart';
import 'package:flutter/material.dart';

class SingleProvider<T> with ChangeNotifier {
  T value;

  SingleProvider({
    required this.value,
  });

  void updateData(T newVal) {
    if (newVal != value) {
      value = newVal;
      notifyListeners();
    }
  }
}

class HeatEvac<int> extends SingleProvider {
  HeatEvac({required super.value});
}

class OilPressure<int> extends SingleProvider {
  OilPressure({required super.value});
}

class SteeringAngle<double> extends SingleProvider {
  SteeringAngle({required super.value});
}

class Power<int> extends SingleProvider {
  Power({required super.value});
}

class ErrorState<int> extends SingleProvider {
  ErrorState({required super.value});
}

class DrivingState<int> extends SingleProvider {
  DrivingState({required super.value});
}

class StateOfCharge<int> extends SingleProvider {
  StateOfCharge({required super.value});
}

class MotorLTemp<int> extends SingleProvider {
  MotorLTemp({required super.value});
}

class MotorRTemp<int> extends SingleProvider {
  MotorRTemp({required super.value});
}

class InverterLTemp<int> extends SingleProvider {
  InverterLTemp({required super.value});
}

class InverterRTemp<int> extends SingleProvider {
  InverterRTemp({required super.value});
}

class ShutdownState<int> extends SingleProvider {
  ShutdownState({required super.value});
}

Map<Type, ChangeNotifier> defaultProviders = {
  HeatEvac: HeatEvac(value: 0),
  OilPressure: OilPressure(value: 0),
  SteeringAngle: SteeringAngle(value: 0),
  Power: Power(value: 0),
  ErrorState: ErrorState(value: 0),
  DrivingState: DrivingState(value: 0),
  StateOfCharge: StateOfCharge(value: 0.0),
  MotorLTemp: MotorLTemp(value: 0),
  MotorRTemp: MotorRTemp(value: 0),
  InverterLTemp: InverterLTemp(value: 0),
  InverterRTemp: InverterRTemp(value: 0),
  ShutdownState: ShutdownState(value: 0),
  SpeedometerProvider: SpeedometerProvider(values: {
    SpeedometerKeys.gas: 0,
    SpeedometerKeys.breaking: 0,
    SpeedometerKeys.errorState: 0,
    SpeedometerKeys.drivingState: 0,
    SpeedometerKeys.inverterLRPM: 0,
    SpeedometerKeys.inverterRRPM: 0,
  })
};

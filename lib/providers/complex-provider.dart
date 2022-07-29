import 'package:flutter/material.dart';

class ComplexProvider with ChangeNotifier {
  Map<dynamic, dynamic> values;

  ComplexProvider({
    required this.values,
  });

  void updateData(dynamic key, dynamic newVal) {
    if (newVal != values[key]) {
      values[key] = newVal;
      notifyListeners();
    }
  }
}

enum SpeedometerKeys {
  gas,
  breaking,
  errorState,
  drivingState,
  inverterLRPM,
  inverterRRPM,
}

class SpeedometerProvider extends ComplexProvider {
  SpeedometerProvider({required super.values});
}

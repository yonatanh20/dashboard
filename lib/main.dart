import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'interfaces/logger.dart';
import 'providers/complex-provider.dart';
import 'providers/single-provider.dart';
import 'screens/dash-screen.dart';

void main() {
  return runApp(DashApp());
}

class DashApp extends StatefulWidget {
  const DashApp({Key? key}) : super(key: key);

  @override
  State<DashApp> createState() => _DashAppState();
}

class _DashAppState extends State<DashApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      CanBusData.start();
    });
  }

  @override
  void dispose() async {
    await CanBusData.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HeatEvac(value: 0)),
          ChangeNotifierProvider.value(value: OilPressure(value: 0)),
          ChangeNotifierProvider.value(value: SteeringAngle(value: 0)),
          ChangeNotifierProvider.value(value: ErrorState(value: 0)),
          ChangeNotifierProvider.value(value: DrivingState(value: 0)),
          ChangeNotifierProvider.value(value: StateOfCharge(value: 0)),
          ChangeNotifierProvider.value(value: InverterLMotorTemp(value: 0)),
          ChangeNotifierProvider.value(value: InverterRMotorTemp(value: 0)),
          ChangeNotifierProvider.value(value: InverterLTemp(value: 0)),
          ChangeNotifierProvider.value(value: InverterRTemp(value: 0)),
          ChangeNotifierProvider.value(value: ShutdownState(value: 0)),
          ChangeNotifierProvider.value(
              value: SpeedometerProvider(values: {
            SpeedometerKeys.gas: 0,
            SpeedometerKeys.breaking: 0,
            SpeedometerKeys.errorState: 0,
            SpeedometerKeys.drivingState: 0,
            SpeedometerKeys.inverterLRPM: 0,
            SpeedometerKeys.inverterRRPM: 0,
          })),
        ],
        child: MaterialApp(
          title: 'Dashboard',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            canvasColor: Colors.amber.shade50,
            fontFamily: 'Raleway',
          ),
          home: DashScreen(),
          initialRoute: '/',
          routes: {},
        ));
  }
}

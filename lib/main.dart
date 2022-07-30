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
  MaterialColor appColor = Colors.amber;
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
          ChangeNotifierProvider.value(
              value: defaultProviders[HeatEvac] as HeatEvac),
          ChangeNotifierProvider.value(
              value: defaultProviders[OilPressure] as OilPressure),
          ChangeNotifierProvider.value(
              value: defaultProviders[SteeringAngle] as SteeringAngle),
          ChangeNotifierProvider.value(
              value: defaultProviders[ErrorState] as ErrorState),
          ChangeNotifierProvider.value(
              value: defaultProviders[DrivingState] as DrivingState),
          ChangeNotifierProvider.value(
              value: defaultProviders[StateOfCharge] as StateOfCharge),
          ChangeNotifierProvider.value(
              value: defaultProviders[MotorLTemp] as MotorLTemp),
          ChangeNotifierProvider.value(
              value: defaultProviders[MotorRTemp] as MotorRTemp),
          ChangeNotifierProvider.value(
              value: defaultProviders[InverterLTemp] as InverterLTemp),
          ChangeNotifierProvider.value(
              value: defaultProviders[InverterRTemp] as InverterRTemp),
          ChangeNotifierProvider.value(
              value: defaultProviders[ShutdownState] as ShutdownState),
          ChangeNotifierProvider.value(
              value:
                  defaultProviders[SpeedometerProvider] as SpeedometerProvider),
        ],
        child: MaterialApp(
          title: 'Dashboard',
          theme: ThemeData(
            primarySwatch: appColor,
            canvasColor: appColor.shade50,
            fontFamily: 'Raleway',
          ),
          home: DashScreen(),
          initialRoute: '/',
          routes: {},
        ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'interfaces/logger.dart';
import 'providers/frame-provider.dart';
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
      await Future.delayed(const Duration(seconds: 2));
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
          ChangeNotifierProvider.value(value: FrameData.defaultFrame)
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

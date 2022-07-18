import 'dart:async';

import 'package:dashboard/interfaces/logger.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../providers/frame-provider.dart';
import '../widgets/speedometer.dart';

/// Represents MyHomePage class
class DashScreen extends StatefulWidget {
  /// Creates the instance of MyHomePage
  const DashScreen({Key? key}) : super(key: key);

  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  void dispose() async {
    await CanBusData.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')), body: _homeScreen());
  }

  Widget _homeScreen() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Speedometer(),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("data"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

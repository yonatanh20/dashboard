import 'dart:async';

import 'package:dashboard/interfaces/logger.dart';
import 'package:flutter/material.dart';

import '../providers/frame-provider.dart';

/// Represents MyHomePage class
class DashScreen extends StatefulWidget {
  /// Creates the instance of MyHomePage
  const DashScreen({Key? key}) : super(key: key);

  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  FrameData _frameData = FrameData.defaultFrame;
  final Duration frameSpeed = const Duration(milliseconds: 20);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')), body: _homeScreen());
  }

  Widget _homeScreen() {
    return Row();
  }
}

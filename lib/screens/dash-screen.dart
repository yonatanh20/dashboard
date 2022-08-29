import 'package:dashboard/interfaces/logger.dart';
import 'package:dashboard/widgets/battery-widget.dart';
import 'package:dashboard/widgets/indicator-widget.dart';
import 'package:flutter/material.dart';
import '../widgets/speedometer-widget.dart';

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
    return Scaffold(body: _homeScreen());
  }

  Widget _homeScreen() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SpeedometerWidget(),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: BatteryWidget(),
              ),
              Container(
                  child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  PowerIndicator(),
                  MotorLTempIndicator(),
                  MotorRTempIndicator(),
                  InverterLTempIndicator(),
                  //InverterRTempIndicator(),
                ],
              ))
            ],
          ),
        )
      ],
    );
  }
}

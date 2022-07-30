import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/indicator-model.dart';
import '../providers/single-provider.dart';

class IndicatorWidget extends StatelessWidget {
  final IndicatorModel indicator;
  const IndicatorWidget({Key? key, required this.indicator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
          color: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 2.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                indicator.icon,
                size: 60.0,
                color: Theme.of(context).focusColor,
              ),
              Text(indicator.text),
            ],
          )),
    );
  }
}

class InverterLTempIndicator extends StatelessWidget {
  const InverterLTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterLTemp>(
        builder: (context, stateOfChargeProvider, child) => IndicatorWidget(
              indicator: indicators[InverterLTemp]!,
            ));
  }
}

class InverterRTempIndicator extends StatelessWidget {
  const InverterRTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterRTemp>(
        builder: (context, stateOfChargeProvider, child) => IndicatorWidget(
              indicator: indicators[InverterRTemp]!,
            ));
  }
}

class MotorLTempIndicator extends StatelessWidget {
  const MotorLTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MotorLTemp>(
        builder: (context, stateOfChargeProvider, child) => IndicatorWidget(
              indicator: indicators[MotorLTemp]!,
            ));
  }
}

class MotorRTempIndicator extends StatelessWidget {
  const MotorRTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MotorRTemp>(
        builder: (context, stateOfChargeProvider, child) => IndicatorWidget(
              indicator: indicators[MotorRTemp]!,
            ));
  }
}

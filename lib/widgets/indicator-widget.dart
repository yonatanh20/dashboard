import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/indicator-model.dart';
import '../providers/single-provider.dart';

class IndicatorWidget extends StatelessWidget {
  final IndicatorModel indicator;
  final SingleProvider provider;
  const IndicatorWidget(
      {Key? key, required this.indicator, required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
          color: provider.value <= indicator.mid
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColorDark,
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
                color: provider.value < indicator.min
                    ? Theme.of(context).focusColor
                    : provider.value > indicator.max
                        ? Theme.of(context).errorColor
                        : Theme.of(context).primaryColor,
              ),
              Text('${indicator.text} ${provider.value}'),
            ],
          )),
    );
  }
}

class PowerIndicator extends StatelessWidget {
  const PowerIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Power>(
        builder: (context, provider, child) => IndicatorWidget(
              indicator: indicators[Power]!,
              provider: provider,
            ));
  }
}

class InverterLTempIndicator extends StatelessWidget {
  const InverterLTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterLTemp>(
        builder: (context, provider, child) => IndicatorWidget(
              indicator: indicators[InverterLTemp]!,
              provider: provider,
            ));
  }
}

class InverterRTempIndicator extends StatelessWidget {
  const InverterRTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterRTemp>(
        builder: (context, provider, child) => IndicatorWidget(
              indicator: indicators[InverterRTemp]!,
              provider: provider,
            ));
  }
}

class MotorLTempIndicator extends StatelessWidget {
  const MotorLTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MotorLTemp>(
        builder: (context, provider, child) => IndicatorWidget(
              indicator: indicators[MotorLTemp]!,
              provider: provider,
            ));
  }
}

class MotorRTempIndicator extends StatelessWidget {
  const MotorRTempIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MotorRTemp>(
        builder: (context, provider, child) => IndicatorWidget(
              indicator: indicators[MotorRTemp]!,
              provider: provider,
            ));
  }
}

import 'package:dashboard/providers/complex-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedometerWidget extends StatelessWidget {
  const SpeedometerWidget({
    Key? key,
  }) : super(key: key);

  final double angleFromTop = 30;
  final double angleFromButtom = 30;
  @override
  Widget build(BuildContext context) {
    return Consumer<SpeedometerProvider>(
      builder: (context, speedometerProvider, child) =>
          SfRadialGauge(enableLoadingAnimation: false, axes: <RadialAxis>[
        RadialAxis(
            minimum: 0,
            maximum: 120,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
                thickness: 20,
                thicknessUnit: GaugeSizeUnit.logicalPixel,
                color: Theme.of(context).primaryColorLight),
            pointers: <GaugePointer>[
              NeedlePointer(
                value:
                    (speedometerProvider.values[SpeedometerKeys.inverterLRPM] +
                            speedometerProvider
                                .values[SpeedometerKeys.inverterRRPM]) *
                        0.1941,
                lengthUnit: GaugeSizeUnit.factor,
                needleStartWidth: 1,
                needleEndWidth: 5,
              ),
              RangePointer(
                value:
                    (speedometerProvider.values[SpeedometerKeys.inverterLRPM] +
                            speedometerProvider
                                .values[SpeedometerKeys.inverterRRPM]) *
                        0.1941,
                color: Theme.of(context).primaryColorDark,
                width: 20,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text(
                      '${((speedometerProvider.values[SpeedometerKeys.inverterLRPM] + speedometerProvider.values[SpeedometerKeys.inverterRRPM]) * 0.1941).toStringAsFixed(0)} KM/h',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  angle: 90,
                  positionFactor: 0.7)
            ]),
        RadialAxis(
          minimum: 0,
          maximum: 1000,
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
              thickness: 10,
              thicknessUnit: GaugeSizeUnit.logicalPixel,
              color: Theme.of(context).primaryColorLight),
          startAngle: 90 + angleFromButtom,
          endAngle: 270 - angleFromTop,
          pointers: [
            RangePointer(
              value: speedometerProvider.values[SpeedometerKeys.gas].toDouble(),
              color: Theme.of(context).primaryColorDark,
              dashArray: <double>[16, 4],
              width: 15,
            )
          ],
        ),
        RadialAxis(
          minimum: 0,
          maximum: 1000,
          showLabels: false,
          showTicks: false,
          isInversed: true,
          axisLineStyle: AxisLineStyle(
              thickness: 10,
              thicknessUnit: GaugeSizeUnit.logicalPixel,
              color: Theme.of(context).primaryColorLight),
          startAngle: 270 + angleFromTop,
          endAngle: 90 - angleFromButtom,
          pointers: [
            RangePointer(
              value: speedometerProvider.values[SpeedometerKeys.breaking]
                  .toDouble(),
              dashArray: <double>[16, 4],
              width: 15,
              color: Theme.of(context).primaryColorDark,
            ),
          ],
        )
      ]),
    );
  }
}

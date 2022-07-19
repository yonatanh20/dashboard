import 'package:dashboard/providers/frame-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Speedometer extends StatelessWidget {
  const Speedometer({
    Key key,
  }) : super(key: key);

  final double angleFromTop = 30;
  final double angleFromButtom = 30;
  @override
  Widget build(BuildContext context) {
    return Consumer<FrameData>(
      builder: (context, value, child) =>
          SfRadialGauge(enableLoadingAnimation: false, axes: <RadialAxis>[
        RadialAxis(
            minimum: 0,
            maximum: 120,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
                thickness: 15,
                thicknessUnit: GaugeSizeUnit.logicalPixel,
                color: Theme.of(context).primaryColorDark),
            pointers: <GaugePointer>[
              NeedlePointer(
                value: (value.inverterRRPM + value.inverterLRPM) * 0.1941,
                lengthUnit: GaugeSizeUnit.factor,
                needleStartWidth: 1,
                needleEndWidth: 5,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text(
                      '${((value.inverterRRPM + value.inverterLRPM) * 0.1941).toStringAsFixed(0)} KM/h',
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
              color: Theme.of(context).primaryColorDark),
          startAngle: 90 + angleFromButtom,
          endAngle: 270 - angleFromTop,
          pointers: [
            RangePointer(
              value: value.gas.toDouble(),
              color: Theme.of(context).highlightColor,
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
              color: Theme.of(context).primaryColorDark),
          startAngle: 270 + angleFromTop,
          endAngle: 90 - angleFromButtom,
          pointers: [
            RangePointer(
              value: value.breaking.toDouble(),
              dashArray: <double>[16, 4],
              width: 15,
              color: Theme.of(context).highlightColor,
            ),
          ],
        )
      ]),
    );
  }
}

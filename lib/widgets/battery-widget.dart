import 'package:dashboard/providers/frame-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Battery extends StatelessWidget {
  const Battery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FrameData>(
      builder: (context, value, child) => Container(
        height: 60,
        width: 200,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).backgroundColor, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: value.stateOfCharge / 100.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                "${value.stateOfCharge.toStringAsFixed(0)}%",
                textScaleFactor: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

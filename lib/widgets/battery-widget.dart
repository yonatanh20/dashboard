import 'package:dashboard/providers/single-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BatteryWidget extends StatelessWidget {
  const BatteryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StateOfCharge>(
      builder: (context, stateOfChargeProvider, child) => Container(
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
              widthFactor: stateOfChargeProvider.value / 100.0,
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
                "${stateOfChargeProvider.value.toStringAsFixed(0)}%",
                textScaleFactor: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

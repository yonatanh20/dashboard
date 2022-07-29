import 'package:flutter/material.dart';

import '../models/indicator-model.dart';

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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  indicator.icon,
                  size: 60.0,
                  color: Theme.of(context).focusColor,
                ),
                Text(indicator.text),
              ],
            )));
  }
}

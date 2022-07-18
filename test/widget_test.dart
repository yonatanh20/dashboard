// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dashboard/models/canbus_devices.dart';
import 'package:dashboard/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dashboard/main.dart';

void main() {
  String line = "(1658093797.620434) can0 111#121314";
  List<String> lineArgs = line.split("#");
  lineArgs = [...lineArgs[0].split(" "), lineArgs[1]];

  var channel = Channel.can0.toShortString() == lineArgs[1]
      ? Channel.can0
      : Channel.can1.toShortString() == lineArgs[1]
          ? Channel.can1
          : Channel.unkown;
  var pid = int.tryParse(lineArgs[2], radix: 16) ?? 777;
  List<int> data = [];
  for (int i = 0; i < lineArgs[3].length; i += 2) {
    data.add(int.tryParse(lineArgs[3].substring(i, i + 2), radix: 16) ?? 0);
  }
}

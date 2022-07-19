import 'dart:convert';
import 'dart:io';

import 'package:dashboard/models/utils.dart';

import '../models/canbus_devices.dart';

class CanConnection {
  Process _process;
  final Channel channel;

  CanConnection({this.channel});

  Future<Stream<String>> get lines async {
    _process = await Process.start(
        'candump', ["-l", "-L", "-s", "0", channel.toShortString()]);
    return _process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter());
  }

  static Future<void> sendFrame(
      {Channel channel, int id, List<int> data}) async {
    String stringData = data.map((e) => e.toRadixString(16)).join();
    await Process.run('cansend', [channel.toShortString(), '$id#$stringData']);
  }

  void close() {
    _process.kill();
  }
}

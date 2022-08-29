import 'dart:convert';
import 'dart:io';

import 'package:dashboard/models/utils.dart';

import '../models/canbus_devices.dart';

class CanConnection {
  late final Process _inputProcess;
  late final Process _outputProcess;
  final Channel channel;

  CanConnection({required this.channel});

  Future<void> setOutput() async {
    _outputProcess =
        await Process.start('canstream', [channel.toShortString()]);
  }

  Future<Stream<String>> get input async {
    _inputProcess = await Process.start(
        'candump', ["-L", "-s", "0", channel.toShortString()]);
    return _inputProcess.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter());
  }

  void sendFrame({required int id, required List<int> data}) {
    String stringData = data.map((e) => e.toRadixString(16)).join();
    _outputProcess.stdin
        .writeln('${id.toRadixString(16).padLeft(3, '0')}#${stringData}');
  }

  void close() {
    _inputProcess.kill();
    _outputProcess.kill();
  }
}

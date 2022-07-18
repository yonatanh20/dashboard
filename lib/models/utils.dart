import 'package:dashboard/models/canbus_devices.dart';

class Pair<T1, T2> {
  final T1 a;
  final T2 b;

  Pair(this.a, this.b);
}
extension ParseToString on Channel {
  String toShortString() {
    return toString().split('.').last;
  }
}
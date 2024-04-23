import 'package:flutter/foundation.dart';

class Log {
  static d(String message) {
    debugPrint(message);
  }

  static e(Error message) {
    debugPrint(message.stackTrace.toString());
  }
}

import 'package:flutter/foundation.dart';

class Log {
  d(String message) {
    debugPrint(message);
  }

  e(Error message) {
    debugPrint(message.stackTrace.toString());
  }
}

import 'package:flutter/foundation.dart';

class Log {
  Future<void> d(String message) async {
    if (kDebugMode) {
      debugPrint(message);
    }
  }

  Future<void> e(Error message) async {
    if (kDebugMode) {
      debugPrint(message.stackTrace.toString());
    }
  }
}

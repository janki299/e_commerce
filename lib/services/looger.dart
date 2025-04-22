import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class Logger {
  static log(String title, dynamic message) {
    if (kDebugMode) {
      dev.log(
        "$message",
        name: title,
      );
    }
  }
}

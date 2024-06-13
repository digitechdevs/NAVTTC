import 'dart:developer';

import 'package:flutter/foundation.dart';

appPrint(message) {
  if (kDebugMode) {
    appPrint("PRINT-SMART-CITY 👀=> $message");
  }
}

appLog(message) {
  if (kDebugMode) {
    log("LOG-SMART-CITY 👀=> $message");
  }
}

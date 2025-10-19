import 'dart:async';
import 'dart:developer';
import 'package:task/app/app_startup.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        if (record.error != null) {
          log('[${record.loggerName}] [${record.level.name}]: ${record.time}: '
              '${record.message} ${record.error} ${record.stackTrace}');
        } else {
          log('[${record.loggerName}] [${record.level.name}]: ${record.time}: '
              '${record.message}');
        }
      });
      runApp(const StartupWidget());
    },
    (error, stackTrace) {
      debugPrint("error caught in zone guard: $error");
    },
  );
}

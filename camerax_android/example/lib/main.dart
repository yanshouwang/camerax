import 'dart:async';
import 'dart:developer';

import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'view_models.dart';
import 'views.dart';

void main() {
  Logger.root.onRecord.listen(onLogRecorded);
  runZonedGuarded(onStartUp, onUncaughtError);
}

void onLogRecorded(LogRecord record) {
  log(
    record.message,
    time: record.time,
    sequenceNumber: record.sequenceNumber,
    level: record.level.value,
    name: record.loggerName,
    zone: record.zone,
    error: record.error,
    stackTrace: record.stackTrace,
  );
}

void onStartUp() {
  final app = MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
      ),
    ),
    home: ViewModelBinding(
      viewBuilder: (context) => const HomeView(),
      viewModelBuilder: (context) => HomeViewModel(),
    ),
  );
  runApp(app);
}

void onUncaughtError(Object error, StackTrace stackTrace) {}

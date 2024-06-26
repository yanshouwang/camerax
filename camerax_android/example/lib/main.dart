import 'dart:async';
import 'dart:developer';

import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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
  final app = CupertinoApp(
    theme: const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: CupertinoColors.systemYellow,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontSize: 12.0,
        ),
      ),
    ),
    home: ViewModelBinding(
      viewBuilder: (context) => const CameraView(),
      viewModelBuilder: (context) => CameraViewModel(),
    ),
  );
  runApp(app);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  const style = SystemUiOverlayStyle(
    statusBarColor: Color(0x00000000),
  );
  SystemChrome.setSystemUIOverlayStyle(style);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

void onUncaughtError(Object error, StackTrace stackTrace) {
  Logger.root.shout(error, stackTrace);
}

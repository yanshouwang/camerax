import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'router.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  const style = SystemUiOverlayStyle(
    statusBarColor: Color(0x00000000),
  );
  SystemChrome.setSystemUIOverlayStyle(style);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  const app = MyApp();
  runApp(app);
}

void onUncaughtError(Object error, StackTrace stackTrace) {
  Logger.root.shout(error, stackTrace);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      routerConfig: routerConfig,
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemYellow,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}

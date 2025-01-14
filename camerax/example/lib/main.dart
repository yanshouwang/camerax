import 'dart:async';
import 'dart:developer';

import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'view_models.dart';
import 'views.dart';

final routeObserver = RouteObserver<ModalRoute>();

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter routerConfig;

  @override
  void initState() {
    super.initState();
    routerConfig = GoRouter(
      observers: [
        routeObserver,
      ],
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return ViewModelBinding(
              viewBuilder: () => const HomeView(),
              viewModelBuilder: () => HomeViewModel(),
            );
          },
          routes: [
            GoRoute(
              path: 'viewer',
              builder: (context, state) {
                final filePath = state.uri.queryParameters['uri'];
                if (filePath == null) {
                  throw ArgumentError.notNull('uri');
                }
                final uri = Uri.file(filePath);
                return InteractiveView(
                  uri: uri,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

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

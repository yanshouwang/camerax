import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style =
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);

    return MaterialApp(
      home: HomeView(),
      theme: ThemeData.light().copyWith(platform: TargetPlatform.iOS),
      routes: {
        'analyze': (context) => AnalyzeView(),
        'display': (context) => DisplayView(),
      },
    );
  }
}

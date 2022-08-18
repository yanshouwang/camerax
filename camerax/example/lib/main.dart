import 'package:camerax/camerax.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Key cameraKey;

  @override
  void initState() {
    super.initState();

    cameraKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SizedBox(
            width: 200.0,
            height: 300.0,
            child: CameraView(
              scaleType: ScaleType.fitCenter,
              onCreated: (id) async {
                await Permission.camera.request();
                await CameraProvider.bind(
                  cameraSelector: CameraSelector.back,
                  useCases: [
                    Preview(viewId: id),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

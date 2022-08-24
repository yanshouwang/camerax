import 'dart:async';

import 'package:camerax/camerax.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CameraController cameraController;
  late StreamSubscription<List<MLObject>> recognitionStreamSubscription;

  @override
  void initState() {
    super.initState();

    cameraController = CameraController();

    bind();
    scan();
  }

  void bind() async {
    await Permission.camera.request();
    cameraController.bind();
  }

  void scan() async {
    final mlAnalyzer = MLAnalyzer(handleRecognition);
    cameraController.imageAnalyzer = mlAnalyzer;
  }

  void handleRecognition(MLRecognition recognition) {
    final size = recognition.size;
    final barcodes = recognition.objs.whereType<Barcode>();
    if (barcodes.isEmpty) {
      return;
    }
    final messenger = messengerKey.currentState;
    if (messenger != null) {
      final snackBar = SnackBar(
        content: Text('$size - ${barcodes.first.value}'),
      );
      messenger
        ..clearSnackBars()
        ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      home: Scaffold(
        body: Stack(
          children: [
            CameraView(
              controller: cameraController,
              scaleType: ScaleType.fitCenter,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 40.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: cameraController.torchState,
                builder: (context, torchState, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromRadius(32.0),
                      shape: const CircleBorder(),
                      primary: torchState
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).disabledColor,
                    ),
                    onPressed: () => cameraController.enableTorch(!torchState),
                    child: const Icon(FluentIcons.flashlight_16_regular),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    recognitionStreamSubscription.cancel();
    cameraController.dispose();
    super.dispose();
  }
}

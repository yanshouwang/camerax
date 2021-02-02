import 'dart:async';
import 'dart:ui';

import 'package:camerax/camerax.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style =
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);

    return MaterialApp(
      home: HomeView(),
      theme: ThemeData.dark().copyWith(platform: TargetPlatform.iOS),
      routes: {
        'camerax': (context) => CameraView(),
        'show': (context) => ShowView(),
      },
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CameraX'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            'Click the camera button at bottom to start scan:)',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.camera,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pushNamed('camerax'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView>
    with SingleTickerProviderStateMixin {
  bool detecting = false;
  BarcodeDetector detector = FirebaseVision.instance.barcodeDetector();
  CameraController cameraController = CameraController(CameraFacing.back);
  AnimationController animationConrtroller;
  Animation<double> offsetAnimation;
  Animation<double> opacityAnimation;
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    animationConrtroller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    offsetAnimation = Tween(begin: 0.2, end: 0.8).animate(animationConrtroller);
    opacityAnimation =
        CurvedAnimation(parent: animationConrtroller, curve: OpacityCurve());
    animationConrtroller.repeat();
    subscription = cameraController.stream.listen(detect);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: cameraController.initAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraWidget(cameraController),
                AnimatedLine(
                  offsetAnimation: offsetAnimation,
                  opacityAnimation: opacityAnimation,
                ),
                Positioned(
                  left: 24.0,
                  top: 32.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            );
          } else {
            return Container(color: Colors.black);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    animationConrtroller.dispose();
    cameraController.dispose();
    detector.close();
    super.dispose();
  }

  void detect(CameraFrame image) async {
    if (detecting) {
      return;
    }
    detecting = true;
    final vision = image.vision;
    final codes = await detector.detectInImage(vision);
    try {
      final code = codes.firstWhere((e) => e.rawValue.isNotEmpty);
      await Navigator.of(context)
          .popAndPushNamed('show', arguments: code.rawValue);
    } catch (_) {
      // Not found.
    } finally {
      detecting = false;
    }
  }
}

class OpacityCurve extends Curve {
  @override
  double transform(double t) {
    if (t < 0.1) {
      return t * 10;
    } else if (t <= 0.9) {
      return 1.0;
    } else {
      return (1.0 - t) * 10;
    }
  }
}

class AnimatedLine extends AnimatedWidget {
  final Animation offsetAnimation;
  final Animation opacityAnimation;

  AnimatedLine(
      {Key key,
      @required this.offsetAnimation,
      @required this.opacityAnimation})
      : super(key: key, listenable: offsetAnimation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityAnimation.value,
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: LinePainter(offsetAnimation.value),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double offset;

  LinePainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final radius = size.width * 0.45;
    final dx = size.width / 2.0;
    final center = Offset(dx, radius);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..isAntiAlias = true
      ..shader = RadialGradient(
        colors: [Colors.green, Colors.green.withOpacity(0.0)],
        radius: 0.5,
      ).createShader(rect);
    canvas.translate(0.0, size.height * offset);
    canvas.scale(1.0, 0.1);
    final top = Rect.fromLTRB(0, 0, size.width, radius);
    canvas.clipRect(top);
    canvas.drawCircle(center, radius, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ShowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('扫描结果'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(text),
      ),
    );
  }
}

extension on CameraFrame {
  FirebaseVisionImage get vision {
    final planeData = this
        .metadata
        .planes
        .map((e) => FirebaseVisionImagePlaneMetadata(
            bytesPerRow: e.rowStride, height: e.height, width: e.width))
        .toList();
    final rotation = toImageRotation(this.metadata.rotation);
    final metadata = FirebaseVisionImageMetadata(
        size: this.metadata.size,
        rawFormat: this.metadata.format,
        planeData: planeData,
        rotation: rotation);
    return FirebaseVisionImage.fromBytes(bytes, metadata);
  }
}

ImageRotation toImageRotation(int rotation) {
  switch (rotation) {
    case 0:
      return ImageRotation.rotation0;
    case 90:
      return ImageRotation.rotation90;
    case 180:
      return ImageRotation.rotation180;
    default:
      assert(rotation == 270);
      return ImageRotation.rotation270;
  }
}

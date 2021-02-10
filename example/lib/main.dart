import 'dart:ui';

import 'package:camerax/camerax.dart';
import 'package:camerax/mlkit.dart';
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
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);

    return MaterialApp(
      home: HomeView(),
      theme: ThemeData.light().copyWith(platform: TargetPlatform.iOS),
      routes: {
        'camera': (context) => CameraView(),
        'display': (context) => DisplayView(),
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
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
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
        onPressed: () => Navigator.of(context).pushNamed('camera'),
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
  CameraController cameraController;
  AnimationController animationConrtroller;
  Animation<double> offsetAnimation;
  Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController();
    cameraController.barcodes.first.then(display);
    animationConrtroller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    offsetAnimation = Tween(begin: 0.2, end: 0.8).animate(animationConrtroller);
    opacityAnimation =
        CurvedAnimation(parent: animationConrtroller, curve: OpacityCurve());
    animationConrtroller.repeat();
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
                    icon: Icon(Icons.cancel, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 80.0),
                  child: IconButton(
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController.torchState,
                      builder: (context, state, child) {
                        final color = state == TorchState.off
                            ? Colors.grey
                            : Colors.white;
                        return Icon(Icons.bolt, color: color);
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => cameraController.torch(),
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
    animationConrtroller.dispose();
    cameraController.dispose();
    super.dispose();
  }

  void display(Barcode barcode) {
    Navigator.of(context).popAndPushNamed('display', arguments: barcode);
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

class DisplayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final barcode = ModalRoute.of(context).settings.arguments as Barcode;
    return Scaffold(
      appBar: AppBar(
        title: Text('扫描结果'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    barcode.type.source,
                    width: 40.0,
                    height: 40.0,
                  ),
                  Container(height: 8.0),
                  Text(
                    barcode.type.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0x99000000),
                    ),
                  ),
                ],
              ),
              Container(height: 40.0),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '条码格式',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 4.0),
                        Text(
                          barcode.format.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '结果类型',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 4.0),
                        Text(
                          barcode.type.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '结果内容',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 4.0),
                        Text(
                          barcode.rawValue,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(height: 40.0),
              ButtonTheme(
                minWidth: 188.0,
                height: 36.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                textTheme: ButtonTextTheme.primary,
                child: RaisedButton(
                  child: Text('复制'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on BarcodeType {
  String get source {
    switch (this) {
      case BarcodeType.calendarEvent:
        return 'images/event.png';
      case BarcodeType.contactInfo:
        return 'images/contact.png';
      case BarcodeType.email:
        return 'images/email.png';
      case BarcodeType.geo:
        return 'images/location.png';
      case BarcodeType.isbn:
        return 'images/isbn.png';
      case BarcodeType.phone:
        return 'images/tel.png';
      case BarcodeType.product:
        return 'images/product.png';
      case BarcodeType.sms:
        return 'images/sms.png';
      case BarcodeType.url:
        return 'images/website.png';
      case BarcodeType.wifi:
        return 'images/wifi.png';
      case BarcodeType.text:
      case BarcodeType.driverLicense:
      default:
        return 'images/text.png';
    }
  }

  String get name {
    switch (this) {
      case BarcodeType.calendarEvent:
        return '事件';
      case BarcodeType.contactInfo:
        return '通讯录';
      case BarcodeType.driverLicense:
        return '驾照';
      case BarcodeType.email:
        return '电子邮件';
      case BarcodeType.geo:
        return '坐标';
      case BarcodeType.isbn:
        return 'ISBN';
      case BarcodeType.phone:
        return '电话';
      case BarcodeType.product:
        return '商品';
      case BarcodeType.sms:
        return '短信';
      case BarcodeType.text:
        return '文本';
      case BarcodeType.url:
        return '网址';
      case BarcodeType.wifi:
        return 'WiFi';
      default:
        return '未知';
    }
  }
}

extension on BarcodeFormat {
  String get name {
    switch (this) {
      case BarcodeFormat.aztec:
        return 'AZTEC';
      case BarcodeFormat.code128:
        return 'Code 128';
      case BarcodeFormat.code39:
        return 'Code 39';
      case BarcodeFormat.code93:
        return 'Code 93';
      case BarcodeFormat.codebar:
        return 'Codebar';
      case BarcodeFormat.dataMatrix:
        return 'Data Matrix';
      case BarcodeFormat.ean13:
        return 'EAN-13';
      case BarcodeFormat.ean8:
        return 'EAN-8';
      case BarcodeFormat.itf:
        return 'ITF';
      case BarcodeFormat.pdf417:
        return 'PDF-417';
      case BarcodeFormat.qrCode:
        return 'QR CODE';
      case BarcodeFormat.upcA:
        return 'UPC-A';
      case BarcodeFormat.upcE:
        return 'UPC-E';
      default:
        return '未知';
    }
  }
}

import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:flutter/cupertino.dart';

class FacesView extends StatelessWidget {
  final List<FaceApi> faces;

  const FacesView({super.key, required this.faces});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FacesPainter(
        devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        faces: faces,
        strokeWidth: 2.0,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}

class _FacesPainter extends CustomPainter {
  final double devicePixelRatio;
  final List<FaceApi> faces;
  final double strokeWidth;
  final Color color;

  _FacesPainter({
    required this.devicePixelRatio,
    required this.faces,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, ui.Size size) {
    debugPrint('DRAW ON $size');
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.bevel
      ..strokeWidth = strokeWidth
      ..color = color;
    for (var face in faces) {
      final rect = ui.Rect.fromLTRB(
        face.boundingBox.left / devicePixelRatio,
        face.boundingBox.top / devicePixelRatio,
        face.boundingBox.right / devicePixelRatio,
        face.boundingBox.bottom / devicePixelRatio,
      );
      canvas.drawRect(rect, paint);
      final idPainter = TextPainter(
        text: TextSpan(
          text: '${face.trackingId}',
          style: TextStyle(color: color),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      idPainter.paint(canvas, rect.topLeft);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _FacesPainter ||
        oldDelegate.devicePixelRatio != devicePixelRatio ||
        oldDelegate.faces != faces ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }

  @override
  bool? hitTest(Offset position) {
    return false;
  }
}

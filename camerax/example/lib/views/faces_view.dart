import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:flutter/cupertino.dart';

class FacesView extends StatelessWidget {
  final List<VisionFaceObject> faces;

  const FacesView({super.key, required this.faces});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FacesPainter(
        // devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        devicePixelRatio: 1.0,
        faces: faces,
        strokeWidth: 2.0,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}

class _FacesPainter extends CustomPainter {
  final double devicePixelRatio;
  final List<VisionFaceObject> faces;
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
        face.bounds.left / devicePixelRatio,
        face.bounds.top / devicePixelRatio,
        face.bounds.right / devicePixelRatio,
        face.bounds.bottom / devicePixelRatio,
      );
      canvas.drawRect(rect, paint);
      final idPainter = TextPainter(
        text: TextSpan(
          text: '${face.id}',
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

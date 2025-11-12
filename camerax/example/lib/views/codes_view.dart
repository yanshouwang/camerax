import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:flutter/cupertino.dart';

class CodesView extends StatelessWidget {
  final List<VisionMachineReadableCodeObject> codes;

  const CodesView({super.key, required this.codes});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CodesPainter(
        // devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        devicePixelRatio: 1.0,
        codes: codes,
        strokeWidth: 2.0,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}

class _CodesPainter extends CustomPainter {
  final double devicePixelRatio;
  final List<VisionMachineReadableCodeObject> codes;
  final double strokeWidth;
  final Color color;

  _CodesPainter({
    required this.devicePixelRatio,
    required this.codes,
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
    for (var barcode in codes) {
      final corners = barcode.corners
          .map(
            (point) => ui.Offset(
              point.x / devicePixelRatio,
              point.y / devicePixelRatio,
            ),
          )
          .toList();
      final path = Path()..addPolygon(corners, true);
      canvas.drawPath(path, paint);
      final valuePainter = TextPainter(
        text: TextSpan(text: barcode.value),
        textDirection: TextDirection.ltr,
      )..layout();
      valuePainter.paint(canvas, corners.first);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _CodesPainter ||
        oldDelegate.devicePixelRatio != devicePixelRatio ||
        oldDelegate.codes != codes ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }

  @override
  bool? hitTest(Offset position) {
    return false;
  }
}

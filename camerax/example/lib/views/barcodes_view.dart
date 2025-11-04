import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:flutter/cupertino.dart';

class BarcodesView extends StatelessWidget {
  final List<BarcodeApi> barcodes;

  const BarcodesView({super.key, required this.barcodes});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BarcodesPainter(
        devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        barcodes: barcodes,
        strokeWidth: 2.0,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}

class _BarcodesPainter extends CustomPainter {
  final double devicePixelRatio;
  final List<BarcodeApi> barcodes;
  final double strokeWidth;
  final Color color;

  _BarcodesPainter({
    required this.devicePixelRatio,
    required this.barcodes,
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
    for (var barcode in barcodes) {
      final cornerPoints = barcode.cornerPoints;
      if (cornerPoints == null) {
        continue;
      }
      final corners = cornerPoints
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
        text: TextSpan(text: barcode.rawValue),
        textDirection: TextDirection.ltr,
      )..layout();
      valuePainter.paint(canvas, corners.first);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _BarcodesPainter ||
        oldDelegate.devicePixelRatio != devicePixelRatio ||
        oldDelegate.barcodes != barcodes ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }

  @override
  bool? hitTest(Offset position) {
    return false;
  }
}

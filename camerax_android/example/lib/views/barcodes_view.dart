import 'dart:ui' as ui;

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/cupertino.dart';

class BarcodesView extends StatelessWidget {
  final List<Barcode> barcodes;

  const BarcodesView({
    super.key,
    required this.barcodes,
  });

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
  final List<Barcode> barcodes;
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
          .map((point) => ui.Offset(
                point.x / devicePixelRatio,
                point.y / devicePixelRatio,
              ))
          .toList();
      final path = Path()..addPolygon(corners, true);
      canvas.drawPath(path, paint);
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

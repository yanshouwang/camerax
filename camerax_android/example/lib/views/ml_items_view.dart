import 'dart:ui' as ui;

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/cupertino.dart';

class MLItemsView extends StatelessWidget {
  final List<MlObject> items;

  const MLItemsView({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MLItemsPainter(
        devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        items: items,
        strokeWidth: 2.0,
        color: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}

class MLItemsPainter extends CustomPainter {
  final double devicePixelRatio;
  final List<MlObject> items;
  final double strokeWidth;
  final Color color;

  MLItemsPainter({
    required this.devicePixelRatio,
    required this.items,
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
    for (var item in items) {
      if (item is MlCodeObject) {
        final points = item.corners
            .map((point) => Offset(
                  point.dx / devicePixelRatio,
                  point.dy / devicePixelRatio,
                ))
            .toList();
        final path = Path()..addPolygon(points, true);
        canvas.drawPath(path, paint);
      } else {
        final rect = Rect.fromLTRB(
          item.bounds.left / devicePixelRatio,
          item.bounds.top / devicePixelRatio,
          item.bounds.right / devicePixelRatio,
          item.bounds.bottom / devicePixelRatio,
        );
        if (item is MlFaceObject) {
          canvas.drawRect(rect, paint);
          final idPainter = TextPainter(
            text: TextSpan(
              text: '${item.id}',
              style: TextStyle(
                color: color,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          idPainter.paint(canvas, rect.topLeft);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! MLItemsPainter ||
        oldDelegate.devicePixelRatio != devicePixelRatio ||
        oldDelegate.items != items ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }

  @override
  bool? hitTest(Offset position) {
    return false;
  }
}

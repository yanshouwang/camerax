import 'dart:math' as math;

import 'package:flutter/material.dart';

class ZoomDial extends StatelessWidget {
  final Size size;
  final double minimum;
  final double maximum;
  final double value;

  const ZoomDial({
    super.key,
    required this.size,
    required this.minimum,
    required this.maximum,
    required this.value,
  }) : assert(minimum > 0.0 &&
            minimum < maximum &&
            value >= minimum &&
            value <= maximum);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: _ZoomDialPainter(
        minimum: minimum.floor(),
        maximum: maximum.ceil(),
        value: value,
        textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}

class _ZoomDialPainter extends CustomPainter {
  final int minimum;
  final int maximum;
  final double value;
  final TextStyle? textStyle;

  _ZoomDialPainter({
    required this.minimum,
    required this.maximum,
    required this.value,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // debugPrint('ZSP $size');
    final width = size.width;
    final height = size.height;
    assert(width > height);
    final a = math.atan2(width / 2.0, height);
    final b = math.atan2(height, width / 2.0);
    final c = a - b;
    final radius = width / 2.0 / math.cos(c);
    canvas.translate(width / 2.0, radius);
    canvas.save();
    final angle = -math.pi / 180.0 * (value - minimum) * 20.0;
    canvas.rotate(angle);
    // debugPrint('ZSP center $center');
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black.withOpacity(0.5);
    canvas.drawCircle(
      Offset.zero,
      radius,
      paint,
    );
    // Draw scales
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.white;
    final y1 = -radius + 8.0;
    final y2 = y1 + 16.0;
    final count = (maximum - minimum) * 10 + 1;
    canvas.save();
    for (var i = 0; i < count; i++) {
      final large = i % 10 == 0;
      paint.color = large ? Colors.white : Colors.white.withOpacity(0.1);
      const scaleAngle = math.pi / 180.0 * 2.0;
      canvas.rotate(scaleAngle);
      final topCenter = Offset(0.0, y1);
      final bottomCenter = Offset(0.0, y2);
      // debugPrint('ZSP $topCenter, $bottomCenter');
      canvas.drawLine(topCenter, bottomCenter, paint);
      // Draw large number.
      if (!large) {
        continue;
      }
      final text = TextSpan(
        text: '${minimum + i ~/ 10}',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: text,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final offset = bottomCenter.translate(
        -textPainter.width / 2.0,
        textPainter.height / 2.0,
      );
      textPainter.paint(canvas, offset);
    }
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _ZoomDialPainter ||
        oldDelegate.minimum != minimum ||
        oldDelegate.maximum != maximum ||
        oldDelegate.value != value ||
        oldDelegate.textStyle != textStyle;
  }
}

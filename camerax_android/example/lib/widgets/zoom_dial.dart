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
        color: Theme.of(context).colorScheme.primary,
        textStyle: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class _ZoomDialPainter extends CustomPainter {
  final int minimum;
  final int maximum;
  final double value;
  final Color color;
  final TextStyle? textStyle;

  _ZoomDialPainter({
    required this.minimum,
    required this.maximum,
    required this.value,
    required this.color,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    assert(width > height);
    final a = math.atan2(width / 2.0, height);
    final b = math.atan2(height, width / 2.0);
    final c = a - b;
    final r0 = width / 2.0 / math.cos(c); // outer circle.
    final r1 = r0 - 8.0; // scale outer circle.
    const standardAngle = math.pi / 180.0;
    // Translate canvas.
    canvas.translate(width / 2.0, r0);
    // Draw background.
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black.withOpacity(0.5);
    canvas.drawCircle(
      Offset.zero,
      r0,
      paint,
    );
    canvas.save();
    // Clip canvas.
    const clipAngle = standardAngle;
    const strokeWidth = 1.0;
    final clipTopLeft = Offset(
      -r1 * math.sin(clipAngle),
      -r1 * math.cos(clipAngle),
    );
    final clipTopRight = Offset(
      r1 * math.sin(clipAngle),
      -r1 * math.cos(clipAngle),
    );
    // y = kx + b
    const k = 4.0;
    final b0 = clipTopLeft.dy - k * clipTopLeft.dx;
    const clipBottomLeftX = -strokeWidth / 2.0;
    const clipBottomRightX = strokeWidth / 2.0;
    final clipBottomY = k * clipBottomLeftX + b0;
    final clipPath = Path()
      ..moveTo(clipBottomRightX, clipBottomY)
      ..lineTo(clipTopRight.dx, clipTopRight.dy)
      ..arcToPoint(
        clipTopLeft,
        radius: Radius.circular(r1),
        largeArc: true,
      )
      ..lineTo(clipBottomLeftX, clipBottomY)
      ..close();
    canvas.clipPath(clipPath);
    // Rotate canvas by value.
    const scaleAngle = standardAngle * 2.0;
    final valueAngle = -scaleAngle * (value - minimum) * 10.0;
    canvas.rotate(valueAngle);
    // Draw scales.
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.white;
    final scaleTop = Offset(0.0, -r1);
    final scaleBottom = Offset(0.0, clipBottomY - 1.0);
    const scaleDistance = 16.0; // Distance between scale bottom and numbers.
    final count = (maximum - minimum) * 10 + 1;
    for (var i = 0; i < count; i++) {
      // Rotate canvas by scale.
      if (i > 0) {
        canvas.rotate(scaleAngle);
      }
      final isMajor = i % 10 == 0;
      paint.color = isMajor ? Colors.white : Colors.white.withOpacity(0.1);
      canvas.drawLine(scaleTop, scaleBottom, paint);
      // Draw major numbers.
      if (!isMajor) {
        continue;
      }
      final number = minimum + i ~/ 10;
      final numberClamp = (value - number).abs().clamp(0.1, 0.2) - 0.1;
      final numberFactor = numberClamp * 10.0;
      final text = TextSpan(
        text: '$number',
        style: textStyle?.copyWith(
          color: Colors.white.withOpacity(numberFactor),
        ),
      );
      final numberPainter = TextPainter(
        text: text,
        textScaler: TextScaler.linear(numberFactor),
        textDirection: TextDirection.ltr,
      )..layout();
      final numberOffset = scaleBottom.translate(
        -numberPainter.width / 2.0,
        scaleDistance - numberPainter.height / 2.0,
      );
      numberPainter.paint(canvas, numberOffset);
    }
    canvas.restore();
    // Draw indicator.
    const indicatorAngle = standardAngle / 2.0;
    final indicatorTopLeft = Offset(
      -r1 * math.sin(indicatorAngle),
      -r1 * math.cos(indicatorAngle),
    );
    final indicatorTopRight = Offset(
      r1 * math.sin(indicatorAngle),
      -r1 * math.cos(indicatorAngle),
    );
    final b1 = indicatorTopLeft.dy - k * indicatorTopLeft.dx;
    final indicatorPath = Path()
      ..moveTo(0.0, b1)
      ..lineTo(indicatorTopLeft.dx, indicatorTopLeft.dy)
      ..arcToPoint(
        indicatorTopRight,
        radius: Radius.circular(r1),
      )
      ..close();
    paint
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(indicatorPath, paint);
    // Draw value.
    final valuePainter = TextPainter(
      text: TextSpan(
        text: '${value.toStringAsFixed(1).replaceAll('.0', '')}x',
        style: textStyle?.copyWith(
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final valueOffset = scaleBottom.translate(
      -valuePainter.width / 2.0,
      scaleDistance - valuePainter.height / 2.0,
    );
    valuePainter.paint(canvas, valueOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _ZoomDialPainter ||
        oldDelegate.minimum != minimum ||
        oldDelegate.maximum != maximum ||
        oldDelegate.value != value ||
        oldDelegate.color != color ||
        oldDelegate.textStyle != textStyle;
  }
}

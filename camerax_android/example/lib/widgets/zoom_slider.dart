import 'dart:math' as math;

import 'package:flutter/material.dart';

class ZoomSlider extends StatefulWidget {
  final double minimum;
  final double maximum;
  final double value;

  const ZoomSlider({
    super.key,
    this.minimum = 1.0,
    this.maximum = 10.0,
    this.value = 1.0,
  }) : assert(minimum > 0.0 &&
            minimum < maximum &&
            value >= minimum &&
            value <= maximum);

  @override
  State<ZoomSlider> createState() => _ZoomSliderState();
}

class _ZoomSliderState extends State<ZoomSlider> {
  late final ValueNotifier<double> value;
  late Offset _beginPosition;

  @override
  void initState() {
    super.initState();
    value = ValueNotifier(0.0);
  }

  @override
  void dispose() {
    value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minimum = widget.minimum;
    final maximum = widget.maximum;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width * 0.3;
        final a = math.atan2(width / 2.0, height);
        final b = math.atan2(height, width / 2.0);
        final c = a - b;
        final radius = width / 2.0 / math.cos(c);
        final center = Offset(width / 2.0, radius);
        return GestureDetector(
          onPanStart: (details) {
            debugPrint('ZSP onPanStart');
            _beginPosition = details.localPosition;
          },
          onPanUpdate: (details) {
            debugPrint('ZSP onPointerMove');
            final beginPosition = _beginPosition - center;
            final endPositioin = details.localPosition - center;
            _beginPosition = details.localPosition;
            final beginAngle = math.atan2(beginPosition.dy, beginPosition.dx);
            final endAngle = math.atan2(endPositioin.dy, endPositioin.dx);
            final sweepAngle = endAngle - beginAngle;
            // debugPrint('ZSP sweepAngle $sweepAngle');
            final sweepValue = sweepAngle * 180.0 / math.pi * 0.1;
            final value = this.value.value - sweepValue;
            if (value < minimum) {
              this.value.value = minimum;
            } else if (value > maximum) {
              this.value.value = maximum;
            } else {
              this.value.value = value;
            }
          },
          child: ValueListenableBuilder(
            valueListenable: value,
            builder: (context, value, child) {
              return CustomPaint(
                size: Size(width, height),
                painter: _ZoomSliderPainter(
                  minimum: minimum.floor(),
                  maximum: maximum.ceil(),
                  value: value,
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ZoomSliderPainter extends CustomPainter {
  final int minimum;
  final int maximum;
  final double value;
  final TextStyle? textStyle;

  _ZoomSliderPainter({
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
    final angle = -math.pi / 180.0 * (value - minimum) * 10;
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
    final y1 = -radius * 0.98;
    final y2 = -radius * 0.92;
    final count = (maximum - minimum) * 10 + 1;
    canvas.save();
    for (var i = 0; i < count; i++) {
      final large = i % 10 == 0;
      paint.color = large ? Colors.white : Colors.white.withOpacity(0.5);
      const scaleAngle = math.pi / 180.0;
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
    return oldDelegate is! _ZoomSliderPainter ||
        oldDelegate.minimum != minimum ||
        oldDelegate.maximum != maximum ||
        oldDelegate.value != value ||
        oldDelegate.textStyle != textStyle;
  }
}

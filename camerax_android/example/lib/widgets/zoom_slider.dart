import 'dart:math' as math;

import 'package:flutter/material.dart';

class ZoomSlider extends StatefulWidget {
  const ZoomSlider({super.key});

  @override
  State<ZoomSlider> createState() => _ZoomSliderState();
}

class _ZoomSliderState extends State<ZoomSlider> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width * 0.3;
        return CustomPaint(
          size: Size(width, height),
          painter: _ZoomSliderPainter(
            value: 0.0,
          ),
        );
      },
    );
  }
}

class _ZoomSliderPainter extends CustomPainter {
  final double value;

  _ZoomSliderPainter({
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('ZSP $size');
    final width = size.width;
    final heigth = size.height;
    // Make sure the center is below this slider.
    assert(width > heigth);
    final a = math.atan2(width / 2.0, heigth);
    final b = math.atan2(heigth, width / 2.0);
    final c = a - b;
    final radius = width / 2.0 / math.cos(c);
    final center = Offset(width / 2.0, radius);
    debugPrint('ZSP center $center');
    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );
    final startAngle = math.pi + c;
    final sweepAngle = math.pi - c * 2.0;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black.withOpacity(0.5);
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is _ZoomSliderPainter && oldDelegate.value != value;
  }
}

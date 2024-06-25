import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'animated_tap_widget.dart';
import 'zoom_dial.dart';

class ZoomWidget extends StatefulWidget {
  final double minimum;
  final double maximum;
  final double value;
  final ValueChanged<double>? onChanged;

  const ZoomWidget({
    super.key,
    required this.minimum,
    required this.maximum,
    required this.value,
    required this.onChanged,
  });

  @override
  State<ZoomWidget> createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends State<ZoomWidget> {
  late final ValueNotifier<bool> _dialVisible;
  late final ValueNotifier<double> _dialValue;
  late Offset _beginPosition;

  Timer? _hideZoomSliderTimer;

  @override
  void initState() {
    super.initState();
    _dialVisible = ValueNotifier(false);
    _dialValue = ValueNotifier(1.0);
  }

  @override
  void dispose() {
    _dialVisible.dispose();
    _dialValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minimum = widget.minimum;
    final maximum = widget.maximum;
    const duration = Duration(milliseconds: 100);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width * 0.3;
        final a = math.atan2(width / 2.0, height);
        final b = math.atan2(height, width / 2.0);
        final c = a - b;
        final radius = width / 2.0 / math.cos(c);
        final center = Offset(width / 2.0, radius);
        return ValueListenableBuilder(
          valueListenable: _dialVisible,
          builder: (context, dialVisible, child) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedScale(
                  duration: duration,
                  scale: dialVisible ? 0.0 : 1.0,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildZoomButton(context, 1.0),
                      buildZoomButton(context, 2.0),
                      buildZoomButton(context, 3.0),
                    ],
                  ),
                ),
                ClipPath(
                  clipper: _ZoomDialClipper(),
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerDown: (event) {
                      // debugPrint('ZoomWidget onPointerDown');
                      _beginPosition = event.localPosition;
                      _cancelHideZoomDial();
                    },
                    onPointerMove: (event) {
                      // debugPrint('ZoomWidget onPointerMove');
                      final beginPoint = _beginPosition - center;
                      final endPoint = event.localPosition - center;
                      _beginPosition = event.localPosition;
                      if (!dialVisible) {
                        return;
                      }
                      final beginAngle =
                          math.atan2(beginPoint.dy, beginPoint.dx);
                      final endAngle = math.atan2(endPoint.dy, endPoint.dx);
                      final sweepAngle = endAngle - beginAngle;
                      // debugPrint('ZoomWidget sweepAngle $sweepAngle');
                      final oldValue = (_dialValue.value * 10).toInt() / 10.0;
                      final value =
                          _dialValue.value - sweepAngle * 90.0 / math.pi * 0.1;
                      if (value < minimum) {
                        _dialValue.value = minimum;
                      } else if (value > maximum) {
                        _dialValue.value = maximum;
                      } else {
                        _dialValue.value = value;
                      }
                      final newValue = (_dialValue.value * 10).toInt() / 10.0;
                      if (newValue == oldValue) {
                        return;
                      }
                      widget.onChanged?.call(newValue);
                    },
                    onPointerUp: (event) {
                      _hideZoomDialWhenTimeout();
                    },
                    child: AnimatedSlide(
                      duration: duration,
                      offset: Offset.zero.translate(
                        0.0,
                        dialVisible ? 0.0 : 1.0,
                      ),
                      curve: Curves.easeInOut,
                      child: ValueListenableBuilder(
                        valueListenable: _dialValue,
                        builder: (context, dialValue, child) {
                          return ZoomDial(
                            size: Size(width, height),
                            minimum: minimum,
                            maximum: maximum,
                            value: dialValue,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildZoomButton(BuildContext context, double value) {
    const duration = Duration(milliseconds: 100);
    return AnimatedTapWidget(
      duration: duration,
      onTap: () {
        widget.onChanged?.call(value);
        HapticFeedback.selectionClick();
      },
      onLongPress: () {
        _dialVisible.value = true;
        HapticFeedback.selectionClick();
      },
      onHorizontalDragStart: (details) {
        _dialVisible.value = true;
        HapticFeedback.selectionClick();
      },
      child: AnimatedScale(
        duration: duration,
        scale: value == widget.value ? 1.0 : 0.9,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: 32.0,
          height: 32.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.5),
          ),
          child: Text(
            value == widget.value ? '${value.toInt()}x' : '${value.toInt()}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: value == widget.value
                      ? Theme.of(context).colorScheme.primaryFixed
                      : Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  void _hideZoomDialWhenTimeout() {
    _hideZoomSliderTimer = Timer(
      const Duration(seconds: 1),
      () {
        _dialVisible.value = false;
      },
    );
  }

  void _cancelHideZoomDial() {
    _hideZoomSliderTimer?.cancel();
  }
}

class _ZoomDialClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final a = math.atan2(width / 2.0, height);
    final b = math.atan2(height, width / 2.0);
    final c = a - b;
    final radius = width / 2.0 / math.cos(c);
    final center = Offset(width / 2.0, radius);
    final oval = Rect.fromCircle(
      center: center,
      radius: radius,
    );
    final startAngle = math.pi + c;
    final sweepAngle = math.pi - c * 2.0;
    return Path()
      ..addArc(oval, startAngle, sweepAngle)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

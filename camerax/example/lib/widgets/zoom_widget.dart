import 'dart:async';
import 'dart:math' as math;

import 'package:camerax_example/util.dart';
import 'package:flutter/cupertino.dart';
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
  late Offset _beginPosition;

  late double _value;

  Timer? _hideZoomSliderTimer;

  @override
  void initState() {
    super.initState();
    _dialVisible = ValueNotifier(false);
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant ZoomWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  void dispose() {
    _dialVisible.dispose();
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
        final angle0 = math.atan2(width / 2.0, height);
        final angle1 = math.atan2(height, width / 2.0);
        final angle2 = angle0 - angle1;
        final r0 = width / 2.0 / math.cos(angle2);
        final center = Offset(width / 2.0, r0);
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
                      buildZoomButton(context, 1.0, 2.0),
                      if (maximum >= 2.0) buildZoomButton(context, 2.0, 3.0),
                      if (maximum >= 3.0)
                        buildZoomButton(context, 3.0, maximum + 1),
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
                      final oldValue = _value;
                      final value =
                          oldValue - sweepAngle * 90.0 / math.pi * 0.1;
                      if (value < minimum) {
                        _value = minimum;
                      } else if (value > maximum) {
                        _value = maximum;
                      } else {
                        _value = value;
                      }
                      final newValue = _value;
                      if (newValue == oldValue) {
                        return;
                      }
                      // debugPrint('ZoomWidget value changed $newValue');
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
                      child: ZoomDial(
                        size: Size(width, height),
                        minimum: minimum,
                        maximum: maximum,
                        value: widget.value,
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

  Widget buildZoomButton(BuildContext context, double minimum, double maximum) {
    const duration = Duration(milliseconds: 100);
    final selected = widget.value >= minimum && widget.value < maximum;
    final text = selected
        ? '${widget.value.trancateStringAsFixed(1).replaceAll('.0', '')}x'
        : minimum.toInt().toString();
    return AnimatedTapWidget(
      duration: duration,
      onTap: () {
        widget.onChanged?.call(minimum);
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
        scale: selected ? 1.0 : 0.8,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CupertinoColors.systemBackground
                .resolveFrom(context)
                .withOpacity(0.5),
          ),
          child: Text(
            text,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color:
                      selected ? CupertinoTheme.of(context).primaryColor : null,
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

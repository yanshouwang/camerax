import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class FlipWidget extends StatefulWidget {
  final Duration duration;
  final Widget front;
  final Widget back;
  final bool flip;

  const FlipWidget({
    super.key,
    required this.duration,
    required this.front,
    required this.back,
    this.flip = false,
  });

  @override
  State<FlipWidget> createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    if (widget.flip) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: 0.0,
      end: math.pi,
    ).animate(controller);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final radians = animation.value;
        return Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: radians > math.pi / 2.0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi + radians),
                child: widget.back,
              ),
            ),
            Visibility(
              visible: radians < math.pi / 2.0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(radians),
                child: widget.front,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant FlipWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      controller.duration = widget.duration;
    }
    if (widget.flip && !oldWidget.flip) {
      controller.forward();
    } else if (!widget.flip && oldWidget.flip) {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

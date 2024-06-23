import 'package:flutter/material.dart';

class AnimatedTapWidget extends StatefulWidget {
  final Duration duration;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final Widget? child;

  const AnimatedTapWidget({
    super.key,
    required this.duration,
    this.onTap,
    this.onLongPress,
    this.child,
  });

  @override
  State<AnimatedTapWidget> createState() => _AnimatedTapWidgetState();
}

class _AnimatedTapWidgetState extends State<AnimatedTapWidget> {
  late final ValueNotifier<double> scale;

  var tapping = false;
  var animating = false;

  @override
  void initState() {
    super.initState();
    scale = ValueNotifier(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      onTapDown: (details) {
        // debugPrint('ATW onTapDown');
        scale.value = 0.9;
        tapping = true;
        animating = true;
      },
      onTapUp: (details) {
        // debugPrint('ATW onTapUp');
        tapping = false;
        if (animating) {
          return;
        }
        scale.value = 1.0;
      },
      onTapCancel: () {
        // debugPrint('ATW onTapCancel');
        tapping = false;
        if (animating) {
          return;
        }
        scale.value = 1.0;
      },
      onLongPress: widget.onLongPress,
      // onLongPressDown: (details) {
      //   debugPrint('ATW onLongPressDown');
      // },
      // onLongPressUp: () {
      //   debugPrint('ATW onLongPressUp');
      // },
      // onLongPressStart: (details) {
      //   debugPrint('ATW onLongPressStart');
      // },
      // onLongPressEnd: (details) {
      //   debugPrint('ATW onLongPressEnd');
      // },
      // onLongPressCancel: () {
      //   debugPrint('ATW onLongPressCancel');
      // },
      child: ValueListenableBuilder(
        valueListenable: scale,
        builder: (context, scale, child) {
          return AnimatedScale(
            duration: widget.duration,
            scale: scale,
            onEnd: () {
              // debugPrint('ATW onEnd');
              animating = false;
              if (tapping) {
                return;
              }
              this.scale.value = 1.0;
            },
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    scale.dispose();
    super.dispose();
  }
}

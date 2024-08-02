import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class WheelView extends StatelessWidget {
  final Axis scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final double diameterRatio;
  final double perspective;
  final double offAxisFraction;
  final bool useMagnifier;
  final double magnification;
  final double overAndUnderCenterOpacity;
  final double itemExtent;
  final double squeeze;
  final ValueChanged<int>? onSelectedItemChanged;
  final bool renderChildrenOutsideViewport;
  final Clip clipBehavior;
  final String? restorationId;
  final ScrollBehavior? scrollBehavior;
  final List<Widget> children;

  const WheelView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    this.offAxisFraction = 0.0,
    this.useMagnifier = false,
    this.magnification = 1.0,
    this.overAndUnderCenterOpacity = 1.0,
    required this.itemExtent,
    this.squeeze = 1.0,
    this.onSelectedItemChanged,
    this.renderChildrenOutsideViewport = false,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scrollBehavior,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    if (scrollDirection == Axis.vertical) {
      return ListWheelScrollView(
        controller: controller,
        physics: physics,
        diameterRatio: diameterRatio,
        perspective: perspective,
        offAxisFraction: offAxisFraction,
        useMagnifier: useMagnifier,
        magnification: magnification,
        overAndUnderCenterOpacity: overAndUnderCenterOpacity,
        itemExtent: itemExtent,
        squeeze: squeeze,
        onSelectedItemChanged: onSelectedItemChanged,
        renderChildrenOutsideViewport: renderChildrenOutsideViewport,
        clipBehavior: clipBehavior,
        restorationId: restorationId,
        scrollBehavior: scrollBehavior,
        children: children,
      );
    } else {
      return RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView.useDelegate(
          controller: controller,
          physics: physics,
          diameterRatio: diameterRatio,
          perspective: perspective,
          offAxisFraction: offAxisFraction,
          useMagnifier: useMagnifier,
          magnification: magnification,
          overAndUnderCenterOpacity: overAndUnderCenterOpacity,
          itemExtent: itemExtent,
          squeeze: squeeze,
          onSelectedItemChanged: onSelectedItemChanged,
          renderChildrenOutsideViewport: renderChildrenOutsideViewport,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          scrollBehavior: scrollBehavior,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              return RotatedBox(
                quarterTurns: 1,
                child: children[index],
              );
            },
            childCount: children.length,
          ),
        ),
      );
    }
  }
}

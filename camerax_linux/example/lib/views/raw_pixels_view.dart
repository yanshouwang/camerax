import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

class RawPixelsView extends StatelessWidget {
  final ui.Image image;
  final int rotationDegrees;

  const RawPixelsView({
    super.key,
    required this.image,
    required this.rotationDegrees,
  });

  @override
  Widget build(BuildContext context) {
    final quarterTurns = rotationDegrees ~/ 90;
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: RawImage(
        image: image,
        fit: BoxFit.cover,
      ),
    );
  }
}

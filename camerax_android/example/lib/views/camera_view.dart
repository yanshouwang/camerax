import 'dart:io';

import 'package:camerax_android_example/view_models.dart';
import 'package:camerax_android_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:material_symbols_icons/symbols.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<CameraViewModel>(context);
    final zoomState = viewModel.zoomState;
    final flashMode = viewModel.flashMode;
    final savedUri = viewModel.savedUri;
    final thumbnail = savedUri == null ? null : File.fromUri(savedUri);
    final imageProxy = viewModel.imageProxy;
    final items = viewModel.items;
    return CupertinoPageScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  if (flashMode != null)
                    AnimatedTapWidget(
                      duration: const Duration(milliseconds: 100),
                      onTap: () {
                        switch (flashMode) {
                          case FlashMode.auto:
                            viewModel.setFlashMode(FlashMode.on);
                          case FlashMode.on:
                            viewModel.setFlashMode(FlashMode.off);
                          case FlashMode.off:
                            viewModel.setFlashMode(FlashMode.auto);
                        }
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CupertinoColors.quaternarySystemFill
                              .resolveFrom(context),
                        ),
                        child: Icon(
                          flashMode == FlashMode.auto
                              ? Symbols.flash_auto
                              : flashMode == FlashMode.on
                                  ? Symbols.flash_on
                                  : Symbols.flash_off,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PreviewView(
                  controller: viewModel.controller,
                  scaleType: ScaleType.fillCenter,
                ),
                if (imageProxy != null && items.isNotEmpty)
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: CustomPaint(
                      size: Size(
                        imageProxy.height.toDouble(),
                        imageProxy.width.toDouble(),
                      ),
                      painter: ItemsPainter(
                        items: items,
                        borderWidth:
                            2.0 * MediaQuery.devicePixelRatioOf(context),
                        color:
                            CupertinoColors.systemOrange.resolveFrom(context),
                      ),
                    ),
                  ),
                if (zoomState != null)
                  ZoomWidget(
                    minimum: zoomState.minZoomRatio,
                    maximum: zoomState.maxZoomRatio,
                    value: zoomState.zoomRatio,
                    onChanged: (value) {
                      viewModel.setZoomRatio(value).ignore();
                    },
                  ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 48.0,
                // child: DefaultTabController(
                //   length: 3,
                //   child: TabBarView(
                //     viewportFraction: 1 / 5,
                //     // physics: BouncingScrollPhysics(),
                //     children: [
                //       Center(child: Text('Photo')),
                //       Center(child: Text('Code')),
                //       Center(child: Text('Face')),
                //     ],
                //   ),
                // ),
                child: WheelView(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 100.0,
                  children: [
                    Text('Photo'),
                    Text('Code'),
                    Text('Face'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedTapWidget(
                    duration: const Duration(milliseconds: 100),
                    onTap: () {},
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: CupertinoColors.quaternarySystemFill
                        //     .resolveFrom(context),
                        image: thumbnail == null
                            ? null
                            : DecorationImage(
                                image: FileImage(thumbnail),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {
                                  Logger.root.shout(
                                    exception,
                                    exception,
                                    stackTrace,
                                  );
                                },
                              ),
                      ),
                      child: thumbnail == null
                          ? Icon(
                              Symbols.image,
                              color: CupertinoColors.label.resolveFrom(context),
                            )
                          : null,
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: CupertinoColors.label.resolveFrom(context),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedTapWidget(
                      duration: const Duration(milliseconds: 100),
                      onTap: () {
                        viewModel.takePicture();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                    ),
                  ),
                  AnimatedTapWidget(
                    duration: const Duration(milliseconds: 100),
                    onTap: () {
                      viewModel.toggleLensFacing();
                    },
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CupertinoColors.quaternarySystemFill
                            .resolveFrom(context),
                      ),
                      child: FlipWidget(
                        duration: const Duration(milliseconds: 100),
                        front: Icon(
                          Symbols.camera_front,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                        back: Transform.flip(
                          flipX: true,
                          child: Icon(
                            Symbols.camera_rear,
                            color: CupertinoColors.label.resolveFrom(context),
                          ),
                        ),
                        flip: viewModel.lensFacing == LensFacing.back,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemsPainter extends CustomPainter {
  final List<MLObject> items;
  final double borderWidth;
  final Color color;

  ItemsPainter({
    required this.items,
    required this.borderWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.bevel
      ..color = color;
    for (var item in items) {
      if (item is MLCodeObject) {
        final points = item.corners
            .map((point) => Offset(
                  point.x.toDouble(),
                  point.y.toDouble(),
                ))
            .toList();
        final path = Path()..addPolygon(points, true);
        canvas.drawPath(path, paint);
      } else {
        final rect = Rect.fromLTRB(
          item.bounds.left.toDouble(),
          item.bounds.top.toDouble(),
          item.bounds.right.toDouble(),
          item.bounds.bottom.toDouble(),
        );
        if (item is MLFaceObject) {
          canvas.drawRect(rect, paint);
          final idPainter = TextPainter(
            text: TextSpan(
              text: '${item.id}',
              style: TextStyle(
                color: color,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout();
          final offset = Offset(
            item.bounds.topLeft.x.toDouble(),
            item.bounds.topLeft.y.toDouble(),
          );
          idPainter.paint(canvas, offset);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! ItemsPainter ||
        oldDelegate.items != items ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.color != color;
  }

  @override
  bool? hitTest(Offset position) {
    return false;
  }
}

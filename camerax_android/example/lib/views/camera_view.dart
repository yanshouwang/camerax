import 'dart:io';

import 'package:camerax_android_example/models.dart';
import 'package:camerax_android_example/view_models.dart';
import 'package:camerax_android_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:material_symbols_icons/symbols.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1 / 5,
    );
  }

  Offset? _onPanStartPosition;
  double? _onPanUpdateDx;

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<CameraViewModel>(context);
    final mode = viewModel.mode;
    final zoomState = viewModel.zoomState;
    final flashMode = viewModel.flashMode;
    final savedUri = viewModel.savedUri;
    final thumbnail = savedUri == null ? null : File.fromUri(savedUri);
    final items = viewModel.items;
    const pageDuration = Duration(milliseconds: 300);
    const pageCurve = Curves.ease;
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
              // alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: [
                PreviewView(
                  controller: viewModel.controller,
                  scaleType: ScaleType.fillCenter,
                ),
                if (items.isNotEmpty)
                  CustomPaint(
                    painter: ItemsPainter(
                      context: context,
                      items: items,
                      borderWidth: 2.0,
                      color: CupertinoColors.systemOrange.resolveFrom(context),
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
              GestureDetector(
                onPanStart: (details) {
                  debugPrint('onPanStart: ${details.localPosition}');
                  _onPanStartPosition = details.localPosition;
                },
                onPanDown: (details) {
                  debugPrint('onPanDown ${details.localPosition}');
                },
                onPanUpdate: (details) {
                  debugPrint('onPanUpdate: ${details.delta.dx}');
                  final startPosition = _onPanStartPosition;
                  if (startPosition == null) {
                    return;
                  }
                  final previousDx = _onPanUpdateDx;
                  final dx = details.delta.dx;
                  if (previousDx != null &&
                      previousDx != 0.0 &&
                      dx != 0.0 &&
                      dx.sign != previousDx.sign) {
                    debugPrint(
                        'onPanUpdate null ${dx.sign}, ${previousDx.sign}');
                    _onPanStartPosition = null;
                    _onPanUpdateDx = null;
                  } else {
                    _onPanUpdateDx = dx;
                    final updatePosition = details.localPosition;
                    final distance =
                        (updatePosition.dx - startPosition.dx).abs();
                    debugPrint('onPanUpdate distance $distance');
                    if (distance > 20.0) {
                      final page = _pageController.page;
                      if (page == null) {
                        return;
                      }
                      if (dx > 0 && page > 0) {
                        _pageController.previousPage(
                          duration: pageDuration,
                          curve: pageCurve,
                        );
                      } else if (dx < 0 && page < 2) {
                        _pageController.nextPage(
                          duration: pageDuration,
                          curve: pageCurve,
                        );
                      }
                      _onPanStartPosition = null;
                      _onPanUpdateDx = null;
                    }
                  }
                },
                onPanEnd: (details) {
                  debugPrint('onPanEnd: ${details.velocity}');
                  _onPanStartPosition = null;
                  _onPanUpdateDx = null;
                },
                onPanCancel: () {
                  debugPrint('onPanCancel');
                  _onPanStartPosition = null;
                  _onPanUpdateDx = null;
                },
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  height: 48.0,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      switch (index) {
                        case 0:
                          viewModel.setMode(CameraMode.takePicture);
                          break;
                        case 1:
                          viewModel.setMode(CameraMode.scanCode);
                          break;
                        case 2:
                          viewModel.setMode(CameraMode.scanFace);
                          break;
                        default:
                      }
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            0,
                            duration: pageDuration,
                            curve: pageCurve,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Photo',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: mode == CameraMode.takePicture
                                      ? CupertinoTheme.of(context).primaryColor
                                      : null,
                                ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            1,
                            duration: pageDuration,
                            curve: pageCurve,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Code',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: mode == CameraMode.scanCode
                                      ? CupertinoTheme.of(context).primaryColor
                                      : null,
                                ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            2,
                            duration: pageDuration,
                            curve: pageCurve,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Face',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: mode == CameraMode.scanFace
                                      ? CupertinoTheme.of(context).primaryColor
                                      : null,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ItemsPainter extends CustomPainter {
  final BuildContext context;
  final List<MLObject> items;
  final double borderWidth;
  final Color color;

  ItemsPainter({
    required this.context,
    required this.items,
    required this.borderWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('DRAW ON $size');
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.bevel
      ..color = color;
    for (var item in items) {
      if (item is MLCodeObject) {
        debugPrint('MLCode ${item.corners}');
        final points = item.corners
            .map((point) => Offset(
                  point.x / devicePixelRatio,
                  point.y / devicePixelRatio,
                ))
            .toList();
        final path = Path()..addPolygon(points, true);
        canvas.drawPath(path, paint);
      } else {
        final rect = Rect.fromLTRB(
          item.bounds.left / devicePixelRatio,
          item.bounds.top / devicePixelRatio,
          item.bounds.right / devicePixelRatio,
          item.bounds.bottom / devicePixelRatio,
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
          idPainter.paint(canvas, rect.topLeft);
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

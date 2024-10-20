import 'package:camerax_ios_example/models.dart';
import 'package:camerax_ios_example/view_models.dart';
import 'package:camerax_ios_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'raw_pixels_view.dart';
import 'thumbnail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController _pageController;

  Offset? _onPanStartPosition;
  double? _onPanUpdateDx;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1 / 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<HomeViewModel>(context);
    final controller = viewModel.controller;
    final mode = viewModel.mode;
    final zoomState = viewModel.zoomState;
    final flashMode = viewModel.flashMode;
    final savedUri = viewModel.savedUri;
    final recording = viewModel.recording;
    final imageModel = viewModel.imageModel;
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
              alignment: Alignment.bottomCenter,
              children: [
                PreviewView(
                  controller: controller,
                  scaleType: ScaleType.fillCenter,
                ),
                if (imageModel != null)
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 100.0,
                      child: RawPixelsView(
                        image: imageModel.image,
                        rotationDegrees: imageModel.rotationDegrees,
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
              GestureDetector(
                onPanStart: (details) {
                  _onPanStartPosition = details.localPosition;
                },
                onPanUpdate: (details) {
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
                    _onPanStartPosition = null;
                    _onPanUpdateDx = null;
                  } else {
                    _onPanUpdateDx = dx;
                    final updatePosition = details.localPosition;
                    final distance =
                        (updatePosition.dx - startPosition.dx).abs();
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
                  _onPanStartPosition = null;
                  _onPanUpdateDx = null;
                },
                onPanCancel: () {
                  _onPanStartPosition = null;
                  _onPanUpdateDx = null;
                },
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  height: 48.0,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      final mode = CameraMode.values[index];
                      viewModel.setMode(mode);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            CameraMode.takePicture.index,
                            duration: pageDuration,
                            curve: pageCurve,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Picture',
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
                            CameraMode.recordVideo.index,
                            duration: pageDuration,
                            curve: pageCurve,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Video',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: mode == CameraMode.recordVideo
                                      ? CupertinoTheme.of(context).primaryColor
                                      : null,
                                ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            CameraMode.rawValue.index,
                            duration: pageDuration,
                            curve: pageCurve,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Raw',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: mode == CameraMode.rawValue
                                      ? CupertinoTheme.of(context).primaryColor
                                      : null,
                                ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            CameraMode.scanCode.index,
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
                            CameraMode.scanFace.index,
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
                    onTap: savedUri == null
                        ? null
                        : () {
                            context.go('/viewer?uri=${savedUri.toFilePath()}');
                          },
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: savedUri == null
                          ? Icon(
                              Symbols.image,
                              color: CupertinoColors.label.resolveFrom(context),
                            )
                          : Thumbnail(
                              uri: savedUri,
                            ),
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
                      onTap: mode == CameraMode.takePicture ||
                              mode == CameraMode.recordVideo
                          ? () {
                              if (mode == CameraMode.takePicture) {
                                viewModel.takePicture();
                              } else if (recording) {
                                viewModel.stopRecording();
                              } else {
                                viewModel.startRecording();
                              }
                            }
                          : null,
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: recording
                              ? CupertinoColors.systemRed.resolveFrom(context)
                              : CupertinoColors.label.resolveFrom(context),
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
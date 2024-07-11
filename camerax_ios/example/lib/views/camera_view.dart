import 'dart:io';

import 'package:camerax_ios_example/view_models.dart';
import 'package:camerax_ios_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:camerax_android_example/view_models.dart';
import 'package:camerax_android_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ValueNotifier<bool> _zoomSliderVisible;

  Timer? _hideZoomSliderTimer;

  @override
  void initState() {
    super.initState();
    _zoomSliderVisible = ValueNotifier(false);
  }

  @override
  void dispose() {
    _zoomSliderVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _zoomSliderVisible,
              builder: (context, zoomSliderVisible, child) {
                const duration = Duration(milliseconds: 100);
                return Listener(
                  onPointerMove: (event) {
                    debugPrint('HomeView onPointerMove ${event.localPosition}');
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PreviewWidget(
                        controller: viewModel.cameraController,
                        scaleType: ScaleType.fillCenter,
                      ),
                      AnimatedScale(
                        duration: duration,
                        scale: zoomSliderVisible ? 0.0 : 1.0,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildZoomRatioButton(context, 1),
                            buildZoomRatioButton(context, 2),
                            buildZoomRatioButton(context, 3),
                          ],
                        ),
                      ),
                      ClipRect(
                        child: AnimatedSlide(
                          duration: duration,
                          offset: Offset.zero.translate(
                            0.0,
                            zoomSliderVisible ? 0.0 : 1.0,
                            // 0.0,
                          ),
                          curve: Curves.easeInOut,
                          child: const ZoomSlider(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedTapWidget(
                duration: const Duration(milliseconds: 100),
                onTap: () {},
                child: Material(
                  type: MaterialType.button,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.primary,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 24.0,
                      sigmaY: 24.0,
                    ),
                    child: SizedBox(
                      width: 48.0,
                      height: 48.0,
                      child: Icon(
                        Symbols.image,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  shape: BoxShape.circle,
                ),
                child: AnimatedTapWidget(
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              AnimatedTapWidget(
                duration: const Duration(milliseconds: 100),
                onTap: () {
                  viewModel.toggleLensFacing();
                },
                child: Material(
                  type: MaterialType.button,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.primary,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 24.0,
                      sigmaY: 24.0,
                    ),
                    child: SizedBox(
                      width: 48.0,
                      height: 48.0,
                      child: Icon(
                        viewModel.lensFacing == LensFacing.back
                            ? Symbols.camera_rear
                            : Symbols.camera_front,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget buildZoomRatioButton(BuildContext context, double zoomRatio) {
    final viewModel = ViewModel.of<HomeViewModel>(context);
    final scale = viewModel.zoomRatio == zoomRatio ? 1.0 : 0.9;
    return AnimatedTapWidget(
      duration: const Duration(milliseconds: 100),
      onTap: () {
        viewModel.setZoomRatio(zoomRatio);
        HapticFeedback.selectionClick();
      },
      onLongPress: () {
        _zoomSliderVisible.value = true;
        HapticFeedback.selectionClick();
        _hideZoomSliderWhenTimeout();
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: scale,
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
            viewModel.zoomRatio == zoomRatio
                ? '${zoomRatio.toInt()}X'
                : '${zoomRatio.toInt()}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: viewModel.zoomRatio == zoomRatio
                      ? Theme.of(context).colorScheme.primaryFixed
                      : Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  void _hideZoomSliderWhenTimeout() {
    _hideZoomSliderTimer = Timer(
      const Duration(seconds: 3),
      () {
        _zoomSliderVisible.value = false;
      },
    );
  }

  void _cancelHideZoomSlider() {
    _hideZoomSliderTimer?.cancel();
  }
}
